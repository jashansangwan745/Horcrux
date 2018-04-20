//
//  NSObject+Lvel.m
//  HorcruxMain
//
//  Created by JASHAN SANGWAN on 20/04/2018.
//  Copyright © 2018 JASHAN SANGWAN. All rights reserved.
//

#import "NSObject+Lvel.h"
#import "HSConst.h"

@interface NSObject() : {
    SKNode* Map;
    GameScene.swift
}

@end


@implementation NSObject (Lvel)

-(id)initWithSize: (Size)size{
    if ( self= [super initWithSize:size]){
        
        [self setUpScene];
        [self performSelector:@selector(setUpCharacters) withObject:nil afterDelay:2.0];
        
        
    }
    
    -(void) setUpScene {
        // keeps a track of the level 1 map and brings the Gamelist
        
        self.anchorPoint = CGPointMake(0.5, 0.5)
        //rangiong from 0 to 1
        Map = [SKNode node];
        [self addChild:Map];
        
        SKSprintNode* map = [SKSprintNode SpriteNodeWithImageNamed:@"Map"];
        map.position = PointMake(0, 0)
        [Map addChild:map];
        
        // Seting Up the Physical Cordinations
        self.physicsWorld.gravity= VectorMake(0,0)
        self.physicalWorld.contactDelegate = self;
        
        Map.physicsBody = [SkPhysicsBody bosyWithEdgeLoopFromReact:map.frame];
        Map.physicsBody.categoryBitMask = wallCategory;
        
        
        
        
    }
    -(void) setUpCharacters {
        
        NSLog("@Set up characters");
        
        
    }
    
    -(void)update:(CFTimeInterval)currentTime {
        //these are called after and before every frame is rendered
    }
    
    
}



@end
