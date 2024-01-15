//
//  LoginView.swift
//  StarWars
//
//  Created by James Milton on 14/01/2024.
//

import SwiftUI

struct TextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .cornerRadius(6)
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.black, lineWidth: 1)
            }
    }
}

@MainActor
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @FocusState private var emailIsFocused: Bool
    @FocusState private var passwordIsFocused: Bool
    
    var body: some View {
        if isLoading {
            ProgressView()
        } else {
            VStack {
                TextField("Email", text: $email)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .modifier(TextFieldStyle())
                    .focused($emailIsFocused)

                SecureField("Password", text: $password)
                    .modifier(TextFieldStyle())
                    .focused($passwordIsFocused)
                
                Button() {
                    emailIsFocused = false
                    passwordIsFocused = false
                    
                    Task {
                        await load(isLoading: $isLoading) {
                            try await UserService().login(email: email, password: password)
                        }
                    }
                } label: {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                }
                .padding(.top, 16)
                .buttonStyle(.borderedProminent)
                
            }
            .padding(30)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
