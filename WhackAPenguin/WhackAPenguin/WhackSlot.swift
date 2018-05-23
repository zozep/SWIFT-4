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
    var isVisible = false
    var isHit = false
    
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
    
    //method is going to be triggered by the view controller on a recurring basis,
    //managed by a property we're going to create called popupTime
    func show(hideTime: Double) {
        if isVisible {
            return
        }
        //Since we're now potentially modifying the xScale and yScale properties of our character node, we need to reset them to 1 inside the show() method of the slot
        charNode.xScale = 1
        charNode.yScale = 1
        
        charNode.run(SKAction.moveBy(x: 0, y: 80, duration: 0.05))
        isVisible = true
        isHit = false
        
        if RandomInt(min: 0, max: 2) == 0 {
            charNode.texture = SKTexture(imageNamed: "penguinGood")
            charNode.name = "charFriend"
        } else {
            charNode.texture = SKTexture(imageNamed: "penguinEvil")
            charNode.name = "charEnemy"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (hideTime * 3.5)) { [unowned self] in
            self.hide()
        }
        
    }
    
    func hide() {
        if !isVisible { return }
        
        charNode.run(SKAction.moveBy(x: 0, y:-80, duration:0.05))
        isVisible = false
    }
    
    func hit() {
        isHit = true
        
        let delay = SKAction.wait(forDuration: 0.25)
        let hide = SKAction.moveBy(x: 0, y: -80, duration: 0.5)
        
        //will run any code we want, provided as a closure. "Block" is Objective-C's name for a Swift closure.
        //need to use SKAction.run(block:) in order to set the penguin's isVisible property to be false rather than doing it directly
        //because we want it to fit into the sequence, it will only be changed when that part of the sequence is reached.
        let notVisible = SKAction.run { [unowned self] in self.isVisible = false }
        
        //SKAction.sequence() takes an array of actions, and executes them in order. Each action won't start executing until the previous one finished.
        charNode.run(SKAction.sequence([delay, hide, notVisible]))
    }
}

