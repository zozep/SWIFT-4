//
//  GameScene.swift
//  RollingBall
//
//  Created by Joseph Park on 6/16/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import SpriteKit
import GameplayKit

enum CollisionTypes: UInt32 {
    case player = 1
    case wall = 2
    case star = 4
    case vortex = 8
    case finish = 16
}


class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    func loadLevel() {
        if let levelPath = Bundle.main.path(forResource: "level1", ofType: "txt") {
            if let levelString = try? String(contentsOfFile: levelPath) {
                let lines = levelString.components(separatedBy: "\n")
                
                for (row, line) in lines.reversed().enumerated() {
                    for (column, letter) in line.enumerated() {
                        let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                        
                        if letter == "x" {
                            let node = SKSpriteNode(imageNamed: "block")
                            node.position = position
                            
                            node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                            node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                            node.physicsBody?.isDynamic = false
                            addChild(node)                        } else if letter == "v"  {
                            let node = SKSpriteNode(imageNamed: "vortex")
                            node.name = "vortex"
                            node.position = position
                            node.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat.pi, duration: 1)))
                            node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                            node.physicsBody?.isDynamic = false
                            
                            node.physicsBody?.categoryBitMask = CollisionTypes.vortex.rawValue
                            node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                            node.physicsBody?.collisionBitMask = 0
                            addChild(node)                        } else if letter == "s"  {
                            // load star
                        } else if letter == "f"  {
                            // load finish
                        }
                    }
                }
            }
        }
    }
}
