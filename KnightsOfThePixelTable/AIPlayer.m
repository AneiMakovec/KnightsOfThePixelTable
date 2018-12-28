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
            for (Knight *knight in level.battlefield.allyEntities) {
                opponentEntityTypes[knight.damageType]++;
            }
            
            state = AIStateScanOwnMetadata;
            
        // scan own entities for metadata
        } else if (state == AIStateScanOwnMetadata) {
            for (Monster *monster in level.battlefield.enemyEntities) {
                ownEntityTypes[monster.damageType]++;
            }
            
            // also calculate opponent entity threat
            [self calculateThreat];
            
            state = AIStateScanDices;
        
        // scan dices for usable combos
        } else if (state == AIStateScanDices) {
            for (Dice *dice in level.dicepool.dices) {
                countDices[dice.type]++;
            }
            
            state = AIStateAssignDices;
            
        // assign dices to combat entities
        } else if (state == AIStateAssignDices) {
            [self assignDices];
            
            state = AIStateAttack;
            
        // attack
        } else if (state == AIStateAttack) {
            
        }
    }
}

- (void) calculateThreat {
    float meleeDamageFactor = opponentEntityTypes[DamageTypeMelee] / ownEntityTypes[DamageTypeRanged];
    float rangedDamageFactor = opponentEntityTypes[DamageTypeRanged] / ownEntityTypes[DamageTypeMagic];
    float magicDamageFactor = opponentEntityTypes[DamageTypeMagic] / ownEntityTypes[DamageTypeMelee];
    
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
    
}

@end
