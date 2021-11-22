//
//  MapOrganizationsViewModel.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 21/11/21.
//

import MapKit

class MapOrganizationsViewModel: ViewModelBase {
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D() {
        didSet {
            self.setRegion?()
        }
    }
    
    var itemsAnnotations: [InfoAnnotationPoint] = [InfoAnnotationPoint]() {
        didSet {
            self.reloadMap?()
        }
    }
    
    func proccessData(dataOrganizations:DataOrganizations) {
        var aux:[InfoAnnotationPoint] = [InfoAnnotationPoint]()
        for organization in dataOrganizations.organizations {
            aux.append(organization.getInfoAnnotationPoint())
        }
        self.itemsAnnotations = aux
    }
    
    func getOrganizations(location:CLLocationCoordinate2D) {
        self.location = location
        self.isLoading = true
        self.apiManager.getOrganizations(latlong:"\(self.location.latitude),\(self.location.longitude)") {result in
            switch result {
            case .success(let dataOrganizations):
                self.proccessData(dataOrganizations: dataOrganizations)
            case .failure(_):break
            }
            self.isLoading = false
        }
    }
    
    var reloadMap: (()->())?
    var setRegion: (()->())?
}
