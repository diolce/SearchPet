//
//  ApiRequest.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 19/11/21.
//

import Foundation

public protocol APIRequest {
    var baseURLString: String {get set}
    var relativePath: String { get set }
    var method: HTTPMethod { get set }
    var parameters: [String: Any]? { get set }
    var queryItem : [URLQueryItem]? { get set }
    var authHeader: [String:String]? { get set }
    func asURLRequest() throws -> URLRequest
}

extension APIRequest {
    func asURLRequest() throws -> URLRequest {
        let url: URL = {
            var url = URL(string: "https://"+self.baseURLString)!
            url.appendPathComponent(relativePath)
            if queryItem != nil {
                var urlComponents = URLComponents(string: url.absoluteString)
                urlComponents?.queryItems = queryItem!
                return (urlComponents?.url)!
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        
        switch method {
        case .post, .put:
            do {
                let data = try JSONSerialization.data(withJSONObject: parameters as Any)
                if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                }
                urlRequest.httpBody = data
            } catch {
                
            }
        default:
            print("")
        }
        urlRequest.httpMethod = method.rawValue
        
        if let header = self.authHeader { urlRequest.allHTTPHeaderFields = header }
        
        return urlRequest
    }
    
    public var urlRequest: URLRequest? { return try? asURLRequest() }
}

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "get"
    case head    = "HEAD"
    case post    = "post"
    case put     = "put"
    case patch   = "PATCH"
    case delete  = "delete"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

