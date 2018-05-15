//
//  ViewController.swift
//  SwiftyWords
//
//  Created by Joseph Park on 5/14/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit
import GameplayKit

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
        
        // all our buttons have the tag 1001, so we can loop through all the views inside our view controller, and modify them only if they have tag 1001
        for subview in view.subviews where subview.tag == 1001 {
            let btn = subview as! UIButton
            letterButtons.append(btn)
            
            //addTarget() is the code version of Ctrl-dragging in a storyboard and it lets us attach a method to the button click
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
    
    func loadLevel() {
        var clueString = ""
        var solutionString = ""
        var letterBits = [String]()
        
        //path(forResource:) and String's contentsOfFile to find and load the level string from the disk
        if let levelFilePath = Bundle.main.path(forResource: "level\(level)", ofType: "txt") {
            if let levelContents = try? String(contentsOfFile: levelFilePath) {
                var lines = levelContents.components(separatedBy: "\n")
                lines = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: lines) as! [String]
                
                
                //enumerated(): it tells us where each item was in the array so we can use that information in our clue string in the code above, enumerated() will place the item into the line variable and its position into the index var
                for (index, line) in lines.enumerated() {
                    
                    //We already split the text up into lines based on finding \n, but now we split each line up based on finding :, because each line has a colon and a space separating its letter groups from its clue
                    let parts = line.components(separatedBy: ": ")
                    let answer = parts[0]
                    let clue = parts[1]
                    
                    clueString += "\(index + 1). \(clue)\n"
                    
                    
                    //We're asking it to replace all instances of | with an empty string, so HA|UNT|ED will become HAUNTED
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    
                    //to turn the string "HA|UNT|ED" into an array of three elements, then add all three to our letterBits array.
                    solutionString += "\(solutionWord.count) letters\n"
                    solutions.append(solutionWord)
                    
                    let bits = answer.components(separatedBy: "|")
                    letterBits += bits
                }
            }
        }
        
        // Now configure the buttons and labels
    }
    
}

