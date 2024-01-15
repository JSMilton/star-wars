//
//  StarWarsApp.swift
//  StarWars
//
//  Created by James Milton on 31/10/2023.
//

import SwiftUI

@main
struct StarWarsApp: App {
    @StateObject var session = UserSession.current
    
    var body: some Scene {
        WindowGroup {
            if session.isLoggedIn {
                PersonListView()
                    .transition(AnyTransition.opacity.animation(.linear(duration: 0.25)))
                    .showError()
            } else {
                LoginView()
                    .transition(AnyTransition.opacity.animation(.linear(duration: 0.25)))
                    .showError()
            }
        }
    }
}
