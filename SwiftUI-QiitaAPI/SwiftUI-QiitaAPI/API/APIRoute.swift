//
//  APIRoute.swift
//  SwiftUI-QiitaAPI
//
//  Created by s.asakura on 2023/05/12.
//

import Alamofire
import Combine
import Foundation

enum APIRoute {

}

extension APIRoute {
    
    static func request<Body: Codable>(_ request: APIRequestable, body: Body.Type) async throws -> Body {
        
        let dataTask = AF.request(request).serializingDecodable(APIResult<Body>.self)
        let response = await dataTask.response
        let result = await dataTask.result
        
        print("status: \(response.response?.statusCode ?? 0), request: \(String(describing: response.request))")

        switch result {
        case .success(let result):
            switch result {
            case .success(let value):
                return value
            case .failure(let error):
                guard let httpResponse = response.response else {
                    throw QiitaCustomError.manualError("Could not get HTTPURLResponse.")
                }
                print("predefinedServerError: \(error)")
                throw QiitaCustomError.apiClientError(error)
            }
        case .failure(let error):
            print("apiClientError: \(error)")
            throw QiitaCustomError.apiClientError(error)
        }
    }
    
}
