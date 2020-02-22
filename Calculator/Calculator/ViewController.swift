//
//  ViewController.swift
//  CalculatorProject
//
//  Created by erumaru on 1/25/20.
//  Copyright © 2020 kbtu. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    let model = Calculator()
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

     @IBOutlet weak var viewDidcontroller: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        guard
            let numberText = sender.titleLabel?.text
        else { return }
        if(resultLabel?.text == "0.0" || resultLabel?.text == "0"
            ){
            resultLabel?.text = numberText;
        }
        else{ resultLabel.text?.append(numberText)
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        guard
            let numberText = resultLabel.text,
            let number = Double(numberText),
            let operation = sender.titleLabel?.text
        else {
            return
        }
        
        resultLabel.text = "0.0"
        model.setOperand(number: number)
        model.executeOperation(symbol: operation)
        
        if operation == "=" {
            resultLabel.text = "\(model.result)"
        }else if
        
         operation == "x!" {
            resultLabel.text = "\(model.result)"
        }else if
        
         operation == "pi" {
            resultLabel.text = "\(model.result)"
        }else if
        
         operation == "sqrt" {
                   resultLabel.text = "\(model.result)"
        }else if
        
         operation == "Rand" {
                   resultLabel.text = "\(model.result)"
        }else if
         operation == "AC" {
                          resultLabel.text = "\(model.result)"
               }else if
         operation == "D" {
                   resultLabel.text = "\(model.result)"
        }
    }
}
