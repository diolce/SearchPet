//
//  Item.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import UIKit

protocol ItemAnimalViewModel {
    var id:Int{get set}
    var name:String  {get set}
    var type: String {get set}
    var image: String? { get set }
    var age: String? { get set }
    var gender: String? { get set }
    var description: String? { get set }
    var coat: String? { get set }
    var heightItem: CGFloat { get set }
}

class ItemBase: ItemAnimalViewModel {
    var id: Int
    var type: String
    var name: String
    var gender: String?
    var description: String?
    var age: String?
    var coat: String?
    var image: String?
    var heightItem: CGFloat = 150.0
    init(id:Int,type:String,name:String,gender:String,age:String,coat:String,description:String,image:String?)
    {
        self.id = id
        self.type = type
        self.name = name
        self.gender = gender
        self.description = description
        self.age = age
        self.coat = coat
        if let image = image {
            self.image = image
            self.heightItem = 300.0
        }
    }
}

class ItemAnimal:ItemBase {}
