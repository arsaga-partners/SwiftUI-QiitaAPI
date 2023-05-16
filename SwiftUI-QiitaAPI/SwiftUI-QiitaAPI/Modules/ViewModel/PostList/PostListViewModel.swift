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
            let fetchedPosts = try await QiitaRepository.fetchPosts()
            DispatchQueue.main.async {
                self.posts = fetchedPosts
                self.error = nil
            }
        } catch {
            DispatchQueue.main.async {
                self.error = error
            }
        }
    }
}
