//
//  CatTableViewCell.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 21/11/21.
//

import UIKit

class CatTableViewCell: UITableViewCell {
    @IBOutlet weak var animalViewCell: AnimalViewCell!
    
    public var itemVM:ItemAnimalViewModel? = nil {
        didSet {
            self.animalViewCell.itemVM = itemVM
        }
    }
}
