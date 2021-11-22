//
//  AnimalTableViewCell.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    @IBOutlet weak var animalViewCell: AnimalViewCell!
    
    public var itemVM:ItemAnimalViewModel? = nil {
        didSet {
            self.animalViewCell.itemVM = itemVM
        }
    }
}
