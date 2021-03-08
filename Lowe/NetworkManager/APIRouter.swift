//
//  APIRouter.swift
//  Lowe
//
//

import Foundation
import Alamofire



enum ContentType: String {
    case json = "application/json"
}

/// Builds the URLRequest object.
enum APIRouter: URLRequestConvertible {
    case weatherAPI(city: String,
                    key: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .weatherAPI:
            return .get
        }
    }
    
    // MARK: - url
    private var urlPath: String {
        switch self {
        
        case let .weatherAPI(city: city, key: key):
            return "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(key)"
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try urlPath.asURL()
        var urlRequest = URLRequest(url: url)
        print(url)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}

