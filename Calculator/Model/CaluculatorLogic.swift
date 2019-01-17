//
//  CaluculatorLogic.swift
//  Calculator
//
//  Created by Thomas Prezioso on 1/14/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
   
    private var number : Double?

    private var intermediateCalulation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC" :
                return 0
            case "%" :
                return n / 100
            case "=" :
                return performTwoNumberCalculation(n2: n)
            default:
                intermediateCalulation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalulation?.n1, let operation = intermediateCalulation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
    
            default:
                fatalError("The operationg passed in does not match any of the cases")
            }
            
        }
        return nil
    }

}
