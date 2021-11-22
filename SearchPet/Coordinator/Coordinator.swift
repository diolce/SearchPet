//
//  Coordinator.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
