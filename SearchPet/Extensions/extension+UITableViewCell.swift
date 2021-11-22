//
//  extension+UITableViewCell.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import UIKit

extension UITableViewCell {
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier:String {
        return String(describing: self)
    }
}
