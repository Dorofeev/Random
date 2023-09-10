//
//  RandomRootCoordinator.swift
//  Random
//
//  Created by Andrey Dorofeev on 04.09.2021.
//

import Coordinators
import Foundation
import UIKit

class RandomRootCoordinator: UICoordinator {
    init(window: UIWindow?) {
        
        let randomRootController = RandomRootViewController(viewModel: RandomRootViewModel())
        let nav = UINavigationController()
        nav.setViewControllers([randomRootController], animated: true)
        window?.rootViewController = nav
        super.init(navigationController: nav)
        randomRootController.routesDelegate = self
    }
}

extension RandomRootCoordinator: RandomRootRoutesDelegate {
    func routeToRandomNumber() {
        let randomNumberCoordinator = RandomNumberCoordinator(navigationController: navigationController)
        randomNumberCoordinator.start(with: self)
    }
} 
