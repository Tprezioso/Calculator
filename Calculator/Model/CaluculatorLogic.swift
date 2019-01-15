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
            } else if symbol == "+" {
                intermediateCalulation = (n1: number, calcMethod: symbol)
            }
        }
        return nil
    }

}
