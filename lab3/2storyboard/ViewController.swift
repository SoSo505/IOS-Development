//
//  ViewController.swift
//  2storyboard
//
//  Created by Админ on 2/29/20.
//  Copyright © 2020 Админ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(selectColor))
        // Do any additional setup after loading the view.
    }
    
   @objc func selectColor() {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           guard
               let selectVC = storyboard.instantiateViewController(identifier: "select") as? SelectColorViewController
           else { return }
           
           selectVC.onSelect = {
            [weak self] width, height, x, y, color in
           guard let self = self else { return }
            
                self.view.backgroundColor = color
            
               let box = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
                self.view.addSubview(box)
           }
           
           self.present(selectVC, animated: true)
       }

   
    
}

