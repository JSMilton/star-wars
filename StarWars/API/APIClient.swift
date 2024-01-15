//
//  APIClient.swift
//  StarWars
//
//  Created by James Milton on 31/10/2023.
//

import Foundation
import Alamofire

protocol APIClientType: AnyObject {
    func fetch<T: Decodable>(endpoint: String) async throws -> T
}

class APIClient: APIClientType {
    static let shared = APIClient()
    
    func fetch<T: Decodable>(endpoint: String) async throws -> T {
        let result = await AF.request(endpoint).serializingDecodable(T.self).result
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
}
