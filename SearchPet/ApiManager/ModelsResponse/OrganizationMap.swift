//
//  OrganizationMap.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 22/11/21.
//

import RealmSwift

@objcMembers class OrganizationMap:Object, Codable {
    @Persisted var id:String?
    @Persisted var name:String?
    @Persisted var email:String?
    @Persisted var phone: String?
    @Persisted var address: Address?
    @Persisted var distance: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case phone
        case address
        case distance
    }
    
    required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.address = try container.decodeIfPresent(Address.self, forKey: .address)
        self.distance = try container.decodeIfPresent(Double.self, forKey: .distance)
    }
    
    required override init() {
        super.init()
    }
    
    func getAddress() -> String {
        let address1: String? = self.address?.address1
        let address2: String? = self.address?.address2
        let address3: String? = self.address?.city
        let address4: String? = self.address?.country
        let address5: String? = self.address?.postcode
        let address6: String? = self.address?.state
        return [address1,address2,address3,address4,address5,address6]
          .compactMap { $0 }
          .joined(separator: " ")
    }
    
    func getInfoAnnotationPoint() -> InfoAnnotationPoint {
        return InfoAnnotationPoint(name: self.name ?? "", email: self.email ?? "", phone: self.phone ?? "", address: self.getAddress())
    }
}
