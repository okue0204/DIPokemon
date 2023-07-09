//
//  ApiRequest.swift
//  DIPokemon
//
//  Created by 奥江英隆 on 2023/07/09.
//

import Foundation
import SwiftyJSON

class ApiRequest {
    
    static let baseUrl = "https://pokeapi.co/api/v2/pokemon/"
    static let shard = ApiRequest()
    private init() {}
    
    let id = 1
    
    func request() async -> Result<JSON, ApiError> {
        guard let url = URL(string: Self.baseUrl) else {
            fatalError("Invaild Url")
        }
        do {
            let url = url.appendingPathComponent("\(id)", isDirectory: true)
            let (data, responce) = try await URLSession.shared.data(from: url)
            if let httpResponce = responce as? HTTPURLResponse {
                switch httpResponce.statusCode {
                case 200:
                    return .success(JSON(data))
                case 400:
                    return .failure(.badRequest)
                case 401:
                    return .failure(.badRequest)
                case 500:
                    return .failure(.internalServerError)
                default:
                    return .failure(.internalServerError)
                }
            }
        } catch {
            return .failure(.internalServerError)
        }
        return .failure(.unknown)
    }
}

enum ApiError: Error {
    case noNetworkConnection
    case netWorkTimeOut
    case unauthorized
    case badRequest
    case internalServerError
    case unknown
    case illegalResponse(case: EntitiyCreationError)
}

struct EntitiyCreationError: Error {
    let responseJson: String
}
