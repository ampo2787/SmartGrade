//
//  Calculator.swift
//  SmartGrades
//
//  Created by 박지훈 on 2019/12/18.
//  Copyright © 2019 JihoonPark. All rights reserved.
//

import UIKit

class Calculator: NSObject {
    static let MyCalculator = Calculator()
    static var result:Float = 0
    
    private override init() {
        
    }
    
    func Calculate(lastAv:Float, allScore:Float, thisAv:Float, thisScore:Float) {
        Calculator.result = (lastAv * allScore + thisAv * thisScore) / (allScore + thisScore)
    }
    
    func Calculate(lastAv:Float, allScore:Float, thisAv:Float, thisScore:Float, retakePre:Float, retakeAfter:Float, retakeScore:Float) {
        Calculator.result = (lastAv * allScore + thisAv * thisScore + (retakeAfter - retakePre) * retakeScore) / (allScore + thisScore)
    }
}
