//
//  SecondCoordinator.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 21/11/21.
//

import Foundation


import UIKit

class SecondCoordinator: Coordinator {
    func start() {}
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func seeAnimal(id:Int) {
        let vc = DetailAnimalViewController()
        vc.viewModel = DetailAnimalViewModel(id:id)
        navigationController.pushViewController(vc, animated: false)
    }
}
