//
//  APIResult.swift
//  SwiftUI-QiitaAPI
//
//  Created by s.asakura on 2023/05/12.
//

import Foundation

enum APIResult<Success: Decodable>: Decodable {
    case success(Success)
    case failure(APIError)
}

extension APIResult {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            self = .success(try container.decode(Success.self))
        } catch {
            self = .failure(try container.decode(APIError.self))
        }
    }
}
