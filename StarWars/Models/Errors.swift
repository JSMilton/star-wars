//
//  Errors.swift
//  StarWars
//
//  Created by James Milton on 31/10/2023.
//

import Foundation

struct GenericError: Error {
    let message: String
    
    init(message: String = "Something went wrong") {
        self.message = message
    }
}

extension GenericError: LocalizedError {
    var errorDescription: String? {
        return message
    }
}

@MainActor
class Errors: ObservableObject {
    static let shared = Errors()
    
    @Published var errors = [Error]()
}
