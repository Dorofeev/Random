//
//  CViewController+SwiftUI.swift
//  Random
//
//  Created by Andrey Dorofeev on 05.10.2021.
//

import Coordinators
import SwiftUI

extension CViewController {
    @discardableResult
    func addSwiftUIChild<T: View>(_ childView: T) -> UIHostingController<T> {
        let childController = UIHostingController(rootView: childView)
        addChild(childController)
        childController.view.frame = view.bounds
        view.addSubview(childController.view)
        childController.didMove(toParent: self)
        return childController
    }
}
