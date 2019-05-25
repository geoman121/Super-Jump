//
//  GameScene.swift
//  Super Jump
//
//  Created by George James Manayath on 25/05/19.
//  Copyright © 2019 George James Manayath. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var coinMan : SKSpriteNode?
    var coinTimer : Timer?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        
        coinMan = childNode(withName: "coinMan") as? SKSpriteNode
        coinTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.createCoin()
        })    }
    
    func createCoin(){
        let coin = SKSpriteNode(imageNamed: "coin")
            addChild(coin)
        
        let maxY = size.height / 2 - coin.size.height / 2
        let minY = -size.height / 2 + coin.size.height / 2
        let range = maxY - minY
        let coinY = maxY - CGFloat(arc4random_uniform(UInt32(range)))
        coin.position = CGPoint(x: size.width / 2 + coin.size.width / 2 , y: coinY)
        let moveLeft =  SKAction.moveBy(x: -size.width - coin.size.width, y: 0, duration: 4)
        coin.run(SKAction.sequence([moveLeft, SKAction.removeFromParent()]))
        
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        coinMan?.physicsBody?.applyForce(CGVector(dx: 0, dy: 80000))
    }
    
  
    
    

}
