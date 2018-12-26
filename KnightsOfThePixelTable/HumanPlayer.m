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

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
    self = [super initWithGame:theGame];
    if (self != nil) {
        level = theLevel;
        target = nil;
        selectedDice = nil;
    }
    return self;
}



- (void) setCamera:(Matrix *)camera {
    [inverseView release];
    inverseView = [[Matrix invert:camera] retain];
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    TouchCollection *touches = [TouchPanel getState];
    
    if ([touches count] == 1) {
        TouchLocation *touch = [touches objectAtIndex:0];
        
        Vector2 *touchInScene = [Vector2 transform:touch.position with:inverseView];
        
        // MARK: PRESSED
        if (touch.state == TouchLocationStatePressed) {
            // if no dice is selected check if can select one
            if (!selectedDice && [level.dicepool.dicepoolArea containsX:touchInScene.x y:touchInScene.y]) {
                selectedDice = [level.dicepool getDiceAtTouchLocation:touchInScene];
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
            if ([level.dicepool.dicepoolArea containsX:touchInScene.x y:touchInScene.y]) {
                // play sound effect
                [SoundEngine play:SoundEffectTypeClick];

                // add dices if not already added
                if (!level.dicepool.dicesAdded) {
                    [level.dicepool addDicesOfType:DiceFrameTypeGood];
                }
                
                // release the selected dice if still in the dicepool
                if (selectedDice) {
                    [selectedDice resetPositionToOrigin:NO];
                    selectedDice = nil;
                }
            } else {
                
                // MARK: check if enemy touched
                for (Monster *monster in level.battlefield.enemyEntities) {
                    if ([monster.entityArea containsX:touchInScene.x y:touchInScene.y]) {
                        target = monster;
                        NSLog(@"Target is enemy on position: %d", monster.combatPosition);
                        break;
                    }
                }
                
                // MARK: check if ally touched
                for (Knight *knight in level.battlefield.allyEntities) {
                    // touched combo area
                    if ([knight.comboArea containsX:touchInScene.x y:touchInScene.y]) {
                        // add selected dice to combo pool
                        if (selectedDice) {
                            if ([knight addComboItem:selectedDice]) {
                                NSLog(@"Added dice to ally: %d", knight.combatPosition + 1);
                                [level.dicepool removeDice:selectedDice];
                                selectedDice = nil;
                            } else {
                                // could not add dice
                                [selectedDice resetPositionToOrigin:YES];
                                selectedDice = nil;
                            }
                        // if no dice selected remove a combo slot
                        } else {
                            Dice *dice = [knight removeComboAtTouchLocation:touchInScene];
                            if (dice) {
                                [dice resetPositionToOrigin:YES];
                                [level.dicepool addDice:dice];
                            }
                        }
                        
                        break;
                    // touched ally attack area
                    } else if ([knight.entityArea containsX:touchInScene.x y:touchInScene.y]) {
                        if (!selectedDice) {
                            NSLog(@"Touched ally: %d", knight.combatPosition + 1);
                            
                            knight.currentHealthPoints -= 10;
                            NSLog(@"Dealt 10 DMG to ally!");
                            
                            if (target) {
                                [knight attackTarget:target];
                            }
                            
                            break;
                        }
                    }
                }
                
                // return selected dice to original position
                if (selectedDice) {
                    [selectedDice resetPositionToOrigin:YES];
                    selectedDice = nil;
                }
            }
        }
    }
}



- (void) dealloc {
    [inverseView release];
    [super dealloc];
}

@end
