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
        state = AIStateScanOpponentMetadata;
        
        delay = [[ResetableLifetime alloc] initWithStart:0 duration:2];
    }
    return self;
}

@synthesize myTurn;

- (void) startTurn {
    myTurn = YES;
    [level.dicepool resetDicepool];
    [level.dicepool addDicesOfType:DiceFrameTypeEvil];
}

- (void) startTurnWithNewEntities:(BOOL)newWave {
    if (newWave) {
        state = AIStateScanOwnMetadata;
    }
    
    [self startTurn];
}

- (void) endTurn {
    myTurn = NO;
    state = AIStateScanDices;
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    if (myTurn) {
        // scan opponent entities for metadata
        if (state == AIStateScanOpponentMetadata) {
            CombatPosition pos = FirstCombatPosition;
            for (Knight *knight in level.battlefield.allyEntities) {
                opponentEntityTypes[knight.damageType]++;
                opponentEntityDamageTypes[pos] = knight.damageType;
                pos++;
            }
            
            state = AIStateScanOwnMetadata;
            NSLog(@"Finished scanning opponent metadata!");
            
        // scan own entities for metadata
        } else if (state == AIStateScanOwnMetadata) {
            CombatPosition pos = FirstCombatPosition;
            for (Monster *monster in level.battlefield.enemyEntities) {
                ownEntityTypes[monster.damageType]++;
                ownEntityDamageTypes[pos] = monster.damageType;
                pos++;
            }
            
            // also calculate opponent entity threat
            [self calculateThreat];
            
            state = AIStateScanDices;
            NSLog(@"Finished scanning own metadata!");
        
        // scan dices for usable combos
        } else if (state == AIStateScanDices) {
            for (Dice *dice in level.dicepool.dices) {
                countDices[dice.type]++;
            }
            
            state = AIStateAssignDices;
            NSLog(@"Finished scanning dices!");
            
        // assign dices to combat entities
        } else if (state == AIStateAssignDices) {
            [delay updateWithGameTime:gameTime];
            if (![delay isAlive]) {
                [delay reset];
                
                [self assignDices];
            
                state = AIStateAttack;
                NSLog(@"Finished assigning dices!");
            }
            
        // attack
        } else if (state == AIStateAttack) {
            for (Monster *monster in level.battlefield.enemyEntities) {
                // if entity is ready to attack
                if (!monster.finishedAttacking && monster.attackType != NoAttack && monster.state == EntityStateIdle) {
                    // attack the target
                    [monster attackTarget:[level.battlefield getAllyAtPosition:FirstCombatPosition]];
                }
            }
        }
    }
}

- (void) calculateThreat {
    // calculate damage type factors
    float meleeDamageFactor = opponentEntityTypes[DamageTypeMelee] / ownEntityTypes[DamageTypeRanged];
    float rangedDamageFactor = opponentEntityTypes[DamageTypeRanged] / ownEntityTypes[DamageTypeMagic];
    float magicDamageFactor = opponentEntityTypes[DamageTypeMagic] / ownEntityTypes[DamageTypeMelee];
    
    // calculate the threat level by multiplying the entities damage type factor with its damage strength
    CombatPosition pos = FirstCombatPosition;
    for (Knight *knight in level.battlefield.allyEntities) {
        switch (knight.damageType) {
            case DamageTypeMelee:
                opponentEntityThreat[pos] = meleeDamageFactor * knight.damageStrength;
                break;
            case DamageTypeRanged:
                opponentEntityThreat[pos] = rangedDamageFactor * knight.damageStrength;
                break;
            case DamageTypeMagic:
                opponentEntityThreat[pos] = magicDamageFactor * knight.damageStrength;
                break;
                
            default:
                break;
        }
        
        pos++;
    }
}

- (void) assignDices {
    // gat max threat entity
    CombatPosition maxThreat = [self getMaxThreat];
    NSLog(@"Max threat is on position %d!", maxThreat + 1);
    
    // get your best entity to counter
    CombatPosition bestCounter = [self getBestCounterFor:opponentEntityDamageTypes[maxThreat]];
    NSLog(@"Best counter is on position %d!", bestCounter + 1);
    
    // scan the dices and find its best combo and assign them to it
    Monster *best = [level.battlefield getEnemyAtPosition:bestCounter];
    if ([best.combo count] < ComboItems) {
        switch (countDices[best.entityType]) {
            case 0:
                [self assignOneDiceToEntity:best];
                break;
            case 1:
                if (countDices[[best getAttackValueForAttack:FirstComboAttack]] > 0) {
                    [self assignToEntity:best entityDices:1 dicesForAttack:FirstComboAttack numOfAttackDices:1];
                } else {
                    [self assignOneDiceToEntity:best];
                }
                break;
            case 2:
                if (countDices[[best getAttackValueForAttack:SecondComboAttack]] > 0) {
                    [self assignToEntity:best entityDices:2 dicesForAttack:SecondComboAttack numOfAttackDices:1];
                } else {
                    [self assignOneDiceToEntity:best];
                }
                break;
                
            // 3 or more
            default:
                if (countDices[[best getAttackValueForAttack:ThirdComboAttack]] > 0) {
                    [self assignToEntity:best entityDices:3 dicesForAttack:ThirdComboAttack numOfAttackDices:1];
                } else {
                    [self assignOneDiceToEntity:best];
                }
                
                break;
        }
    }
}

- (CombatPosition) getMaxThreat {
    float maxThreat = 0.0f;
    CombatPosition maxThreatPos = -1;
    
    // scan the threat levels and find the highest
    for (CombatPosition pos = FirstCombatPosition; pos < CombatPositions; pos++) {
        if (opponentEntityThreat[pos] > maxThreat) {
            maxThreat = opponentEntityThreat[pos];
            maxThreatPos = pos;
        }
    }
    
    return maxThreatPos;
}

- (CombatPosition) getBestCounterFor:(DamageType)theType {
    CombatPosition bestCounterPos = FirstCombatPosition;
    switch (theType) {
        case DamageTypeMelee:
            bestCounterPos = [self getBestDamageOfType:DamageTypeMagic];
            if (bestCounterPos == CombatPositions) {
                bestCounterPos = [self getBestDamageOfType:DamageTypeMelee];
                if (bestCounterPos == CombatPositions) {
                    bestCounterPos = [self getBestDamageOfType:DamageTypeRanged];
                }
            }
            
            break;
        case DamageTypeRanged:
            bestCounterPos = [self getBestDamageOfType:DamageTypeMelee];
            if (bestCounterPos == CombatPositions) {
                bestCounterPos = [self getBestDamageOfType:DamageTypeRanged];
                if (bestCounterPos == CombatPositions) {
                    bestCounterPos = [self getBestDamageOfType:DamageTypeMagic];
                }
            }
            
            break;
        case DamageTypeMagic:
            bestCounterPos = [self getBestDamageOfType:DamageTypeRanged];
            if (bestCounterPos == CombatPositions) {
                bestCounterPos = [self getBestDamageOfType:DamageTypeMagic];
                if (bestCounterPos == CombatPositions) {
                    bestCounterPos = [self getBestDamageOfType:DamageTypeMelee];
                }
            }
            
            break;
            
        default:
            break;
    }
    
    return bestCounterPos;
}

- (CombatPosition) getBestDamageOfType:(DamageType)theType {
    float bestCounter = -1.0f;
    CombatPosition bestCounterPos = CombatPositions;
    
    // scan own entities and find the best counter for its damage type
    for (CombatPosition pos = FirstCombatPosition; pos < CombatPositions; pos++) {
        if (ownEntityDamageTypes[pos] == theType) {
            if ([level.battlefield getEnemyAtPosition:pos].damageStrength > bestCounter) {
                bestCounter = [level.battlefield getEnemyAtPosition:pos].damageStrength;
                bestCounterPos = pos;
            }
        }
    }
    
    return bestCounterPos;
}

- (void) assignToEntity:(Monster *)theEntity entityDices:(int)entityNum dicesForAttack:(AttackType)theAttack numOfAttackDices:(int)attackNum {
    int entityCount = 0;
    int attackCount = 0;
    for (Dice *dice in level.dicepool.dices) {
        if (entityCount < entityNum && dice.type == theEntity.entityType) {
            [dice moveToTarget:theEntity withDicepool:level.dicepool];
            entityCount++;
        } else if (attackCount < attackNum && dice.type == [theEntity getAttackValueForAttack:theAttack]) {
            [dice moveToTarget:theEntity withDicepool:level.dicepool];
            attackCount++;
        }
    }
}

- (void) assignOneDiceToEntity:(Monster *)theEntity {
    Dice *dice = [[level.dicepool.dices objectAtIndex:[Random intLessThan:[level.dicepool.dices count]]] retain];
    [dice moveToTarget:theEntity withDicepool:level.dicepool];
}

@end
