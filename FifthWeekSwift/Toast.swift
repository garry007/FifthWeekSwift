import SwiftUI

struct Toast: ViewModifier {
    @Binding var isPresented: Bool
    let message: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            if isPresented {
                Text(message)
                    .padding(.horizontal, 16).padding(.vertical, 10)
                    .background(.black.opacity(0.8))
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                    .padding(.bottom, 24)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .animation(.easeInOut(duration: 0.25), value: isPresented)
    }
}

extension View {
    func toast(isPresented: Binding<Bool>, message: String) -> some View {
        modifier(Toast(isPresented: isPresented, message: message))
    }
}
