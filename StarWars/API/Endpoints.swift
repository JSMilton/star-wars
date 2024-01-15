//
//  Endpoints.swift
//  StarWars
//
//  Created by James Milton on 14/01/2024.
//

import Foundation

struct Endpoints {
    static private let baseURL = "https://swapi.dev/api"
    
    static func people() -> String {
        return baseURL + "/people"
    }
}
