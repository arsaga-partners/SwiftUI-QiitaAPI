//
//  QiitaAPI.swift
//  SwiftUI-QiitaAPI
//
//  Created by s.asakura on 2023/05/11.
//

import Foundation
import Combine

class QiitaAPI {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }

    func fetchPosts() async throws -> [Post] {
        let url = URL(string: "https://qiita.com/api/v2/items")!
        let (data, _) = try await session.data(from: url)
        let posts = try decoder.decode([Post].self, from: data)
        return posts
    }
}
