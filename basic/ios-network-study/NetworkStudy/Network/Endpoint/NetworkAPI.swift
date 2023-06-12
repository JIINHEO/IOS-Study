//
//  NetworkAPI.swift
//  NetworkStudy
//
//  Created by jiinheo on 2023/02/12.
//

import Foundation

protocol Endpoint {
    var baseURL: String {get}
    var domain: String {get}
    var path: String {get}
}

extension Endpoint {
    var url: URL? {
        return URL(string: baseURL + domain + path)
    }
}

enum APIEndpoint: Endpoint {
    case pair
    case trades(symbol: String)
    
    var baseURL: String {
        return "https://"
    }
    
    var domain: String {
        return "api.batonex.com"
    }
    
    var path: String {
        switch self {
        case .pair:
            return "/openapi/v1/pairs"
        case .trades(symbol: let symbol):
            return "quote/v1/trades?symbol=\(symbol)"
        }
    }
}

struct NetworkAPI {
    
//https://api.batonex.com/openapi/v1/pairs
    // /openapi/ quote/v1/depth
    // openapi/quote/v1/trades?symbol=BTCUSDT
    
    static let scheme = "https"
    static let host = "api.batonex.com"
    static let path = "/openapi"
    
    func getSymbolTrades(page: Int) -> URLComponents {
        var components = URLComponents()
        components.scheme = NetworkAPI.scheme
        components.host = NetworkAPI.host
        components.path = NetworkAPI.path
        
        components.queryItems = [
        URLQueryItem(name: "symbol", value: "BTCUSDT"),
        ]
        return components
    }
    
    
}
