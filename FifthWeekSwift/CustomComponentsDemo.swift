import SwiftUI

struct CustomComponentsDemo: View {
    @State private var showToast = false

    var body: some View {
        VStack(spacing: 20) {
            FancyButton(title: "Show Toast") { showToast = true }
            Text("Reusable components speed up feature work.").foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .toast(isPresented: $showToast, message: "Saved successfully!")
        .onChange(of: showToast) { _, newValue in
            if newValue { DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { showToast = false } }
        }
        .navigationTitle("Custom Components")
    }
}
