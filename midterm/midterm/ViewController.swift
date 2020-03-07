//
//  ViewController.swift
//  midterm
//
//  Created by Админ on 3/7/20.
//  Copyright © 2020 Админ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectColor(_ sender: UIButton) {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          guard
              let selectVC = storyboard.instantiateViewController(identifier: "select") as? SelectColorViewController
          else { return }
          
          selectVC.onSelect = { [weak self] color in
              guard let self = self else { return }
              
              sender.backgroundColor = color
          }
          
          self.present(selectVC, animated: true)
      }


}

