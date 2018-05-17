//
//  Person.swift
//  NamesToFaces
//
//  Created by Joseph Park on 5/16/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

//If your data type is a class, it must conform to the NSCoding protocol, which is used for archiving object graphs.
class Person: NSObject, NSCoding {
    var name: String
    var image: String
    
    //The initializer is used when loading objects of this class. encode() is used when saving
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        image = aDecoder.decodeObject(forKey: "image") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(image, forKey: "image")
    }
    
    //String! and String? can both be nil, but plain old String can't – it must have a value
    init(name: String, image: String) {
        
        //assign the parameter to the class's property
        self.name = name
        self.image = image
    }
    
    
}
