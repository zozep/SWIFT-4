//
//  ViewController.swift
//  StormViewer
//
//  Created by Joseph Park on 5/3/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pictures = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // data type that lets us work with the filesystem
        let fm = FileManager.default
        
        // bundle = directory containing compiled program and all assets
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                //add to the pictures array all the files we match inside our loop.
                
            }
        }
    }

    

}

