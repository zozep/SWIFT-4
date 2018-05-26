//
//  ViewController.swift
//  CoreAnimation
//
//  Created by Joseph Park on 5/24/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    var currentAnimation = 0

    
    @IBOutlet weak var tap: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)

    }
    
    @IBAction func tapped(_ sender: Any) {
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}

