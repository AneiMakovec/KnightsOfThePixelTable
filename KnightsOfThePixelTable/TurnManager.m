//
//  TurnManager.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 26/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "TurnManager.h"
#import "Pixlron.Knights.h"

TurnManager *turnManagerInastance;

@implementation TurnManager

+ (void) initializeWithGame:(Game *)game humanPlayer:(HumanPlayer *)player aiPlayer:(AIPlayer *)aiPlayer {
    turnManagerInastance = [[TurnManager alloc] initWithGame:game humanPlayer:player aiPlayer:aiPlayer];
    turnManagerInastance.updateOrder = 3;
}

+ (void) activate {
    [turnManagerInastance.game.components addComponent:turnManagerInastance];
}

+ (void) deactivate {
    [turnManagerInastance.game.components removeComponent:turnManagerInastance];
}






- (id) initWithGame:(Game *)theGame humanPlayer:(HumanPlayer *)hPlayer aiPlayer:(AIPlayer *)theAiPlayer {
    self = [super initWithGame:theGame];
    if (self != nil) {
        player = hPlayer;
        aiPlayer = theAiPlayer;
        
        turnDelay = [[ResetableLifetime alloc] initWithStart:0 duration:2];
        
        paused = NO;
        
        playersTurn = YES;
    }
    return self;
}

@synthesize playersTurn;


- (void) initialize {
    [player startTurn];
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    
    // check if game was paused
    if (!paused && hud.paused) {
        if (playersTurn)
            [player pause];
        else
            [aiPlayer pause];
        
        paused = YES;
    }
    
    if (paused && !hud.paused) {
        if (playersTurn)
            [player resume];
        else
            [aiPlayer resume];
        
        paused = NO;
    }
    
    
    // check if player's turn is over
    if (!paused) {
        if (playersTurn) {
            if (hud.endTurnReleased) {
                [hud resetEndTurnButton];
                
                // check if no entity is ready to attack
                //if ([self checkEntityAttacks]) {
                    
                    // check if all entities are idle
                    if ([self checkIdleEntities]) {
                        
                        // end player's turn
                        playersTurn = NO;
                        
                        [player endTurn];
                        
                        // check if enemies are dead
                        if ([level.battlefield.enemyEntities count] == 0) {
                            [hud increaseWaveCounter];
                            
                            if (!hud.paused)
                                [aiPlayer startTurnWithNewEntities:YES];
                        } else {
                            // update enemies status effects
                            for (Monster *monster in level.battlefield.enemyEntities) {
                                [monster updateStatEffects];
                                [monster resetAttack];
                            }
                            
                            [aiPlayer startTurn];
                        }
                    }
                //}
            } else if ([hud isLastWave] && [level.battlefield.enemyEntities count] == 0) {
                [hud increaseWaveCounter];
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
                            
                            //check if allies are dead
                            if ([level.battlefield.allyEntities count] == 0) {
                                // mission failed
                                [hud endGameplayWithWin:NO];
                            } else {
                                // update player's status effects and reset attack
                                for (Knight *knight in level.battlefield.allyEntities) {
                                    [knight updateStatEffects];
                                    [knight resetAttack];
                                }
                            
                                [player startTurn];
                            }
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
            if (knight.skillType != NoSkill) {
                return NO;
            }
        }
    } else {
        for (Monster *monster in level.battlefield.enemyEntities) {
            if (monster.skillType != NoSkill) {
                return NO;
            }
        }
    }
    
    return YES;
}

- (BOOL) checkIdleEntities {
    if (playersTurn) {
        for (Knight *knight in level.battlefield.allyEntities) {
            if (knight.state != EntityStateIdle) {
                return NO;
            }
        }
    } else {
        for (Monster *monster in level.battlefield.enemyEntities) {
            if (monster.state != EntityStateIdle) {
                return NO;
            }
        }
    }
    
    return YES;
}

@end
