//
//  Attributes.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 22/11/21.
//

import RealmSwift

@objcMembers class Attributes:Object, Codable {
    @Persisted var spayedNeutered: Bool?
    @Persisted var houseTrained: Bool?
    @Persisted var declawed: Bool?
    @Persisted var specialNeeds: Bool?
    @Persisted var shotsCurrent: Bool?

    enum CodingKeys: String, CodingKey {
        case spayedNeutered = "spayed_neutered"
        case houseTrained = "house_trained"
        case declawed
        case specialNeeds = "special_needs"
        case shotsCurrent = "shots_current"
    }
    
    required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self.spayedNeutered = try container.decodeIfPresent(Bool.self, forKey: .spayedNeutered)
        } catch DecodingError.typeMismatch {
            self.spayedNeutered = ((try container.decodeIfPresent(Int.self, forKey: .spayedNeutered)) != 0)
        }
        do {
            self.houseTrained = try container.decodeIfPresent(Bool.self, forKey: .houseTrained)
        } catch DecodingError.typeMismatch {
            self.houseTrained = ((try container.decodeIfPresent(Int.self, forKey: .houseTrained)) != 0)
        }
        do {
            self.declawed = try container.decodeIfPresent(Bool.self, forKey: .declawed)
        } catch DecodingError.typeMismatch {
            self.declawed = ((try container.decodeIfPresent(Int.self, forKey: .declawed)) != 0)
        }
        do {
            self.specialNeeds = try container.decodeIfPresent(Bool.self, forKey: .specialNeeds)
        } catch DecodingError.typeMismatch {
            self.specialNeeds = ((try container.decodeIfPresent(Int.self, forKey: .specialNeeds)) != 0)
        }
        
        do {
            self.shotsCurrent = try container.decodeIfPresent(Bool.self, forKey: .shotsCurrent)
        } catch DecodingError.typeMismatch {
            self.shotsCurrent = ((try container.decodeIfPresent(Int.self, forKey: .shotsCurrent)) != 0)
        }
    }
    
    public func encode(to encoder: Encoder) throws {}
    
    required override init() {
        super.init()
    }
}
