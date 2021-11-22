//
//  Photo.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 22/11/21.
//

import RealmSwift

@objcMembers class Photo:Object, Codable {
    @Persisted var small: String?
    @Persisted var medium: String?
    @Persisted var large: String?
    @Persisted var full: String?
}
