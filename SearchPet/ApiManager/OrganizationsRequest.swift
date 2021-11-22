//
//  OrganizationsRequest.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import Foundation

class OrganizationsRequest: APIRequest {
    var authHeader: [String : String]?
    var parameters: [String : Any]?
    var baseURLString: String
    var relativePath: String = "/v2/organizations"
    var method: HTTPMethod = .get
    var queryItem: [URLQueryItem]? = []
    
    init(baseUrl: String,latlong:String?,nextLinkPagination:String?,authorization:[String:String]) {
        self.baseURLString = baseUrl
        self.authHeader = authorization
        if let latlong = latlong {
            let queryItem = URLQueryItem(name: "location", value: "\(latlong)")
            self.queryItem?.append(queryItem)
        }
        if let nextLink = nextLinkPagination {
            self.relativePath = nextLink.removingPercentEncoding!
        }
    }
}
