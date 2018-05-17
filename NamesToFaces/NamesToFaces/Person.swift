//
//  Person.swift
//  NamesToFaces
//
//  Created by Joseph Park on 5/16/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name: String
    var image: String
    
    //String! and String? can both be nil, but plain old String can't – it must have a value
    init(name: String, image: String) {
        
        //assign the parameter to the class's property
        self.name = name
        self.image = image
    }
    
}
