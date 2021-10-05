//
//  RandomNumberCoordinator.swift
//  Random
//
//  Created by Andrey Dorofeev on 22.09.2021.
//

import Coordinators
import Foundation
import UIKit

class RandomNumberCoordinator: UICoordinator {
    private let randomNumberController = RandomNumberViewController()
    override var rootViewController: UIViewController { get { randomNumberController } set {  } }
}
