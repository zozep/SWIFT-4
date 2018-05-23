//
//  WhatSlot.swift
//  WhackAPenguin
//
//  Created by Joseph Park on 5/22/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit
import SpriteKit

//This base class doesn't draw images like sprites or hold text like labels
//it just sits in our scene at a position, holding other nodes as children
class WhackSlot: SKNode {
    
    func configure(at position: CGPoint) {
        
        //If you don't create any custom initializers (and don't have any non-optional properties) Swift will just use the parent class's init() methods.
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whatHole")
        addChild(sprite)
    }
    
}
