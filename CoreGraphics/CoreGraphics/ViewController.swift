//
//  ViewController.swift
//  CoreGraphics
//
//  Created by Joseph Park on 6/19/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentDrawType = 0

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func redrawTapped(_ sender: Any) {
        print("redrawTappd()")
    }
    
    func drawRectangle() {
        print("drawRectangle()")
    }
}

