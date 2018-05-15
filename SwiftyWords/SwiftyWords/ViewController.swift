//
//  ViewController.swift
//  SwiftyWords
//
//  Created by Joseph Park on 5/14/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cluesLabel: UILabel!
    @IBOutlet var answersLabel: UILabel!
    @IBOutlet var currentAnswer: UITextField!
    @IBOutlet var scoreLabel: UILabel!
    
    var letterButtons =  [UIButton]()
    var activatedButtons = [UIButton]()
    var solutions = [String]()
    
    var score = 0
    var level = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for subview in view.subviews where subview.tag == 1001 {
            let btn = subview as! UIButton
            letterButtons.append(btn)
            btn.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
        }
    }

    @objc func letterTapped(btn: UIButton) {
        //letterTapped
        print("lettertapped()!")
    }
    
    @IBAction func submitTapped(_ sender: AnyObject) {
        //submitTapped
        print("submitTapped()!")
    }
    
    @IBAction func clearTapped(_ sender: AnyObject) {
        //clearTapped
        print("clearTapped()!")
    }
    
}

