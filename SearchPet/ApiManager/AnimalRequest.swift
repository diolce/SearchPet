//
//  AnimalRequest.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 21/11/21.
//

import Foundation
 
class AnimalRequest: APIRequest {
    var baseURLString: String
    var relativePath: String = "/v2/animals/"
    var method: HTTPMethod = .get
    var parameters: [String : Any]?
    var queryItem: [URLQueryItem]?
    var authHeader: [String : String]?
    
    init(baseUrl: String,id:Int,authorization:[String:String]) {
        self.baseURLString = baseUrl
        self.authHeader = authorization
        self.relativePath = self.relativePath + "\(id)"
    }
}
