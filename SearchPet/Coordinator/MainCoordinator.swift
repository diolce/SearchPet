//
//  MainCoordinator.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = GetCredentialsViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func loadTabBar() {
        let navigatorMain = NavigatorMain.instantiate()
        navigatorMain.modalPresentationStyle = .fullScreen
        self.navigationController.viewControllers.last?.present(navigatorMain, animated: true)
    }
}
