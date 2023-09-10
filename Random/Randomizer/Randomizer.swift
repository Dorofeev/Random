//
//  Randomizer.swift
//  Random
//
//  Created by Andrey Dorofeev on 27.08.2021.
//

import UIKit
import Foundation
import RandomKit

class Randomizer {
    
    static func randomColor() -> UIColor {
        return UIColor.random(using: &Xoroshiro.default)
    }
    
    static func randomNumber(min: Int = 0, max: Int = 100) -> Int {
        return Int.random(in: min...max, using: &Xoroshiro.default)
    }
    
    static func randomRandom() -> Int {
        var count = 0
        while true {
            count += 1
            
            let random = randomNumber(max: 250)
            if (random % 11 == 0 && random < 100) || random % 111 == 0 {
                return count
            }
        }
    }
}
