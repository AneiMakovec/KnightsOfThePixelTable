//
//  HumanPlayer.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "HumanPlayer.h"

#import "Pixlron.Knights.h"

@implementation HumanPlayer

- (id) initWithGame:(Game *)theGame {
    self = [super initWithGame:theGame];
    if (self != nil) {
        target = nil;
        selectedDice = nil;
        
        myTurn = NO;
    }
    return self;
}

@synthesize myTurn;


- (void) initialize {
    [self setCamera:[ScreenComponent getCamera]];
    
    // init combo release areas
    NSString *comboAreasPosKey = POSITION_HUD_COMBO_AREAS;
    MetaData *comboAreasMeta = [Constants getMetaDataForKey:META_HUD_COMBO_AREA];
    for (int i = 0; i < CombatPositions; i++) {
        Vector2 *pos = [Constants getPositionDataForKey:[comboAreasPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]];
        comboAreas[i] = [[ReleaseArea alloc] initWithInputArea:[Rectangle rectangleWithX:pos.x y:pos.y width:comboAreasMeta.width height:comboAreasMeta.height]];
        [GameHud addItemToScene:comboAreas[i]];
    }
    
    [super initialize];
}

- (void) setCamera:(Matrix *)camera {
    [inverseView release];
    inverseView = [[Matrix invert:camera] retain];
}


- (void) startTurn {
    myTurn = YES;
    [Level resetDicepool];
    [Level addDices];
}

- (void) endTurn {
    myTurn = NO;
    if (target) {
        target.isTargeted = NO;
        target = nil;
    }
    [Level removeAllDices];
    [Level resetDicepool];
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    
    // check if target is still alive
    if (target && target.state == EntityStateDead) {
        target.isTargeted = NO;
        [target release];
        target = nil;
    }
    
    // process input
    TouchCollection *touches = [TouchPanelHelper getState];
    
    if (myTurn && touches != nil && [touches count] > 0) {
        TouchLocation *touch = [touches objectAtIndex:0];
        
        Vector2 *touchInScene = [Vector2 transform:touch.position with:inverseView];
        
        // MARK: PRESSED
        if (touch.state == TouchLocationStatePressed) {
            // if no dice is selected check if can select one
            if (!selectedDice) {
                selectedDice = [Level diceAtLocation:touchInScene];
                [selectedDice rememberOrigin];
            }
        }
        
        // MARK: MOVED
        if (touch.state == TouchLocationStateMoved) {
            if (selectedDice) {
                // move selected dice to touch location
                selectedDice.position.x = touchInScene.x;
                selectedDice.position.y = touchInScene.y;
            }
        }
        
        // MARK: RELEASED
        if (touch.state == TouchLocationStateReleased) {
            
            // MARK: check if touched dicepool
            if ([Level touchedDicepool:touchInScene]) {
                // release the selected dice if still in the dicepool
                if (selectedDice) {
                    [selectedDice resetPositionToOrigin:NO];
                    selectedDice = nil;
                }
            } else {
                
                if (selectedDice) {
                    for (int i = 0; i < CombatPositions; i++) {
                        if (comboAreas[i].wasReleased) {
                            if ([Level addDice:selectedDice toPosition:i]) {
                                [Level removeDice:selectedDice];
                                selectedDice = nil;
                            }
                        }
                    }
                }
                
                // MARK: check if enemy touched
//                for (Monster *monster in level.battlefield.enemyEntities) {
//                    if ([monster.entityArea containsX:touchInScene.x y:touchInScene.y]) {
//                        if (monster == target) {
//                            // if touched the same monster remove target
//                            target.isTargeted = NO;
//                            target = nil;
//                            break;
//                        } else {
//                            //check if enemy is dead
//                            if (monster.state != EntityStateDead) {
//                                // remove previous target
//                                target.isTargeted = NO;
//
//                                // set new target
//                                monster.isTargeted = YES;
//                                target = [monster retain];
//                                NSLog(@"Target is enemy on position: %d", monster.combatPosition + 1);
//                                break;
//                            }
//                        }
//                    }
//                }
                
                // MARK: check if ally touched
//                for (Knight *knight in level.battlefield.allyEntities) {
//                    // touched combo area
//                    if ([knight.comboArea containsX:touchInScene.x y:touchInScene.y]) {
//                        // add selected dice to combo pool
//                        if (selectedDice) {
//                            if ([knight addComboItem:selectedDice]) {
//                                NSLog(@"Added dice to ally: %d", knight.combatPosition + 1);
//                                [level.dicepool removeDice:selectedDice];
//                                selectedDice = nil;
//                            } else {
//                                // could not add dice
//                                [selectedDice resetPositionToOrigin:YES];
//                                selectedDice = nil;
//                            }
//                        // if no dice selected remove a combo slot
//                        } else {
//                            Dice *dice = [knight removeComboAtTouchLocation:touchInScene];
//                            if (dice) {
//                                [dice resetPositionToOrigin:YES];
//                                [level.dicepool addDice:dice];
//                            }
//                        }
//
//                        break;
//                    // touched ally attack area
//                    } else if ([knight.entityArea containsX:touchInScene.x y:touchInScene.y]) {
//                        if (!selectedDice) {
//                            NSLog(@"Touched ally: %d", knight.combatPosition + 1);
//
//                            if (knight.state == EntityStateIdle && !knight.finishedAttacking && knight.skillType != NoSkill) {
//                                if (target.state != EntityStateDead) {
//                                    [knight attackTarget:target ally:YES];
//                                } else {
//                                    target.isTargeted = NO;
//                                    target = nil;
//                                    [knight attackTarget:nil ally:YES];
//                                }
//                            }
//
//                            break;
//                        }
//                    }
//                }
                
                // return selected dice to original position
                if (selectedDice) {
                    [selectedDice resetPositionToOrigin:YES];
                    selectedDice = nil;
                }
            }
        }
    }
}


- (void) pause {
    if (myTurn)
        myTurn = NO;
}

- (void) resume {
    if (!myTurn)
        myTurn = YES;
}



- (void) dealloc {
    [inverseView release];
    [super dealloc];
}

@end
