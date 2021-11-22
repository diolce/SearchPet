//
//  DataOrganizations.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 21/11/21.
//

import Foundation

struct DataOrganizations: Codable {
    let organizations: [OrganizationMap]
    let pagination: Pagination
}
