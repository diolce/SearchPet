//
//  Address.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 22/11/21.
//

import RealmSwift

@objcMembers class Address:Object, Codable {
    @Persisted var address1: String?
    @Persisted var address2: String?
    @Persisted var city: String?
    @Persisted var state: String?
    @Persisted var postcode: String?
    @Persisted var country: String?
}
