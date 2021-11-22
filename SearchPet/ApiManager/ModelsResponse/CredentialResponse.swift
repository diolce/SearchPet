//
//  CredentialResponse.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 19/11/21.
//

import RealmSwift

@objcMembers class  CredentialResponse: Object ,Codable {
    enum CodingKeys: String, CodingKey {
        case token_type
        case expires_in
        case access_token
    }
    
    @Persisted var token_type: String
    @Persisted var expires_in: Int
    @Persisted var access_token: String
    
    
    // MARK: - Decodable
    required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.token_type = try container.decode(String.self, forKey: .token_type)
        self.expires_in =  try container.decode(Int.self, forKey: .expires_in)
        self.access_token = try container.decode(String.self, forKey: .access_token)
    }
    
    public func encode(to encoder: Encoder) throws {}
    
    required override init() {
        super.init()
    }
    
    override static func primaryKey() -> String? {
        return "token_type"
    }
}
