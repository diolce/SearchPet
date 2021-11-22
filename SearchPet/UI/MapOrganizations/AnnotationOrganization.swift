//
//  AnnotationOrganization.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 21/11/21.
//

import Foundation
import MapKit

class AnnotationOrganization {
    var name:String
    var email:String
    var phone:String
    var coordinate:CLLocationCoordinate2D
    init(name:String,email:String,phone:String, coordinate:CLLocationCoordinate2D) {
        self.name = name
        self.email = email
        self.phone = phone
        self.coordinate = coordinate
    }
}
