//
//  APIRequestable.swift
//  SwiftUI-QiitaAPI
//
//  Created by s.asakura on 2023/05/12.
//

import Alamofire
import Foundation

protocol APIRequestable: URLRequestConvertible {

    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }

}

extension APIRequestable {

    var baseURL: URL {
        return URL(string: APIConst.BASE_URL + APIConst.VERSION)!
    }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        let request = try URLRequest(url: url,
                                     method: method)

        let encording: ParameterEncoding = {
            switch method {
            case .post, .put, .patch:
                return JSONEncoding.default
            default:
                return URLEncoding.default
            }
        }()
        return try encording.encode(request, with: parameters)
    }
}
