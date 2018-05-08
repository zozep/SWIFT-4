//
//  ViewController.swift
//  WordScramble
//
//  Created by Joseph Park on 5/7/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let startWordsPath = Bundle.main.path(forResource: "start", ofType: "txt") {
            if let startWords = try? String(contentsOfFile: startWordsPath) {
                allWords = startWords.components(separatedBy: "\n")
            }
        } else {
            allWords = ["silkworm"]
        }
       
        startGame()

    }
    
    func startGame() {
        //shuffles array
        allWords = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allWords) as! [String]
        
        //sets our view controller's title to be the first word in the array, once it has been shuffled
        title = allWords[0]
        
        usedWords.removeAll(keepingCapacity: true)
        
        tableView.reloadData()
    }

    


}

