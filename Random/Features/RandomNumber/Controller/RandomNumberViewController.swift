//
//  RandomNumberViewController.swift
//  Random
//
//  Created by Andrey Dorofeev on 23.09.2021.
//

import Coordinators
import SwiftUI
import UIKit

class RandomNumberViewController: CViewController {
    
    override func loadView() {
        super.loadView()
        let subview = RandomNumberView()
        addSwiftUIChild(subview)
    }
    
    override func setupStrings() {
        super.setupStrings()
        self.navigationItem.title = "Random Number"
    }
   
}
