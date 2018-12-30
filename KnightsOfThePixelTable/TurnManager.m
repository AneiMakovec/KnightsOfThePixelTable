//
//  TurnManager.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 26/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "TurnManager.h"
#import "Pixlron.Knights.h"

@implementation TurnManager

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel gameHud:(GameHud *)theHud humanPlayer:(HumanPlayer *)hPlayer aiPlayer:(AIPlayer *)theAiPlayer {
    self = [super initWithGame:theGame];
    if (self != nil) {
        level = theLevel;
        hud = theHud;
        turnDelay = [[ResetableLifetime alloc] initWithStart:0 duration:1];
        
        player = hPlayer;
        aiPlayer = theAiPlayer;
        
        playersTurn = YES;
        waveCounter = 1;
    }
    return self;
}

@synthesize playersTurn;


- (void) initialize {
    [player startTurn];
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    
    // check if turn is over
    
    // check if all dices used
    if ([self checkDices]) {
//        NSLog(@"No dices!");
        
        // check if no entity is ready to attack
        if ([self checkEntityAttacks]) {
//            NSLog(@"No attacks!");
            
            // check if all entities are idle
            if ([self checkIdleEntities]) {
//                NSLog(@"All idle!");
                
                [turnDelay updateWithGameTime:gameTime];
                
                if (!turnDelay.isAlive) {
                    [turnDelay reset];
                    
                    // end turn
                    playersTurn = !playersTurn;
                    NSLog(@"Next turn!");
                    
                    if (playersTurn) {
                        [aiPlayer endTurn];
                        [player startTurn];
                    } else {
                        [player endTurn];
                        
                        if ([level.battlefield.enemyEntities count] == 0) {
                            waveCounter++;
                            [hud increaseWaveCounterTo:waveCounter];
                            [aiPlayer startTurnWithNewEntities:YES];
                        } else {
                            [aiPlayer startTurn];
                        }
                    }
                }
            }
        }
    }
    
}


- (BOOL) checkDices {
    return [level.dicepool.dices count] == 0;
}

- (BOOL) checkEntityAttacks {
    if (playersTurn) {
        for (Knight *knight in level.battlefield.allyEntities) {
            if (knight.attackType != NoAttack) {
                return false;
            }
        }
    } else {
        for (Monster *monster in level.battlefield.enemyEntities) {
            if (monster.attackType != NoAttack) {
                return false;
            }
        }
    }
    
    return true;
}

- (BOOL) checkIdleEntities {
    if (playersTurn) {
        for (Knight *knight in level.battlefield.allyEntities) {
            if (knight.state != EntityStateIdle) {
                return false;
            }
        }
    } else {
        for (Monster *monster in level.battlefield.enemyEntities) {
            if (monster.state != EntityStateIdle) {
                return false;
            }
        }
    }
    
    return true;
}

@end
