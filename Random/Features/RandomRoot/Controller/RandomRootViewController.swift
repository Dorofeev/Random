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
        (view as? RandomRootView)?.setupTableDelegate(self)
    }

    override init(viewModel: RandomRootViewModel = RandomRootViewModel()) {
        super.init(viewModel: viewModel)
    }
    
    override func setup() {
        super.setup()
        title = "Random Root"
    }
}

extension RandomRootViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let status = UIApplication.shared.statusBarFrame.size.height
        let navBarFrame = self.navigationController!.navigationBar.frame
        let offset = scrollView.contentOffset.y
        let newY = min(
            max(-offset + status, -navBarFrame.height + status),
            status
        )
        self.navigationController?.navigationBar.frame = CGRect(
            x: navBarFrame.origin.x,
            y: newY,
            width: navBarFrame.width,
            height: navBarFrame.height
        )
    }
}
