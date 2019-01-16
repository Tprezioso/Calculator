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
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n / 100
            } else if symbol == "=" {
                return performTwoNumberCalculation(n2: n)
            } else {
                intermediateCalulation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double {
        var answer = 0.0
        
        if let n1 = intermediateCalulation?.n1, let operation = intermediateCalulation?.calcMethod {
            switch operation {
            case "+":
                answer = n1 + n2
            case "-":
                answer = n1 - n2
            case "×":
                answer = n1 * n2
            case "÷":
                answer = n1 / n2
    
            default:
                break
            }
            
        }
        return answer
    }

}
