//
//  ViewController.swift
//  GCDPractice
//
//  Created by Joseph Park on 5/15/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var reference1: Person?
    var reference2: Person?
    var reference3: Person?
    var john: Person?
    var unit4A: Apartment?
    
    class Person {
        let name: String
        init(name: String) { self.name = name }
        var apartment: Apartment?
        deinit { print("\(name) is being deinitialized") }
    }
    
    class Apartment {
        let unit: String
        init(unit: String) { self.unit = unit }
        var tenant: Person?
        deinit { print("Apartment \(unit) is being deinitialized") }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        john = Person(name: "John Appleseed")
        unit4A = Apartment(unit: "4A")

    }

}

