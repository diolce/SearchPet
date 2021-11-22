//
//  InfoAnnotationPoint.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 21/11/21.
//

import Foundation

class InfoAnnotationPoint {
    var name:String
    var email:String
    var phone:String
    var address:String
    
    init(name:String,email:String,phone:String,address:String) {
        self.name = name
        self.email = email
        self.phone = phone
        self.address = address
    }
}
