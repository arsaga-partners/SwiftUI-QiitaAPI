//
//  PostListDetailView.swift
//  SwiftUI-QiitaAPI
//
//  Created by s.asakura on 2023/05/11.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post

    var body: some View {
        WebView(url: URL(string: post.url)!)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image("qiita")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.vertical, -5)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}
