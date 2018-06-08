//
//  ViewController.swift
//  Debugging
//
//  Created by Joseph Park on 6/7/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
  
        print("I'm inside the viewDidLoad() method!")
        print(1, 2, 3, 4, 5, separator: "-")
        
        assert(1 == 1, "Maths failure!")
        
        for i in 1 ... 100 {
            print("Got number \(i)")
        }
    }
}

