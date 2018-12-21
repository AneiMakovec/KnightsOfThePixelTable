//
//  Physics.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "PhysicsEngine.h"

#import "PixEngine.Physics.h"
#import "PixEngine.Math.h"
#import "PixEngine.Utilities.h"
#import "Pixlron.Knights.h"

@implementation PhysicsEngine

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
    self = [super initWithGame:theGame];
    if (self != nil) {
        level = theLevel;
    }
    return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // move objects
    for (id item in level.scene) {
        
        // movement, rotation and height for dices
        Dice *dice = [item isKindOfClass:[Dice class]] ? (Dice *) item : nil;
        if (dice) {
            if (dice.state == DiceStateMoving) {
                [MovementPhysics simulateMovementOn:item withElapsed:gameTime.elapsedGameTime];
                
                if ([Random intLessThan:100] < 5) {
                    [SoundEngine play:SoundEffectTypeDice];
                }
                
                if (fabsf(dice.velocity.x) < 20 && fabsf(dice.velocity.y) < 20) {
                    dice.state = DiceStateStopped;
                    dice.ignoreCollision = YES;
                }
            }
            
            if (dice.altitude > 1) {
                if ([Random intLessThan:10] < 4) {
                    dice.altitude -= dice.altitudeVelocity;
                    [dice updateRadius];
                }
            }
        }
        
        // movement for combat entities
        CombatEntity *cEntity = [item isKindOfClass:[CombatEntity class]] ? (CombatEntity *) item : nil;
        if (cEntity) {
            if (cEntity.state == EntityStateApproaching || cEntity.state == EntityStateRetreating) {
                [MovementPhysics simulateMovementOn:item withElapsed:gameTime.elapsedGameTime];
            }
        }
    }
    
    // check for collisions between objects
    for (id item1 in level.scene) {
        
        // dices
        Dice *dItem = [item1 isKindOfClass:[Dice class]] ? (Dice *) item1 : nil;
        if (dItem && !dItem.ignoreCollision) {
            // collision with other dices
            for (Dice *dice in level.dicepool.dices) {
                if (item1 != dice) {
                    [Collision collisionBetween:item1 and:dice];
                }
            }
            
            // collision with borders
            for (DicepoolLimit *border in level.dicepool.borders) {
                [Collision collisionBetween:item1 and:border];
            }
        }
        
        // combat entities
        CombatEntity *cEntity = [item1 isKindOfClass:[CombatEntity class]] ? (CombatEntity *) item1 : nil;
        if (cEntity) {
            if (cEntity.state == EntityStateApproaching) {
                // collision with target
                [Collision collisionBetween:cEntity and:cEntity.target];
            } else if (cEntity.state == EntityStateRetreating) {
                // collision with origin
                [Collision collisionBetween:cEntity and:cEntity.origin];
            }
        }
    }
}

@end
