//
//  DataReponse.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import Foundation

struct DataReponse: Codable {
    let animals: [Animal]
    let pagination: Pagination
}
