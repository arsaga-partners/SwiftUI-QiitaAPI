//
//  PostListViewModel.swift
//  SwiftUI-QiitaAPI
//
//  Created by s.asakura on 2023/05/11.
//

import Foundation
import Combine

class PostListViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var error: Error?
    
    private let api: QiitaAPI
    
    init(api: QiitaAPI = .init()) {
        self.api = api
    }
    
    func fetchPosts() async {
        do {
            self.posts = try await api.fetchPosts()
            self.error = nil
        } catch {
            self.error = error
        }
    }
}
