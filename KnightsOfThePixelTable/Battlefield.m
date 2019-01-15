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
        
        
        KnightLancelot *lancelot;
        MonsterWarrior *monster;
        for (int i = 0; i < CombatPositions; i++) {
            // add ally entities
            lancelot = [[KnightLancelot alloc] init];
            [lancelot setCombatPosition:i];
            [allyEntities insertObject:lancelot atIndex:i];
            [level.scene addItem:lancelot];
            [lancelot release];
            
            // add enemy entities
            monster = [[MonsterWarrior alloc] init];
            [monster setCombatPosition:i];
            [enemyEntities insertObject:monster atIndex:i];
            [level.scene addItem:monster];
            [monster release];
        }
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

- (Monster *) getEnemyAtPosition:(CombatPosition)thePosition {
    if ([enemyEntities count] > thePosition) {
        return [enemyEntities objectAtIndex:thePosition];
    } else {
        return nil;
    }
}

- (BOOL) containsEnemy:(Monster *)theEnemy {
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
    
    for (Monster *monster in enemyEntities) {
        if (monster.isDead) {
            [removedMonsters addObject:monster];
        }
    }
    
    for (Monster *monster in removedMonsters) {
        // give experience to allies
        for (Knight *knight in allyEntities) {
            [knight gainExperience:[monster giveExperience]];
        }
        
        [enemyEntities removeObject:monster];
        [level.scene removeItem:monster];
    }
    
    [removedMonsters release];
}

- (void) newWave {
    MonsterWarrior *monster;
    for (int i = 0; i < CombatPositions; i++) {
        
        // add enemy entities
        monster = [[MonsterWarrior alloc] init];
        [monster setCombatPosition:i];
        [enemyEntities insertObject:monster atIndex:i];
        [level.scene addItem:monster];
        [monster release];
    }
}


- (void) dealloc {
    [allyEntities release];
    [enemyEntities release];
    [super dealloc];
}

@end
