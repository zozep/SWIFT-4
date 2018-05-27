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
        
        //This changes the animate(withDuration:) so that it uses spring animations rather than the default, ease-in-ease-out animation
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [],
                       //For the animations closure we first do the usual [unowned self] in dance to avoid strong reference cycles, then enter the switch/case code.
                       animations: { [unowned self] in
                        //We switch using the value of self.currentAnimation. 'self' to make the closure capture clear
                        switch self.currentAnimation {
                        case 0:
                            //1 means "the default size", 2 will make the view twice its normal width and height
                            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                        case 1:
                            self.imageView.transform = CGAffineTransform.identity
                        case 2:
                            //Core Animation will always take the shortest route to make the rotation work. meaning anything over 360 is converted back: e.g: 540 = 180
                            self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
                        case 3:
                            self.imageView.transform = CGAffineTransform.identity
                        case 4:
                            self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                        case 5:
                            self.imageView.transform = CGAffineTransform.identity
                        case 6:
                            self.imageView.alpha = 0.1
                            self.imageView.backgroundColor = UIColor.green
                            
                        case 7:
                            self.imageView.alpha = 1
                            self.imageView.backgroundColor = UIColor.clear
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

