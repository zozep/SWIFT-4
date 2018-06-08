//
//  GameScene.swift
//  TimerFollow
//
//  Created by Joseph Park on 6/8/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import GameplayKit
import SpriteKit

class GameScene: SKScene {
    var gameTimer: Timer!
    var fireworks = [SKNode]()
    
    let leftEdge = -22
    let bottomEdge = -22
    let rightEdge = 1024 + 22
    
    var score = 0 {
        didSet {
            // your code here
        }
    }
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        gameTimer = Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(launchFireworks), userInfo: nil, repeats: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    @objc func launchFireworks() {
        //createFirework()
    }

  
}
