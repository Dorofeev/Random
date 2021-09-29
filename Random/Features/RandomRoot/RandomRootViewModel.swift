//
//  RandomRootViewModel.swift
//  Random
//
//  Created by Andrey Dorofeev on 05.09.2021.
//

import Coordinators
import Foundation
import UIKit

struct RandomCategory {
    let name: String
    let id: String
    let onSelected: () -> Void
}

class RandomRootViewModel: ListViewModel {
    
    var sections: [RandomSection] = []
    
    weak var routesDelegate: RandomRootRoutesDelegate?
    
    typealias Item = RandomCategory
    typealias Section = RandomSection
    
    struct RandomSection: Coordinators.Section {
        var title: String
        var items: [RandomCategory]
    }
    
    required init() {
        sections = [
            RandomSection(
                title: "",
                items: createCategories()
            )
        ]
    }
    
    required init(sections: [Section]) {
        self.sections = sections
    }
    
    func createCategories() -> [RandomCategory] {
        return [
            RandomCategory(
                name: "Random Number",
                id: "number",
                onSelected: { [weak self] in
                    self?.routesDelegate?.routeToRandomNumber()
                }
            ),
            RandomCategory(
                name: "Random Color",
                id: "color",
                onSelected: { }
            ),
            RandomCategory(
                name: "Full Random",
                id: "full",
                onSelected: { }
            )
        ]
    }
}
