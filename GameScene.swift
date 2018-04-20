//
//  GameScene.swift
//  HorcruxMain
//
//  Created by JASHAN SANGWAN on 20/04/2018.
//  Copyright © 2018 JASHAN SANGWAN. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var Character:SKSpriteNode = SKSpriteNode()
    var Speeed:TimeInterval= 0.6
    //Increases the speed of the player
    override func didMove(to view: SKView) {
        
        self.physicsWorld.gravity = CGVector(dx: 1, dy: 0)
        // provides a little wind to the character
        
        if let Player:SKSpriteNode = self.childNode(withName: "Main_Player") as? SKSpriteNode{
            Character = Player
            Character.physicsBody?.isDynamic = false
            self.Character.physicsBody?.affectedByGravity = false
            //if set to true wont be affected by gravity
        }

    }
    func moveDown() {
        let walkAnimation:SKAction = SKAction(named: "WalkUp")!
        
        let wait:SKAction = SKAction.wait(forDuration: Speeed //to set some frames of duration
        
        let moveAction:SKAction = SKAction.moveBy(x: 0, y: -50, duration: Speeed)
        
        let group:SKAction = SKAction.group([walkAnimation, moveAction])
        
        let end:SKAction = SKAction.run {
            
            
            print("Ended")
        }
        
        let seq:SKAction = SKAction.sequence([wait, group, end])
        
        Character.run(seq)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
        if ( pos.y > 0){
            
            //upper half touch
            
        }
        else{
        //goes down half
            moveDown()
        
    }
    }
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
