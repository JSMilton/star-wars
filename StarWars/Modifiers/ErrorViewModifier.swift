//
//  ErrorViewModifier.swift
//  StarWars
//
//  Created by James Milton on 21/11/2023.
//

import SwiftUI

struct ShowError: ViewModifier {
    @StateObject var errors = Errors.shared
    
    func body(content: Content) -> some View {
        content.alert("Uh oh!", isPresented: .constant(!errors.errors.isEmpty)) {
            Button("OK") {
                errors.errors.remove(at: 0)
            }
        } message: {
            Text(errors.errors.first?.localizedDescription ?? "")
        }
    }
}

extension View {
    func showError() -> some View {
        modifier(ShowError())
    }
}
