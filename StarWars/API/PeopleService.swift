//
//  PeopleService.swift
//  StarWars
//
//  Created by James Milton on 31/10/2023.
//

import Foundation

class PeopleService {
    var hasMore: Bool {
        guard let info = pageInfo else {
            return true
        }
        
        return info.next != nil
    }
    
    private var pageInfo: PageInfo?
    private let api: APIClientType
    
    init(api: APIClientType = APIClient.shared) {
        self.api = api
    }
    
    func getPeople() async throws -> [Person] {
        let response: PagedResponse<[Person]> = try await api.fetch(endpoint: pageInfo?.next ?? Endpoints.people())
        pageInfo = PageInfo(next: response.next)
        
        return response.results
    }
    
    func resetPaging() {
        pageInfo = nil
    }
}

struct PageInfo {
    let next: String?
}

struct PagedResponse<T: Codable>: Codable {
    let next: String?
    let results: T
}
