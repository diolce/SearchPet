//
//  Breeds.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 22/11/21.
//

import RealmSwift

@objcMembers class Breeds:Object, Codable {
    enum CodingKeys: String, CodingKey {
        case primary
        case secondary
        case mixed
        case unknown
    }
    
    @Persisted var primary: String?
    @Persisted var secondary: String?
    @Persisted var mixed:Bool?
    @Persisted var unknown: Bool?
    
    required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.primary = try container.decodeIfPresent(String.self, forKey: .primary)
        self.secondary = try container.decodeIfPresent(String.self, forKey: .secondary)
        do {
            self.mixed = try container.decodeIfPresent(Bool.self, forKey: .mixed)
        } catch DecodingError.typeMismatch {
            self.mixed = ((try container.decodeIfPresent(Int.self, forKey: .mixed)) != 0)
        }
        do {
            self.unknown = try container.decodeIfPresent(Bool.self, forKey: .unknown)
        } catch DecodingError.typeMismatch {
            self.unknown = ((try container.decodeIfPresent(Int.self, forKey: .unknown)) != 0)
        }
    }
    
    public func encode(to encoder: Encoder) throws {}
    
    required override init() {
        super.init()
    }
}
