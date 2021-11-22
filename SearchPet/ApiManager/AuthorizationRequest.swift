//
//  AuthorizationRequest.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 19/11/21.
//

import Foundation
import Keys

class AuthorizationRequest: APIRequest {
    var authHeader: [String : String]? 
    var parameters: [String : Any]?
    var baseURLString: String
    var relativePath: String = "/v2/oauth2/token"
    var method: HTTPMethod = .post
    var queryItem: [URLQueryItem]? = nil
    init(baseUrl: String) {
        let keys = SearchPetKeys()
        self.baseURLString = baseUrl
        self.parameters = AuthorizationRequestDTO(client_id: keys.api_key_petfinder,
                                                  client_secret: keys.secret_Petfinder).json()
    }
}
