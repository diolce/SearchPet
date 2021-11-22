//
//  AnimalViewCell.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 22/11/21.
//

import UIKit

@IBDesignable class AnimalViewCell: UIView {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var coat: UILabel!
    @IBOutlet weak var animalImage: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    public var itemVM:ItemAnimalViewModel? = nil {
        didSet {
            if let itemVM = itemVM {
                self.name.text = itemVM.name
                self.gender.text = itemVM.gender
                self.age.text = itemVM.age
                self.coat.text = itemVM.coat
                if let imagePath = itemVM.image {
                    self.animalImage.image = ImageManager.shared.image(path: imagePath)?.imageWithAlpha(alpha: 0.5)
                } else {
                    self.animalImage.image = nil
                }
            }
        }
    }
    
    func initialize() {
        let bundle = Bundle.init(for: AnimalViewCell.self)
        if let viewToAdd = bundle.loadNibNamed("AnimalViewCell", owner: self, options: nil),let contentView = viewToAdd.first as? UIView {
            self.backgroundColor = .clear
            addSubview(contentView)
            contentView.backgroundColor = .clear
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
            
        }
    }
}
