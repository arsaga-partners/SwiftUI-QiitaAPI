//
//  APIError.swift
//  SwiftUI-QiitaAPI
//
//  Created by s.asakura on 2023/05/12.
//

import Foundation

struct APIError: Codable, Error {
    let message: String?
    let errors: [APIErrorElement]?
}

struct APIErrorElement: Codable {
    let type: String
    let messages: [String]
}
