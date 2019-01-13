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
        
        player = hPlayer;
        aiPlayer = theAiPlayer;
        
        turnDelay = [[ResetableLifetime alloc] initWithStart:0 duration:2];
        
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
    
    // check if player's turn is over
    if (playersTurn) {
        if (hud.endTurnReleased) {
            [hud resetEndTurnButton];
            
            // check if no entity is ready to attack
            if ([self checkEntityAttacks]) {
                
                // check if all entities are idle
                if ([self checkIdleEntities]) {
                    
                    // end player's turn
                    playersTurn = NO;
                    
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
    // check if ai's turn is over
    } else {
        if (aiPlayer.turnEnded) {

            // check if no entity is ready to attack
            if ([self checkEntityAttacks]) {
                
                // check if all entities are idle
                if ([self checkIdleEntities]) {
                    
                    [turnDelay updateWithGameTime:gameTime];
                    if (![turnDelay isAlive]) {
                        [turnDelay reset];
                        
                        // end ai's turn
                        playersTurn = YES;
                        
                        [aiPlayer endTurn];
                        [player startTurn];
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
