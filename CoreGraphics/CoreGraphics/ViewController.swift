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
        drawRectangle()

    }

    @IBAction func redrawTapped(_ sender: Any) {
        currentDrawType += 1
        
        if currentDrawType > 5 {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawRectangle()
            
        default:
            break
        }    }
    
    func drawRectangle() {
        print("drawRectangle()")
    }
}

