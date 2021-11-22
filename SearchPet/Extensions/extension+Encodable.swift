//
//  extension+Encodable.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 19/11/21.
//

import Foundation

extension Encodable {
    func jsonData() -> Data {
        return try! JSONEncoder().encode(self)
    }
    func json() -> [String:Any]? {
        return try! JSONSerialization.jsonObject(with: jsonData(), options: []) as? [String:Any]
    }
}
