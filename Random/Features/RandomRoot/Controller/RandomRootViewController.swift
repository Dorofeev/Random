//
//  RandomRootViewController.swift
//  Random
//
//  Created by Andrey Dorofeev on 04.09.2021.
//

import Coordinators
import UIKit

protocol RandomRootRoutesDelegate: AnyObject {
    func routeToRandomNumber()
}

class RandomRootViewController
: CTableViewController<
    RandomRootView,
    RandomRootViewModel,
    RandomCategoryTableViewCell
> {
    
    weak var routesDelegate: RandomRootRoutesDelegate? {
        didSet {
            viewModel.routesDelegate = routesDelegate
        }
    }
    
    override func loadView() {
        view = RandomRootView()
    }

    override init(viewModel: RandomRootViewModel = RandomRootViewModel()) {
        super.init(viewModel: viewModel)
    }
    
    override func setup() {
        super.setup()
        title = "Random Root"
    }
}
