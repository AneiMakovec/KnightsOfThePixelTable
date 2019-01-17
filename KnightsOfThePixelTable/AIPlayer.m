//
//  AIPlayer.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "AIPlayer.h"
#import "Pixlron.Knights.h"

@implementation AIPlayer

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
    self = [super initWithGame:theGame];
    if (self != nil) {
        level = theLevel;
        
        myTurn = NO;
        turnEnded = NO;
        state = AIStateScanOpponentData;
        attackPosition = FirstCombatPosition;
        
        assignedDices = [[NSMutableArray alloc] init];
        
        diceAssignDelay = [[ResetableLifetime alloc] initWithStart:0 duration:2];
        attackPhaseDelay = [[ResetableLifetime alloc] initWithStart:0 duration:3];
        attackDelay = [[ResetableLifetime alloc] initWithStart:0 duration:0.2f];
        
        for (int i = 0; i < CombatPositions; i++) {
            dicesAssigned[i] = NO;
        }
    }
    return self;
}

@synthesize myTurn, turnEnded;

- (void) startTurn {
    // reset data
    [self reset];
    
    // and start over
    state = AIStateScanOpponentData;
    
    // roll dices
    myTurn = YES;
    [level.dicepool resetDicepool];
    [level.dicepool addDicesOfType:DiceFrameTypeEvil];
}

- (void) startTurnWithNewEntities:(BOOL)newWave {
    if (newWave) {
        // add a new wave
        [level.battlefield newWave];
    }
    
    [self startTurn];
}

- (void) endTurn {
    myTurn = NO;
    turnEnded = NO;
    [level.dicepool removeAllDices];
    [level.dicepool resetDicepool];
    [assignedDices removeAllObjects];
    
    for (int i = 0; i < CombatPositions; i++) {
        dicesAssigned[i] = NO;
    }
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    if (myTurn) {
        // scan opponent entities for data
        if (state == AIStateScanOpponentData) {
            CombatPosition pos = FirstCombatPosition;
            for (Knight *knight in level.battlefield.allyEntities) {
                opponentEntityDamageTypes[pos] = knight.damageType;
                pos++;
            }
                
            state = AIStateScanOwnData;
            NSLog(@"Finished scanning opponent data!");
            
        // scan own entities for metadata
        } else if (state == AIStateScanOwnData) {
            CombatPosition pos = FirstCombatPosition;
            for (Monster *monster in level.battlefield.enemyEntities) {
                ownEntityDamageTypes[pos] = monster.damageType;
                pos++;
            }

            state = AIStateScanDices;
            NSLog(@"Finished scanning own data!");
        
        // scan dices for usable combos
        } else if (state == AIStateScanDices) {
            for (Dice *dice in level.dicepool.dices) {
                countDices[dice.type]++;
            }
            
            state = AIStateAssignDices;
            NSLog(@"Finished scanning dices!");
            
        // assign dices to combat entities
        } else if (state == AIStateAssignDices) {
            [diceAssignDelay updateWithGameTime:gameTime];
            if (![diceAssignDelay isAlive]) {
                [diceAssignDelay reset];
                
                [self assignDices];
                    
                state = AIStateAttack;
                NSLog(@"Finished assigning dices!");
            }
            
        } else if (state == AIStateWait) {
            [attackPhaseDelay updateWithGameTime:gameTime];
            if (![attackPhaseDelay isAlive]) {
                [attackPhaseDelay reset];
                
                state = AIStateAttack;
            }
            
        // attack
        } else if (state == AIStateAttack) {
            if ([self checkIfCombosSet]) {
                if (attackPosition < CombatPositions) {
                    Monster *monster = [level.battlefield getEnemyAtPosition:attackPosition];
                    
                    if (monster) {
                        if (monster.skillType != NoSkill) {
                            [attackDelay updateWithGameTime:gameTime];
                            
                            if (![attackDelay isAlive]) {
                                [attackDelay reset];
                                
                                Knight *knight = [level.battlefield getAllyAtPosition:[Random intLessThan:CombatPositions]];
                                while (!knight || knight.isDead) {
                                    knight = [level.battlefield getAllyAtPosition:[Random intLessThan:CombatPositions]];
                                }
                            
                                [monster attackTarget:knight ally:NO];
                                attackPosition++;
                            }
                        }
                    } else {
                        attackPosition++;
                    }
                } else {
                    NSLog(@"Finished attacking!");
                    turnEnded = YES;
                }
            }
        }
    }
}

//- (void) calculateThreat {
//    // calculate damage type factors
//    float meleeDamageFactor = opponentEntityTypes[DamageTypeMelee] / ownEntityTypes[DamageTypeRanged];
//    float rangedDamageFactor = opponentEntityTypes[DamageTypeRanged] / ownEntityTypes[DamageTypeMagic];
//    float magicDamageFactor = opponentEntityTypes[DamageTypeMagic] / ownEntityTypes[DamageTypeMelee];
//
//    // calculate the threat level by multiplying the entities damage type factor with its damage strength
//    CombatPosition pos = FirstCombatPosition;
//    for (Knight *knight in level.battlefield.allyEntities) {
//        switch (knight.damageType) {
//            case DamageTypeMelee:
//                opponentEntityThreat[pos] = meleeDamageFactor * knight.damageStrength;
//                break;
//            case DamageTypeRanged:
//                opponentEntityThreat[pos] = rangedDamageFactor * knight.damageStrength;
//                break;
//            case DamageTypeMagic:
//                opponentEntityThreat[pos] = magicDamageFactor * knight.damageStrength;
//                break;
//
//            default:
//                break;
//        }
//
//        pos++;
//    }
//}


- (void) assignDices {
    // first check if any combos can be done
    Monster *monster;
    for (int i = 0; i < CombatPositions; i++) {
        monster = [level.battlefield getEnemyAtPosition:i];
        if (monster) {
            switch (countDices[monster.entityType]) {
                case 0:
                    break;
                    
                case 1:
                    if (countDices[[monster getAttackValueForAttack:FirstComboSkill]] > 0) {
                        [self assignToEntity:monster entityDices:1 dicesForAttack:FirstComboSkill numOfAttackDices:1];
                        dicesAssigned[i] = YES;
                    }
                    break;
                    
                case 2:
                    if (countDices[[monster getAttackValueForAttack:SecondComboSkill]] > 0) {
                        [self assignToEntity:monster entityDices:2 dicesForAttack:SecondComboSkill numOfAttackDices:1];
                        dicesAssigned[i] = YES;
                    }
                    break;
                    
                // 3 or more
                default:
                    if (countDices[[monster getAttackValueForAttack:ThirdComboSkill]] > 0) {
                        [self assignToEntity:monster entityDices:3 dicesForAttack:ThirdComboSkill numOfAttackDices:1];
                        dicesAssigned[i] = YES;
                    }
                    break;
            }
        }
    }
    
    // second, go trough entities again and assign basic attacks
    for (int i = 0; i < CombatPositions; i++) {
        monster = [level.battlefield getEnemyAtPosition:i];
        if (monster && !dicesAssigned[i]) {
            [self assignOneDiceToEntity:monster];
        }
    }
}

//- (CombatPosition) getMaxThreat {
//    float maxThreat = 0.0f;
//    CombatPosition maxThreatPos = -1;
//
//    // scan the threat levels and find the highest
//    for (CombatPosition pos = FirstCombatPosition; pos < CombatPositions; pos++) {
//        if (opponentEntityThreat[pos] > maxThreat) {
//            maxThreat = opponentEntityThreat[pos];
//            maxThreatPos = pos;
//        }
//    }
//
//    return maxThreatPos;
//}

//- (CombatPosition) getBestCounterFor:(DamageType)theType {
//    CombatPosition bestCounterPos = FirstCombatPosition;
//    switch (theType) {
//        case DamageTypeMelee:
//            bestCounterPos = [self getBestDamageOfType:DamageTypeMagic];
//            if (bestCounterPos == CombatPositions) {
//                bestCounterPos = [self getBestDamageOfType:DamageTypeMelee];
//                if (bestCounterPos == CombatPositions) {
//                    bestCounterPos = [self getBestDamageOfType:DamageTypeRanged];
//                }
//            }
//
//            break;
//        case DamageTypeRanged:
//            bestCounterPos = [self getBestDamageOfType:DamageTypeMelee];
//            if (bestCounterPos == CombatPositions) {
//                bestCounterPos = [self getBestDamageOfType:DamageTypeRanged];
//                if (bestCounterPos == CombatPositions) {
//                    bestCounterPos = [self getBestDamageOfType:DamageTypeMagic];
//                }
//            }
//
//            break;
//        case DamageTypeMagic:
//            bestCounterPos = [self getBestDamageOfType:DamageTypeRanged];
//            if (bestCounterPos == CombatPositions) {
//                bestCounterPos = [self getBestDamageOfType:DamageTypeMagic];
//                if (bestCounterPos == CombatPositions) {
//                    bestCounterPos = [self getBestDamageOfType:DamageTypeMelee];
//                }
//            }
//
//            break;
//
//        default:
//            break;
//    }
//
//    return bestCounterPos;
//}

//- (CombatPosition) getBestDamageOfType:(DamageType)theType {
//    float bestCounter = -1.0f;
//    CombatPosition bestCounterPos = CombatPositions;
//
//    // scan own entities and find the best counter for its damage type
//    for (CombatPosition pos = FirstCombatPosition; pos < CombatPositions; pos++) {
//        if (ownEntityDamageTypes[pos] == theType) {
//            if ([level.battlefield getEnemyAtPosition:pos].damageStrength > bestCounter) {
//                bestCounter = [level.battlefield getEnemyAtPosition:pos].damageStrength;
//                bestCounterPos = pos;
//            }
//        }
//    }
//
//    return bestCounterPos;
//}

- (void) assignToEntity:(Monster *)theEntity entityDices:(int)entityNum dicesForAttack:(SkillType)theAttack numOfAttackDices:(int)attackNum {
    if ([level.dicepool.dices count] > 0) {
        int entityCount = 0;
        int attackCount = 0;
        for (Dice *dice in level.dicepool.dices) {
            if (![assignedDices containsObject:dice]) {
                if (entityCount < entityNum && dice.type == theEntity.entityType) {
                    [dice moveToTarget:theEntity withDicepool:level.dicepool];
                    [assignedDices addObject:dice];
                    countDices[dice.type]--;
                    entityCount++;
                } else if (attackCount < attackNum && dice.type == [theEntity getAttackValueForAttack:theAttack]) {
                    [dice moveToTarget:theEntity withDicepool:level.dicepool];
                    [assignedDices addObject:dice];
                    countDices[dice.type]--;
                    attackCount++;
                }
            }
        }
    }
}

- (void) assignOneDiceToEntity:(Monster *)theEntity {
    if ([level.dicepool.dices count] > 0) {
        Dice *dice = [[level.dicepool.dices objectAtIndex:[Random intLessThan:[level.dicepool.dices count]]] retain];
        
        while ([assignedDices containsObject:dice]) {
            dice = [[level.dicepool.dices objectAtIndex:[Random intLessThan:[level.dicepool.dices count]]] retain];
        }
        
        [dice moveToTarget:theEntity withDicepool:level.dicepool];
        [assignedDices addObject:dice];
    }
}

- (BOOL) checkIfCombosSet {
    for (Monster *monster in level.battlefield.enemyEntities) {
        if ([monster areDicesComming]) {
            return false;
        }
    }
    
    return true;
}


- (void) reset {
    for (int i = 0; i < StatTypes; i++) {
        countDices[i] = 0;
    }
    
    for (int i = 0; i < CombatPositions; i++) {
        ownEntityDamageTypes[i] = NoDamageType;
        opponentEntityDamageTypes[i] = NoDamageType;
    }
    
    attackPosition = FirstCombatPosition;
}

- (void) dealloc {
    if (target) {
        [target release];
    }
    [diceAssignDelay release];
    [attackPhaseDelay release];
    [attackDelay release];
    
    [super dealloc];
}

@end
