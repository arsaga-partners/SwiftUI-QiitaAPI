//
//  Post.swift
//  SwiftUI-QiitaAPI
//
//  Created by s.asakura on 2023/05/11.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: String
    let title: String
    let url: String
}
