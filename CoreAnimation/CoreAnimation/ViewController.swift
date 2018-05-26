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
        //button is hideen so animations don't collide. it gets unhidden in the completion closure of the animation
        tap.isHidden = true
        
        //We call animate(withDuration:) with a duration of 1 second, no delay, and no interesting options
        UIView.animate(withDuration: 1, delay: 0, options: [],
                       //For the animations closure we first do the usual [unowned self] in dance to avoid strong reference cycles, then enter the switch/case code.
                       animations: { [unowned self] in
                        //We switch using the value of self.currentAnimation. 'self' to make the closure capture clear
                        switch self.currentAnimation {
                        case 0:
                            break
                            
                        default:
                            break
                        }
                        //We use trailing closure syntax to provide our completion closure. This will be called when the animation completes, and its finished value will be true if the animations completed fully.
        }) { [unowned self] (finished: Bool) in
            //the completion closure unhides the tap button so it can be tapped again.
            self.tap.isHidden = false
        }
        //After the animate(withDuration:) call, we have the old code to modify and wrap currentAnimation
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}

