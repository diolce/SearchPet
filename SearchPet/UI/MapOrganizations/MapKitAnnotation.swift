//
//  MapKitAnnotation.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 21/11/21.
//

import MapKit

class MapPin: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    init(annotationOrganization:AnnotationOrganization) {
        self.title = annotationOrganization.name
        let email: String? = annotationOrganization.email
        let phone: String? = annotationOrganization.phone
        self.locationName = [email,phone]
          .compactMap { $0 }
          .joined(separator: " ")
        self.coordinate = annotationOrganization.coordinate
    }
}

