//
//  Capital.swift
//  MapKitPractice
//
//  Created by Joseph Park on 6/7/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

//With map annotations you can't use structs, and you must inherit from NSObject cuz it needs to be interactive w Obj-C Code
class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coodrinate
        self.info = info
    }
    
}
