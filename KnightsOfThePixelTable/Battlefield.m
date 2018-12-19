//
//  Battlefield.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 17/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Battlefield.h"
#import "Pixlron.Knights.h"

@implementation Battlefield

- (id) initWithLevel:(Level *)theLevel width:(int)theWidth height:(int)theHeight {
    
    self = [super init];
    if (self != nil) {
        level = theLevel;
        
        allyEntities = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        enemyEntities = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        
        allyPositions = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        enemyPositions = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        
        enemyBounds = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        allyBounds = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        comboBounds = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        
        for (int i = 0; i < CombatPositions; i++) {
            allyPositions[i] = [[Vector2 alloc] init];
            enemyPositions[i] = [[Vector2 alloc] init];
            enemyBounds[i] = [[Rectangle alloc] init];
            allyBounds[i] = [[Rectangle alloc] init];
            comboBounds[i] = [[Rectangle alloc] init];
        }
        
        // create scale
        int hudOffset = theHeight * 0.625;
        stretcher = [[TextureStretcher alloc] initFromWidth:256.0f fromHeight:80.0f toWidth:(float)theWidth toHeight:(float)hudOffset xOffset:0 yOffset:0];
        
        // calculate positions for ally and enemy entities
        // 1. ally
        Vector2 *pos = [allyPositions objectAtIndex:FirstCombatPosition];
        pos.x = 77;
        pos.y = 46;
        [stretcher scalePosition:pos];
        
        // 2. ally
        pos = [allyPositions objectAtIndex:SecondCombatPosition];
        pos.x = 64;
        pos.y = 62;
        [stretcher scalePosition:pos];
        
        // 3. ally
        pos = [allyPositions objectAtIndex:ThirdCombatPosition];
        pos.x = 38;
        pos.y = 46;
        [stretcher scalePosition:pos];
        
        // 4. ally
        pos = [allyPositions objectAtIndex:FourthCombatPosition];
        pos.x = 26;
        pos.y = 62;
        [stretcher scalePosition:pos];
        
        
        // enemy positions + bounds
        Vector2 *posAlly;
        Rectangle *enemyBound;
        for (int i = 0; i < CombatPositions; i++) {
            pos = [enemyPositions objectAtIndex:i];
            posAlly = [allyPositions objectAtIndex:i];
            pos.x = theWidth - posAlly.x;
            pos.y = posAlly.y;
            
            enemyBound = [enemyBounds objectAtIndex:i];
            enemyBound.x = pos.x - 56;
            enemyBound.y = pos.y - 56;
            enemyBound.width = 112;
            enemyBound.height = 112;
        }
        

        
        // add the entities
        KnightLancelot *lancelot = [[KnightLancelot alloc] initWithPosition:[allyPositions objectAtIndex:FirstCombatPosition]];
        [allyEntities insertObject:lancelot atIndex:FirstCombatPosition];
        [level.scene addItem:lancelot];
        [level.scene addItem:lancelot.origin];
        
        
        KnightLancelot *enemyLancelot = [[KnightLancelot alloc] initWithPosition:[enemyPositions objectAtIndex:FirstCombatPosition]];
        [enemyEntities insertObject:enemyLancelot atIndex:FirstCombatPosition];
        [level.scene addItem:enemyLancelot];
        [level.scene addItem:enemyLancelot.origin];
        
        // release the scale
        [stretcher release];
    }
    return self;
}

@synthesize allyEntities, enemyEntities, allyPositions, enemyPositions, enemyBounds, allyBounds, comboBounds;


- (Knight *) getAllyAtPosition:(CombatPosition)thePosition {
    if ([allyEntities count] > thePosition) {
        return [allyEntities objectAtIndex:thePosition];
    } else {
        return nil;
    }
}

- (BOOL) containsAlly:(Knight *)theAlly {
    return [allyEntities containsObject:theAlly];
}

- (Knight *) getEnemyAtPosition:(CombatPosition)thePosition {
    if ([enemyEntities count] > thePosition) {
        return [enemyEntities objectAtIndex:thePosition];
    } else {
        return nil;
    }
}

- (BOOL) containsEnemy:(Knight *)theEnemy {
    return [enemyEntities containsObject:theEnemy];
}

- (Vector2 *) getPositionOfAlly:(CombatPosition)theAlly {
    if ([allyPositions count] > theAlly) {
        return [allyPositions objectAtIndex:theAlly];
    } else {
        return nil;
    }
}

- (Vector2 *) getPositionOfEnemy:(CombatPosition)theEnemy {
    if ([enemyPositions count] > theEnemy) {
        return [enemyPositions objectAtIndex:theEnemy];
    } else {
        return nil;
    }
}

- (Rectangle *) getBoundsOfEnemy:(CombatPosition)theEnemy {
    if ([enemyBounds count] > theEnemy) {
        return [enemyBounds objectAtIndex:theEnemy];
    } else {
        return nil;
    }
}


- (void) dealloc {
    for (int i = 0; i < CombatPositions; i++) {
        [allyEntities[i] release];
        [enemyEntities[i] release];
        [allyPositions[i] release];
        [enemyPositions[i] release];
    }
    
    [super dealloc];
}

@end
