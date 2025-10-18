import SwiftUI

struct UIKitTextViewDemo: View {
    @State private var text = "Type here… (UIKit UITextView wrapped in SwiftUI)"

    var body: some View {
        VStack(spacing: 12) {
            UITextViewWrapper(text: $text)
                .frame(minHeight: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            Text("Characters: \(text.count)")
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .navigationTitle("UIKit: UITextView")
    }
}
