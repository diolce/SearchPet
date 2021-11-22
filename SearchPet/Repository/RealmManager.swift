//
//  RealmManager.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import Foundation
import RealmSwift

class RealmService {
    private init() {}
    static let shared = RealmService()
    
    var realm = try! Realm()
    
    func createOrUpdate<T:Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object, update: .modified)
            }
        } catch {
            print(error)
        }
    }
    
    func delete<T:Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print(error)
        }
    }
    
    func query<T:Object>(type: T.Type, query: String?) -> [T] {
        let realm = try! Realm()
        let results = realm.objects(type)
        if let query = query {
            return Array(results.filter(query))
        } else {
            return Array(results)
        }
    }
}
