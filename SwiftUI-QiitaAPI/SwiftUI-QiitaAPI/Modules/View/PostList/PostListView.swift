//
//  PostListView.swift
//  SwiftUI-QiitaAPI
//
//  Created by s.asakura on 2023/05/11.
//

import SwiftUI

struct PostListView: View {
    @StateObject private var viewModel = PostListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                } else {
                    List(viewModel.posts) { post in
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.headline)
                            Text(post.url)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Posts")
            .task {
                await viewModel.fetchPosts()
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
