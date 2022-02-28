//
//  GameScene.swift
//  FirstGame
//
//  Created by Vntlab on 7/12/16.
//  Copyright (c) 2016 Vntlab. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        let x = size.width
        let y = size.height
        
        let spriteBG = SKSpriteNode(imageNamed:"background")
        
        spriteBG.position.x = x/2
        spriteBG.position.y = y/2
        spriteBG.zPosition = 0
        
        self.addChild(spriteBG)
        
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Score: 99999999"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)+200)
        self.addChild(myLabel)
        myLabel.zPosition = 1
        
        let spriteNave = SKSpriteNode(imageNamed:"Spaceship-1")
        spriteNave.position.x = 40
        spriteNave.position.y = 400
        spriteNave.xScale = 1.5
        spriteNave.zPosition = 1
        self.addChild(spriteNave)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let spriteShot = SKSpriteNode(imageNamed:"projectile")
            
            spriteShot.position.x = 40
            spriteShot.position.y = 400
            spriteShot.zPosition = 3
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            spriteShot.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(spriteShot)
            
            // Determine speed of the monster
            let actualDuration = 1 //randomInRange( 2, hi: 4)
            
            // Create the actions
            let actionMove = SKAction.moveTo(CGPoint(x: location.x, y: location.y), duration: NSTimeInterval(actualDuration))
            let actionMoveDone = SKAction.removeFromParent()
            spriteShot.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        let spriteMonster = SKSpriteNode(imageNamed:"monster")
        
        // x coordinate between MinX (left) and MaxX (right):
        let randomX = randomInRange(Int(CGRectGetMinX(self.frame)), hi: Int(CGRectGetMaxX(self.frame)))
        // y coordinate between MinY (top) and MidY (middle):
        let randomY = randomInRange(Int(CGRectGetMinY(self.frame)), hi: Int(CGRectGetMidY(self.frame)))
        let randomPoint = CGPoint(x: randomX, y: randomY+200)
        
        
        spriteMonster.position = randomPoint
        spriteMonster.position.x = 1000
        spriteMonster.zPosition = 2
        
        self.addChild(spriteMonster)
        
        // Determine speed of the monster
        let actualDuration = randomInRange( 2, hi: 4)
        
        // Create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: -spriteMonster.size.width/2, y: spriteMonster.position.y), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        spriteMonster.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        
        
    }
    
    func randomInRange(lo: Int, hi : Int) -> Int {
        return lo + Int(arc4random_uniform(UInt32(hi - lo + 1)))
    }
    
}












