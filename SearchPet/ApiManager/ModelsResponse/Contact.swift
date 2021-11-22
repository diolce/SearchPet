//
//  Contact.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 22/11/21.
//

import RealmSwift

@objcMembers class Contact:Object, Codable {
    @Persisted var email: String?
    @Persisted var phone: String?
    @Persisted var address: Address?
}
