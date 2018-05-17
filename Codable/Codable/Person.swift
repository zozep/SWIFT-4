//
//  Person.swift
//  NamesToFaces
//
//  Created by Joseph Park on 5/16/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

//The Codable system works on both classes and structs
//When we implemented NSCoding, we had to write encode() and decodeObject() calls ourself
//this isn’t needed in Codable unless you need more precise control - it does the work for you
//When you encode data using Codable you can save to the same format that NSCoding uses if you want, but a much more pleasant option is JSON – Codable reads and writes JSON natively
class Person: NSObject, Codable {
    var name: String
    var image: String
    
    //String! and String? can both be nil, but plain old String can't – it must have a value
    init(name: String, image: String) {
        
        //assign the parameter to the class's property
        self.name = name
        self.image = image
    }
    
    
}
