//
//  SelectColorViewController.swift
//  2storyboard
//
//  Created by Админ on 3/8/20.
//  Copyright © 2020 Админ. All rights reserved.
//

import UIKit

class SelectColorViewController: UIViewController {
    
    @IBOutlet weak var y1: UITextField!
    @IBOutlet weak var x1: UITextField!
    @IBOutlet weak var width1: UITextField!
    @IBOutlet weak var height1: UITextField!
    
    var color: UIColor?
    
    
    var onSelect: (( _ wwidth: Double, _ hheight: Double, _ xx: Double, _ yy: Double, _ color: UIColor) -> Void)? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func colorSelected(_ sender: UIButton) {
        

        if sender.titleLabel?.text == "Red" {
            color = sender.backgroundColor
        } else if sender.titleLabel?.text == "Yellow"{
            color = sender.backgroundColor
        }else if sender.titleLabel?.text == "Purple"{
            color = sender.backgroundColor
        }else if sender.titleLabel?.text == "Silver"{
            color = sender.backgroundColor
        }
        
        self.dismiss(animated: true)
    }
    
    
   @objc func save(){
          guard let width = width1.text, let height = height1.text, let x = x1.text, let y = y1.text, let color = color else {
                  let alert = UIAlertController(title: "Error", message: "Fill", preferredStyle: .alert)
                  alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                  self.present(alert, animated: true)
                  return
    }
    
   guard let dwidth = Double(width),
        let dheight = Double(height),
        let dx = Double(x),
        let dy = Double(y) else {
        let alert = UIAlertController(title: "Error", message: "Please correct!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
        return
    }
    
    onSelect?(dwidth, dheight, dx, dy, color)
   
}
}
