//
//  UserSession.swift
//  StarWars
//
//  Created by James Milton on 14/01/2024.
//

import Foundation

protocol UserSessionType: AnyObject {
    var isLoggedIn: Bool { get set }
}

class UserSession: ObservableObject, UserSessionType {
    static let current = UserSession()
    
    @Published var isLoggedIn = false
}
