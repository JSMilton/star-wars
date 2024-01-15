//
//  UserService.swift
//  StarWars
//
//  Created by James Milton on 14/01/2024.
//

import Foundation

class UserService {
    private let session: UserSessionType
    
    init (session: UserSessionType = UserSession.current) {
        self.session = session
    }
    
    func login(email: String, password: String) async throws {
        if session.isLoggedIn {
            return
        }
        
        try LoginValidator.validateEmail(email)
        try LoginValidator.validatePassword(password)
        
        try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.session.isLoggedIn = true
                continuation.resume()
            }
        }
    }
    
    func logout() async throws {
        if !session.isLoggedIn {
            return
        }
        
        try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.session.isLoggedIn = false
                continuation.resume()
            }
        }
    }
    
}
