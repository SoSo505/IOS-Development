//
//  Calculator.swift
//  CalculatorProject
//
//  Created by erumaru on 1/25/20.
//  Copyright © 2020 kbtu. All rights reserved.
//
import Foundation

class Calculator {
    // MARK: - Constants
    enum Operation {
        case equals
        case constant(value: Double)
        case unary(function: (Double) -> Double)
        case binary(function: (Double, Double) -> Double)
        case D
    }
    
    var map: [String : Operation] = [
        "+" : .binary { $0 + $1 },
        "-" : .binary { $0 - $1 },
        "x" : .binary { $0 * $1},
        "%" : .binary { (($0 * $1)/100)},
        "=" : .equals,
        "/" : .binary {$0 / $1},
        "pi": .constant (value: Double.pi),
        "sqrt": .unary { a in return sqrt(a) },
        "x^y" : .binary {x,y in pow(x,y)},
        "x!" : .unary { n in
            if n == 0 {
                return 1
            }
            var a: Double = 1
            for i in 1...Int(n) {
                a *= Double(i)
            }
            return a
        },
        "AC" : .constant(value:0),
        "Rand" : .constant(value: Double.random(in: 1...100)),
        "D" : .unary{$0},
    
    ]
        
    // MARK: - Variables
    var result: Double = 0
    var lastBinaryOperation: ((Double, Double) -> Double)?
    var reminder: Double = 0
    
    // MARK: - Methods
            
    func setOperand(number: Double) {
        result = number
    }
    
    
    func executeOperation(symbol: String) {
        guard let operation = map[symbol] else {
            print("ERROR: no such symbol in map")
            return
        }
        
        switch operation {
        case .binary(let function):
        if lastBinaryOperation != nil {
            executeOperation(symbol: "=")
        }
        
        lastBinaryOperation = function
        reminder = result
        case .unary(let function):
            result = function(result)
        
        case .constant(let value):
            result = value
                
        case .equals:
            if let lastOperation = lastBinaryOperation {
                result = lastOperation(reminder, result)
                lastBinaryOperation = nil
                reminder = 0
            }
        case .D:
                result = 0
                reminder = 0
                lastBinaryOperation = nil
            }
        }
    }
