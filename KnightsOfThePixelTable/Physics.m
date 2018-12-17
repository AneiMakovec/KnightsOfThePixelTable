//
//  Physics.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Physics.h"

#import "PixEngine.Physics.h"
#import "PixEngine.Math.h"
#import "PixEngine.Utilities.h"
#import "Pixlron.Knights.h"

@implementation Physics

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
    self = [super initWithGame:theGame];
    if (self != nil) {
        level = theLevel;
    }
    return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
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
        Knight *cEntity = [item isKindOfClass:[Knight class]] ? (Knight *) item : nil;
        if (cEntity) {
            if (cEntity.state == EntityStateApproaching || cEntity.state == EntityStateRetreating) {
                [MovementPhysics simulateMovementOn:item withElapsed:gameTime.elapsedGameTime];
            }
        }
    }
    
    // check for collisions for dices and combat entities
    for (id item1 in level.scene) {
        if ([item1 isKindOfClass:[Dice class]] || [item1 isKindOfClass:[CombatEntity class]]) {
            for (id item2 in level.scene) {
                if (item1 != item2) {
                    [Collision collisionBetween:item1 and:item2];
                }
            }
        }
    }
}

@end
