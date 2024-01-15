//
//  PersonListView.swift
//  StarWars
//
//  Created by James Milton on 31/10/2023.
//

import SwiftUI

@MainActor
struct PersonListView: View {
    @State private var people = [Person]()
    @State private var isLoading = false
    @State private var isLoggingOut = false
    private let peopleService = PeopleService()
    private let userService = UserService()
    
    var body: some View {
        NavigationView {
            if isLoggingOut || !UserSession.current.isLoggedIn {
                ProgressView()
            } else {
                List {
                    Section {
                        ForEach(people, id: \.name) { person in
                            PersonListRow(person: person)
                        }
                    }
                    
                    if isLoading {
                        ProgressView()
                    } else if peopleService.hasMore {
                        Button("Load more") {
                            Task {
                                await load(isLoading: $isLoading) {
                                    try await loadMorePeople()
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Star Wars")
                .toolbar {
                    Button("Logout") {
                        Task {
                            await load(isLoading: $isLoggingOut) {
                                try await userService.logout()
                            }
                        }
                    }.disabled(isLoading)
                }
            }
        }
        .task {
            await load(isLoading: $isLoading) {
                try await loadMorePeople()
            }
        }
    }
    
    func loadMorePeople() async throws {
        try await people += peopleService.getPeople()
    }
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView()
    }
}
