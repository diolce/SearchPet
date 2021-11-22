//
//  AuthorizationRequestDTO.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import Foundation

class AuthorizationRequestDTO:Encodable {
    var grant_type = "client_credentials"
    var client_id:String
    var client_secret:String
    
    init(client_id:String,client_secret:String) {
        self.client_id = client_id
        self.client_secret = client_secret
    }
}
