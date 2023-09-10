//
//  RandomNumberViewModel.swift
//  Random
//
//  Created by Andrey Dorofeev on 22.09.2021.
//

import Coordinators
import Foundation
import RxSwift
import UIKit

private let initialMinValue: Int = 0
private let initialMaxValue: Int = 100

class RandomNumberViewModel {
    
    let minValue = BehaviorSubject<Int>(value: initialMinValue)
    let maxValue = BehaviorSubject<Int>(value: initialMaxValue)
    
    let currentValue: BehaviorSubject<Int>
    
    init() {
        let generatedNumber = Randomizer.randomNumber(min: initialMinValue, max: initialMaxValue)
        currentValue = BehaviorSubject(value: generatedNumber)
    }
    
    func changeMinValue(_ value: Int) {
        minValue.on(.next(value))
    }
    
    func changeMaxValue(_ value: Int) {
        maxValue.on(.next(value))
    }
    
    func generate() {
        guard let min = try? minValue.value(), let max = try? maxValue.value() else {
            fatalError("no min max value")
        }
        let generatedNumber = Randomizer.randomNumber(min: min, max: max)
        currentValue.on(.next(generatedNumber))
    }
}
