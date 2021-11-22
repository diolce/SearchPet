//
//  AnimalsRequestDTO.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import Foundation

class AnimalsRequest: APIRequest {
    var authHeader: [String : String]?
    var parameters: [String : Any]?
    var baseURLString: String
    var relativePath: String = "/v2/animals"
    var method: HTTPMethod = .get
    var queryItem: [URLQueryItem]? = []
    
    init(baseUrl: String,city:String?,nextLinkPagination:String?,type:String?,authorization:[String:String]) {
        self.baseURLString = baseUrl
        self.authHeader = authorization 
        if let city = city {
            let queryItem = URLQueryItem(name: "location", value: city)
            self.queryItem?.append(queryItem)
        }
        if let nextLink = nextLinkPagination {
            self.queryItem = nil
            self.relativePath = nextLink.removingPercentEncoding!
        }
        if let type = type {
            let queryItem = URLQueryItem(name: "type", value: type)
            self.queryItem?.append(queryItem)
        }
    }
}
