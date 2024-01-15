//
//  LoadingTask.swift
//  StarWars
//
//  Created by James Milton on 21/11/2023.
//

import SwiftUI

extension View {
    @MainActor
    func load(isLoading: Binding<Bool>, work: () async throws -> Void) async {
        isLoading.wrappedValue = true
        
        do {
            try await work()
        } catch let error {
            Errors.shared.errors.append(error)
        }
        
        isLoading.wrappedValue = false
    }
}
