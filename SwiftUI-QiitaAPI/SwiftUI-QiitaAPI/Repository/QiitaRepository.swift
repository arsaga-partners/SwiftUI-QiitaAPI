//
//  QiitaRepository.swift
//  SwiftUI-QiitaAPI
//
//  Created by s.asakura on 2023/05/12.
//

import Combine
import Foundation

actor QiitaRepository {
    
    typealias API = APIRoute
     
    static func fetchPosts() async throws -> [Post] {
        let request = QiitaAPIRequest(path: APIConst.item, method: .get, parameters: [:])
        print("request",request)
        return try await API.request(request, body: [Post].self)
    }
    
}

