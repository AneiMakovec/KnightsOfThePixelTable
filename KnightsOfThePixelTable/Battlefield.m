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

- (id) init {
    self = [super init];
    if (self != nil) {
        allyEntities = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        enemyEntities = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
    }
    return self;
}

@synthesize allyEntities, enemyEntities, enemyFrontRow, enemyBackRow, allyFrontRow, allyBackRow;


- (void) initialize {
    // add ally entities
//    KnightBrawler *brawler;
//    brawler = [[KnightBrawler alloc] initWithLevel:level gameHud:hud];
//    [brawler setCombatPosition:FirstCombatPosition];
//    [allyEntities insertObject:brawler atIndex:FirstCombatPosition];
//    [level.scene addItem:brawler];
//    [brawler release];
//
//    KnightBowman *bowman;
//    bowman = [[KnightBowman alloc] initWithLevel:level gameHud:hud];
//    [bowman setCombatPosition:SecondCombatPosition];
//    [allyEntities insertObject:bowman atIndex:SecondCombatPosition];
//    [level.scene addItem:bowman];
//    [bowman release];
//
//    KnightPaladin *paladin;
//    paladin = [[KnightPaladin alloc] initWithLevel:level gameHud:hud];
//    [paladin setCombatPosition:ThirdCombatPosition];
//    [allyEntities insertObject:paladin atIndex:ThirdCombatPosition];
//    [level.scene addItem:paladin];
//    [paladin release];
//
//    KnightFireEnchantress *enchantress;
//    enchantress = [[KnightFireEnchantress alloc] initWithLevel:level gameHud:hud];
//    [enchantress setCombatPosition:FourthCombatPosition];
//    [allyEntities insertObject:enchantress atIndex:FourthCombatPosition];
//    [level.scene addItem:enchantress];
//    [enchantress release];
    
    for (int i = 0; i < CombatPositions; i++) {
        Knight *knight = [[[Knight alloc] initWithData:[GameProgress getKnightOnCombatPosition:i] cobatPosition:i] autorelease];
        [allyEntities insertObject:knight atIndex:i];
        [Level addItemToScene:knight];
    }
    
    // add enemy entities
    [self newWave];
    
    // calculate row attack positions
//    Monster *firstEnemy = [enemyEntities objectAtIndex:FirstCombatPosition];
//    Monster *secondEnemy = [enemyEntities objectAtIndex:SecondCombatPosition];
//    Monster *thirdEnemy = [enemyEntities objectAtIndex:ThirdCombatPosition];
//    Monster *fourthEnemy = [enemyEntities objectAtIndex:FourthCombatPosition];
//
//    int x = secondEnemy.origin.position.x - 56;
//    int y = firstEnemy.origin.position.y + ((secondEnemy.origin.position.y - firstEnemy.origin.position.y) / 2);
//    enemyFrontRow = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:x y:y] radius:5];
//
//    x = fourthEnemy.origin.position.x - 56;
//    y = thirdEnemy.origin.position.y + ((fourthEnemy.origin.position.y - thirdEnemy.origin.position.y) / 2);
//    enemyBackRow = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:x y:y] radius:5];
//
//
//    Knight *firstAlly = [allyEntities objectAtIndex:FirstCombatPosition];
//    Knight *secondAlly = [allyEntities objectAtIndex:SecondCombatPosition];
//    Knight *thirdAlly = [allyEntities objectAtIndex:ThirdCombatPosition];
//    Knight *fourthAlly = [allyEntities objectAtIndex:FourthCombatPosition];
//
//    x = secondAlly.position.x + 56;
//    y = firstAlly.position.y + ((secondAlly.position.y - firstAlly.position.y) / 2);
//    allyFrontRow = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:x y:y] radius:5];
//
//    x = fourthAlly.position.x + 56;
//    y = thirdAlly.position.y + ((fourthAlly.position.y - thirdAlly.position.y) / 2);
//    allyBackRow = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:x y:y] radius:5];
}


- (Knight *) getAllyAtPosition:(CombatPosition)thePosition {
    if ([allyEntities count] > thePosition)
        return [allyEntities objectAtIndex:thePosition];
    else
        return nil;
}

- (BOOL) containsAlly:(CombatEntity *)theAlly {
    return [allyEntities containsObject:theAlly];
}

- (CombatPosition) getCombatPositionOfAlly:(Knight *)theAlly {
    return (CombatPosition)[allyEntities indexOfObject:theAlly];
}

- (void) removeAlly:(Knight *)theAlly {
    [Level removeItemFromScene:theAlly];
    [allyEntities removeObject:theAlly];
}

- (Monster *) getEnemyAtPosition:(CombatPosition)thePosition {
    if ([enemyEntities count] > thePosition)
        return [enemyEntities objectAtIndex:thePosition];
    else
        return nil;
}

- (BOOL) containsEnemy:(CombatEntity *)theEnemy {
    return [enemyEntities containsObject:theEnemy];
}

- (CombatPosition) getCombatPositionOfEnemy:(Monster *)theEnemy {
    return (CombatPosition)[enemyEntities indexOfObject:theEnemy];
}

- (void) removeEnemy:(Monster *)theEnemy {
    // give experience to allies
//    for (Knight *knight in allyEntities) {
//        [knight gainExperience:[theEnemy giveExperience]];
//
//        // add exp gain indicator
//        [hud addExpIndicatorAt:knight.origin.position amount:theEnemy.giveExperience];
//    }
    
    [Level removeItemFromScene:theEnemy];
    [enemyEntities removeObject:theEnemy];
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    
//    // check if entities are still alive
//
//    // allies
//    NSMutableArray *removedKnights = [[NSMutableArray alloc] init];
//
//    for (Knight *knight in allyEntities) {
//        if (knight.state == EntityStateDead) {
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
//        if (monster.state == EntityStateDead) {
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
    for (int i = 0; i < CombatPositions; i++) {
        MonsterData *data;
        StageType stage = [GameProgress currentStage];
        if (stage == StageEasyFifth || stage == StageMediumFifth || stage == StageHardFifth) {
            if ([GameHud isLastWave] && i == ThirdCombatPosition) {
                MonsterType types[LevelTypes] = {MonsterTypeBossFarmlands, MonsterTypeBossPinewoods, MonsterTypeBossMountains, MonsterTypeBossSeashore};
                data = [[[MonsterData alloc] initWithType:types[[GameProgress currentLevel]] lvl:[Constants getMonsterLvlForStage:[GameProgress currentStage] ofLevel:[GameProgress currentLevel]]] autorelease];
            } else {
                data = [[[MonsterData alloc] initWithType:[Random intLessThan:MonsterTypeBossFarmlands] lvl:[Constants getMonsterLvlForStage:[GameProgress currentStage] ofLevel:[GameProgress currentLevel]]] autorelease];
            }
        } else {
            data = [[[MonsterData alloc] initWithType:[Random intLessThan:MonsterTypeBossFarmlands] lvl:[Constants getMonsterLvlForStage:[GameProgress currentStage] ofLevel:[GameProgress currentLevel]]] autorelease];
        }
        
        Monster *monster = [[[Monster alloc] initWithData:data cobatPosition:i] autorelease];
        [enemyEntities insertObject:monster atIndex:i];
        [Level addItemToScene:monster];
    }
}

- (BOOL) hasAnyEnemyForAlly:(BOOL)isAlly {
    if (isAlly) {
        if ([enemyEntities count] > 0) {
            for (Monster *monster in enemyEntities) {
                if (monster.state != EntityStateDead)
                    return YES;
            }
            
            return NO;
        } else {
            return NO;
        }
    } else {
        if ([allyEntities count] > 0) {
            for (Knight *knight in allyEntities) {
                if (knight.state != EntityStateDead)
                    return YES;
            }
            
            return NO;
        } else {
            return NO;
        }
    }
}


- (BOOL) hasAnyEnemyInFrontRowForAlly:(BOOL)isAlly {
    if (isAlly) {
        if ([enemyEntities objectAtIndex:FirstCombatPosition] || [enemyEntities objectAtIndex:SecondCombatPosition])
            return YES;
    } else {
        if ([allyEntities objectAtIndex:FirstCombatPosition] || [allyEntities objectAtIndex:SecondCombatPosition])
            return YES;
    }
    
    return NO;
}

- (BOOL) hasAnyEnemyInBackRowForAlly:(BOOL)isAlly {
    if (isAlly) {
        if ([enemyEntities objectAtIndex:ThirdCombatPosition] || [enemyEntities objectAtIndex:FourthCombatPosition])
            return YES;
    } else {
        if ([allyEntities objectAtIndex:ThirdCombatPosition] || [allyEntities objectAtIndex:FourthCombatPosition])
            return YES;
    }
    
    return NO;
}

- (BOOL) addDice:(Dice *)dice toPosition:(CombatPosition)pos {
    Knight *knight = [allyEntities objectAtIndex:pos];
    if (knight) {
        return [knight addComboItem:dice];
    }
    
    return false;
}


- (void) dealloc {
    [allyEntities release];
    [enemyEntities release];
    [super dealloc];
}

@end
