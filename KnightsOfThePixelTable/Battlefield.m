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

- (id) initWithLevel:(Level *)theLevel {
    
    self = [super init];
    if (self != nil) {
        level = theLevel;
        
        allyEntities = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        enemyEntities = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        
        
        // add the entities
        KnightLancelot *lancelot = [[KnightLancelot alloc] init];
        [lancelot setCombatPosition:FirstCombatPosition];
        [allyEntities insertObject:lancelot atIndex:FirstCombatPosition];
        [level.scene addItem:lancelot];
        [lancelot release];
        
        
        KnightLancelot *secondLancelot = [[KnightLancelot alloc] init];
        [secondLancelot setCombatPosition:SecondCombatPosition];
        [allyEntities insertObject:secondLancelot atIndex:SecondCombatPosition];
        [level.scene addItem:secondLancelot];
        [secondLancelot release];
        
        
        Monster *monster = [[Monster alloc] initMonster:MonsterTypeWarrior health:100 damageStrength:0.5 maxRadius:60];
        [monster setCombatPosition:FirstCombatPosition];
        [enemyEntities insertObject:monster atIndex:FirstCombatPosition];
        [level.scene addItem:monster];
        [level.scene addItem:monster.origin];
        [monster release];
    }
    return self;
}

@synthesize allyEntities, enemyEntities;


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



- (void) updateWithGameTime:(GameTime *)gameTime {
    
    // check if entities are still alive
    
    // allies
    NSMutableArray *removedKnights = [[NSMutableArray alloc] init];
    
    for (Knight *knight in allyEntities) {
        if (knight.isDead) {
            [removedKnights addObject:knight];
        }
    }
    
    for (Knight *knight in removedKnights) {
        [allyEntities removeObject:knight];
        [level.scene removeItem:knight];
    }
    
    [removedKnights release];
    
    
    // enemies
    NSMutableArray *removedMonsters = [[NSMutableArray alloc] init];
    
    for (Monster *monster in allyEntities) {
        if (monster.isDead) {
            [removedMonsters addObject:monster];
        }
    }
    
    for (Monster *monster in removedMonsters) {
        [enemyEntities removeObject:monster];
        [level.scene removeItem:monster];
    }
    
    [removedMonsters release];
}


- (void) dealloc {
    [allyEntities release];
    [enemyEntities release];
    [super dealloc];
}

@end
