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
    
    var charNode: SKSpriteNode!

    
    func configure(at position: CGPoint) {
        
        //If you don't create any custom initializers (and don't have any non-optional properties) Swift will just use the parent class's init() methods.
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
        
        let cropNode = SKCropNode()
        
        //15 is the exact number of pts required to make the crop node line up perfectly with the hole graphics
        cropNode.position = CGPoint(x: 0, y: 15)
        
        //zposition 1 = putting it to the front of other nodes, which stops it from appearing behind the hole
        cropNode.zPosition = 1
        cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")

        charNode = SKSpriteNode(imageNamed: "penguinGood")
        charNode.position = CGPoint(x: 0, y: -90)
        charNode.name = "character"
        cropNode.addChild(charNode)
        
        addChild(cropNode)
    }
    
}
