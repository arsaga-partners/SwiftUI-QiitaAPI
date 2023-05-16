//
//  QiitaAPIRequest.swift
//  SwiftUI-QiitaAPI
//
//  Created by s.asakura on 2023/05/12.
//

import Alamofire
import Foundation

struct QiitaAPIRequest: APIRequestable {

    var path: String

    var method: HTTPMethod

    var parameters: Parameters

    init(path: String, method: HTTPMethod, parameters: Parameters) {
        self.path = path
        self.method = method
        self.parameters = parameters
    }
}
