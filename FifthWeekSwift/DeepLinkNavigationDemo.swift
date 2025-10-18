import SwiftUI

struct DeepLinkNavigationDemo: View {
    @State private var inputURL = "myapp://feature/formValidation?prefill=email"
    @State private var path = NavigationPath()
    @State private var message: String?

    var body: some View {
        NavigationStack(path: $path) {
            Form {
                Section("Simulate a deep link") {
                    TextField("deeplink URL", text: $inputURL)
                        .keyboardType(.URL)
                    Button("Open URL") { handle(urlString: inputURL) }
                }
                if let message { Text(message).foregroundStyle(.secondary) }
            }
            .navigationDestination(for: Feature.self) { feature in
                feature.destination
            }
            .navigationTitle("Deep Link Demo")
            .toolbar { ToolbarItem(placement: .topBarTrailing) { Button("Reset"){ path.removeLast(path.count) } } }
        }
    }

    private func handle(urlString: String) {
        guard let url = URL(string: urlString) else { message = "Invalid URL"; return }
        // Supported: myapp://feature/<featureCase>?prefill=email
        guard url.host == "feature" else { message = "Unsupported host"; return }
        let featureName = url.pathComponents.dropFirst().first ?? ""
        if let feature = Feature.allCases.first(where: { $0.rawValue.lowercased() == featureName.lowercased() }) {
            if feature == .formValidation, let comps = URLComponents(url: url, resolvingAgainstBaseURL: false),
               comps.queryItems?.first(where: { $0.name == "prefill" && $0.value == "email" }) != nil {
                // Push two screens: list -> formValidation with prefill
                path.append(feature)
            } else {
                path.append(feature)
            }
            message = "Navigated to: \(feature.title)"
        } else {
            message = "Unknown feature: \(featureName)"
        }
    }
}
