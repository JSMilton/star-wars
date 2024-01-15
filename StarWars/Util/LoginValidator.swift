//
//  LoginValidator.swift
//  StarWars
//
//  Created by James Milton on 14/01/2024.
//

import Foundation

struct LoginValidator {
    
    static func validateEmail(_ email: String) throws {
        let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .caseInsensitive)
        let isValid = regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) != nil
        
        if !isValid || email.isEmpty {
            throw GenericError(message: "Please enter a valid email address")
        }
    }
    
    static func validatePassword(_ password: String) throws {
        if password.count < 8 {
            throw GenericError(message: "Your password must be 8 characters or more")
        }
    }
}
