import SwiftUI

struct FormValidationDemo: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isValid = false

    var body: some View {
        Form {
            Section("Login") {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $password)
            }

            Section("Rules") {
                Label(isEmailValid(email) ? "✓ Valid Email" : "✗ Invalid Email", systemImage: isEmailValid(email) ? "checkmark.seal" : "xmark.seal")
                Label(isPasswordStrong(password) ? "✓ Strong Password" : "✗ Weak Password", systemImage: isPasswordStrong(password) ? "checkmark.seal" : "xmark.seal")
            }

            Button("Submit") { isValid = isEmailValid(email) && isPasswordStrong(password) }
                .disabled(!(isEmailValid(email) && isPasswordStrong(password)))
        }
        .navigationTitle("Form Validations")
        .alert("Form Status", isPresented: $isValid) {
        } message: {
            Text("Looks good! Ready to submit.")
        }
    }
}

// MARK: - Validators
private func isEmailValid(_ s: String) -> Bool {
    let pattern = #"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"#
    return s.range(of: pattern, options: [.regularExpression, .caseInsensitive]) != nil
}

private func isPasswordStrong(_ s: String) -> Bool {
    // >=8 chars, one upper, one lower, one digit
    let pattern = #"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,}$"#
    return s.range(of: pattern, options: .regularExpression) != nil
}
