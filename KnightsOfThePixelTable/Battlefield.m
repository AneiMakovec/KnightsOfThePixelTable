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
    brawler = [[KnightBrawler alloc] initWithBattlefield:self gameHud:hud];
    [brawler setCombatPosition:FirstCombatPosition];
    [allyEntities insertObject:brawler atIndex:FirstCombatPosition];
    [level.scene addItem:brawler];
    [brawler release];
    
    KnightBowman *bowman;
    bowman = [[KnightBowman alloc] initWithBattlefield:self gameHud:hud];
    [bowman setCombatPosition:SecondCombatPosition];
    [allyEntities insertObject:bowman atIndex:SecondCombatPosition];
    [level.scene addItem:bowman];
    [bowman release];
    
    KnightPaladin *paladin;
    paladin = [[KnightPaladin alloc] initWithBattlefield:self gameHud:hud];
    [paladin setCombatPosition:ThirdCombatPosition];
    [allyEntities insertObject:paladin atIndex:ThirdCombatPosition];
    [level.scene addItem:paladin];
    [paladin release];
    
    KnightFireEnchantress *enchantress;
    enchantress = [[KnightFireEnchantress alloc] initWithBattlefield:self gameHud:hud];
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
    
    int x = secondEnemy.position.x - 56;
    int y = firstEnemy.position.y + ((secondEnemy.position.y - firstEnemy.position.y) / 2);
    enemyFrontRow = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:x y:y] radius:5];
    
    x = fourthEnemy.position.x - 56;
    y = thirdEnemy.position.y + ((fourthEnemy.position.y - thirdEnemy.position.y) / 2);
    enemyBackRow = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:x y:y] radius:5];
    
    
    Knight *firstAlly = [allyEntities objectAtIndex:FirstCombatPosition];
    Knight *secondAlly = [allyEntities objectAtIndex:SecondCombatPosition];
    Knight *thirdAlly = [allyEntities objectAtIndex:ThirdCombatPosition];
    Knight *fourthAlly = [allyEntities objectAtIndex:FourthCombatPosition];
    
    x = secondAlly.position.x + 56;
    y = firstAlly.position.y + ((secondAlly.position.y - firstAlly.position.y) / 2);
    allyFrontRow = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:x y:y] radius:5];
    
    x = fourthAlly.position.x + 56;
    y = thirdAlly.position.y + ((fourthAlly.position.y - thirdAlly.position.y) / 2);
    allyBackRow = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:x y:y] radius:5];
}


- (void) setGameHud:(GameHud *)theHud {
    NSLog(@"Hud set");
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
            
            // add exp gain indicator
            [hud addExpIndicatorAt:knight.origin.position amount:monster.giveExperience];
        }
        
        [enemyEntities removeObject:monster];
        [level.scene removeItem:monster];
    }
    
    [removedMonsters release];
}

- (void) newWave {
    MonsterWarrior *monsterWarrior;
    for (int i = 0; i < 2; i++) {
        
        // add enemy entities
        monsterWarrior = [[MonsterWarrior alloc] initWithBattlefield:self gameHud:hud];
        [monsterWarrior setCombatPosition:i];
        [enemyEntities insertObject:monsterWarrior atIndex:i];
        [level.scene addItem:monsterWarrior];
        [monsterWarrior release];
    }
    
    MonsterBrute *monsterBrute;
    for (int i = 2; i < 4; i++) {
        
        // add enemy entities
        monsterBrute = [[MonsterBrute alloc] initWithBattlefield:self gameHud:hud];
        [monsterBrute setCombatPosition:i];
        [enemyEntities insertObject:monsterBrute atIndex:i];
        [level.scene addItem:monsterBrute];
        [monsterBrute release];
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
