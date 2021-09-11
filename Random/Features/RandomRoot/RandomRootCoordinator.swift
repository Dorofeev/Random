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
        let nav = UINavigationController(
            rootViewController: RandomRootViewController(viewModel: RandomRootViewModel())
        )
        window?.rootViewController = nav
        super.init(navigationController: nav)
    }
}
