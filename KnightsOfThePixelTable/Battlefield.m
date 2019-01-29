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
    }
    return self;
}

@synthesize allyEntities, enemyEntities, enemyFrontRow, enemyBackRow, allyFrontRow, allyBackRow;


- (void) initialize {
    // add ally entities
    KnightBrawler *brawler;
    brawler = [[KnightBrawler alloc] initWithLevel:level gameHud:hud];
    [brawler setCombatPosition:FirstCombatPosition];
    [allyEntities insertObject:brawler atIndex:FirstCombatPosition];
    [level.scene addItem:brawler];
    [brawler release];
    
    KnightBowman *bowman;
    bowman = [[KnightBowman alloc] initWithLevel:level gameHud:hud];
    [bowman setCombatPosition:SecondCombatPosition];
    [allyEntities insertObject:bowman atIndex:SecondCombatPosition];
    [level.scene addItem:bowman];
    [bowman release];
    
    KnightPaladin *paladin;
    paladin = [[KnightPaladin alloc] initWithLevel:level gameHud:hud];
    [paladin setCombatPosition:ThirdCombatPosition];
    [allyEntities insertObject:paladin atIndex:ThirdCombatPosition];
    [level.scene addItem:paladin];
    [paladin release];
    
    KnightFireEnchantress *enchantress;
    enchantress = [[KnightFireEnchantress alloc] initWithLevel:level gameHud:hud];
    [enchantress setCombatPosition:FourthCombatPosition];
    [allyEntities insertObject:enchantress atIndex:FourthCombatPosition];
    [level.scene addItem:enchantress];
    [enchantress release];
    
    // add enemy entities
    [self newWave];
    
    // calculate row attack positions
    Monster *firstEnemy = [enemyEntities objectAtIndex:FirstCombatPosition];
    Monster *secondEnemy = [enemyEntities objectAtIndex:SecondCombatPosition];
    Monster *thirdEnemy = [enemyEntities objectAtIndex:ThirdCombatPosition];
    Monster *fourthEnemy = [enemyEntities objectAtIndex:FourthCombatPosition];
    
    int x = secondEnemy.origin.position.x - 56;
    int y = firstEnemy.origin.position.y + ((secondEnemy.origin.position.y - firstEnemy.origin.position.y) / 2);
    enemyFrontRow = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:x y:y] radius:5];
    
    x = fourthEnemy.origin.position.x - 56;
    y = thirdEnemy.origin.position.y + ((fourthEnemy.origin.position.y - thirdEnemy.origin.position.y) / 2);
    enemyBackRow = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:x y:y] radius:5];
    
    
    Knight *firstAlly = [allyEntities objectAtIndex:FirstCombatPosition];
    Knight *secondAlly = [allyEntities objectAtIndex:SecondCombatPosition];
    Knight *thirdAlly = [allyEntities objectAtIndex:ThirdCombatPosition];
    Knight *fourthAlly = [allyEntities objectAtIndex:FourthCombatPosition];
    
    x = secondAlly.position.x + 56;
    y = firstAlly.position.y + ((secondAlly.position.y - firstAlly.position.y) / 2);
    allyFrontRow = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:x y:y] radius:5];
    
    NSLog(@"ally front row - x: %f, y: %f", allyFrontRow.position.x, allyFrontRow.position.y);
    
    x = fourthAlly.position.x + 56;
    y = thirdAlly.position.y + ((fourthAlly.position.y - thirdAlly.position.y) / 2);
    allyBackRow = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:x y:y] radius:5];
}


- (void) setGameHud:(GameHud *)theHud {
    hud = theHud;
}


- (Knight *) getAllyAtPosition:(CombatPosition)thePosition {
    if ([allyEntities count] > thePosition) {
        return [allyEntities objectAtIndex:thePosition];
    } else {
        return nil;
    }
}

- (BOOL) containsAlly:(CombatEntity *)theAlly {
    return [allyEntities containsObject:theAlly];
}

- (int) getCombatPositionOfAlly:(Knight *)theAlly {
    return (int)[allyEntities indexOfObject:theAlly];
}

- (void) removeAlly:(Knight *)theAlly {
    [allyEntities removeObject:theAlly];
    [level.scene removeItem:theAlly];
}

- (Monster *) getEnemyAtPosition:(CombatPosition)thePosition {
    if ([enemyEntities count] > thePosition) {
        return [enemyEntities objectAtIndex:thePosition];
    } else {
        return nil;
    }
}

- (BOOL) containsEnemy:(CombatEntity *)theEnemy {
    return [enemyEntities containsObject:theEnemy];
}

- (int) getCombatPositionOfEnemy:(Monster *)theEnemy {
    return (int)[enemyEntities indexOfObject:theEnemy];
}

- (void) removeEnemy:(Monster *)theEnemy {
    // give experience to allies
    for (Knight *knight in allyEntities) {
        [knight gainExperience:[theEnemy giveExperience]];
        
        // add exp gain indicator
        [hud addExpIndicatorAt:knight.origin.position amount:theEnemy.giveExperience];
    }
    
    [enemyEntities removeObject:theEnemy];
    [level.scene removeItem:theEnemy];
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    
//    // check if entities are still alive
//
//    // allies
//    NSMutableArray *removedKnights = [[NSMutableArray alloc] init];
//
//    for (Knight *knight in allyEntities) {
//        if (knight.isDead) {
//            [removedKnights addObject:knight];
//        }
//    }
//
//    for (Knight *knight in removedKnights) {
//        [allyEntities removeObject:knight];
//        [level.scene removeItem:knight];
//    }
//
//    [removedKnights release];
//
//
//    // enemies
//    NSMutableArray *removedMonsters = [[NSMutableArray alloc] init];
//
//    for (Monster *monster in enemyEntities) {
//        if (monster.isDead) {
//            [removedMonsters addObject:monster];
//        }
//    }
//
//    for (Monster *monster in removedMonsters) {
//
//        // give experience to allies
//        for (Knight *knight in allyEntities) {
//            [knight gainExperience:[monster giveExperience]];
//
//            // add exp gain indicator
//            [hud addExpIndicatorAt:knight.origin.position amount:monster.giveExperience];
//        }
//
//        [enemyEntities removeObject:monster];
//        [level.scene removeItem:monster];
//    }
//
//    [removedMonsters release];
}

- (void) newWave {
    
    Monster *monster;
    switch (level.levelType) {
        case LevelTypeFarmlands:
            for (int i = 0; i < CombatPositions; i++) {
                
                // add enemy entities
                monster = [[MonsterBrute alloc] initWithLevel:level gameHud:hud];
                [monster setCombatPosition:i];
                [enemyEntities insertObject:monster atIndex:i];
                [level.scene addItem:monster];
                [monster release];
            }
            break;
            
        case LevelTypeMountains:
            for (int i = 0; i < CombatPositions; i++) {
                
                // add enemy entities
                monster = [[MonsterWarrior alloc] initWithLevel:level gameHud:hud];
                [monster setCombatPosition:i];
                [enemyEntities insertObject:monster atIndex:i];
                [level.scene addItem:monster];
                [monster release];
            }
            break;
            
        case LevelTypeSeashore:
            for (int i = 0; i < CombatPositions; i++) {
                
                // add enemy entities
                monster = [[MonsterBossViking alloc] initWithLevel:level gameHud:hud];
                [monster setCombatPosition:i];
                [enemyEntities insertObject:monster atIndex:i];
                [level.scene addItem:monster];
                [monster release];
            }
            break;
            
        default:
            break;
    }
}

- (BOOL) hasAnyEnemyForAlly:(BOOL)isAlly {
    if (isAlly) {
        if ([enemyEntities count] > 0)
            return YES;
        else
            return NO;
    } else {
        if ([allyEntities count] > 0)
            return YES;
        else
            return NO;
    }
}


- (void) dealloc {
    [allyEntities release];
    [enemyEntities release];
    [super dealloc];
}

@end
