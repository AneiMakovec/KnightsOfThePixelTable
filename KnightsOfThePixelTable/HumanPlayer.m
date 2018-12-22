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
        
        if (touch.state == TouchLocationStatePressed) {
            if (!selectedDice && [level.dicepool.dicepoolArea containsX:touchInScene.x y:touchInScene.y]) {
                selectedDice = [level.dicepool getDiceAtTouchLocation:touchInScene];
                [selectedDice rememberOrigin];
            }
        }
        
        if (touch.state == TouchLocationStateMoved) {
            if (selectedDice) {
                selectedDice.position.x = touchInScene.x;
                selectedDice.position.y = touchInScene.y;
                
                Rectangle *comboArea;
                for (int i = 0; i < CombatPositions; i++) {
                    comboArea = [level.battlefield getComboAreaOfAlly:i];
                    if ([comboArea containsX:touchInScene.x y:touchInScene.y]) {
                        if ([level.battlefield addCombo:selectedDice toAlly:i]) {
                            NSLog(@"Added dice to ally: %d", i + 1);
                            [level.dicepool removeDice:selectedDice];
                            selectedDice = nil;
                        }
                    }
                }
            }
        }
        
        if (touch.state == TouchLocationStateReleased) {
            if ([level.dicepool.dicepoolArea containsX:touchInScene.x y:touchInScene.y]) {
                [SoundEngine play:SoundEffectTypeClick];
                
                /*
                for (int i = 0; i < level.num_of_dices; i++) {
                    Dice *dice = [[[Dice alloc] init] autorelease];
                    dice.position.x = [Random intGreaterThanOrEqual:(int)level.dicePool.x+(int)dice.radius lessThan:(int)level.dicePool.x+level.dicePool.width-(int)dice.radius];
                    dice.position.y = [Random intGreaterThanOrEqual:(int)level.dicePool.y+(int)dice.radius lessThan:(int)level.dicePool.y+level.dicePool.height-(int)dice.radius];;
                    dice.velocity.x = [Random intGreaterThanOrEqual:-700 lessThan:700];
                    dice.velocity.y = [Random intGreaterThanOrEqual:-700 lessThan:700];
                    dice.state = DiceStateMoving;
                    dice.type = [Random intLessThan:StatTypes];
                    dice.frameType = DiceFrameTypeGood;
                    [level.scene addItem:dice];
                }
                 */
                
                if (!level.dicepool.dicesAdded) {
                    [level.dicepool addDicesOfType:DiceFrameTypeGood];
                } else if (selectedDice) {
                    [selectedDice resetPositionToOrigin:NO];
                    selectedDice = nil;
                }
                
            //} else if ([ally containsX:touchInScene.x y:touchInScene.y]) {
                //[[level.battlefield getAllyAtPosition:FirstCombatPosition] attackTarget:[level.battlefield getEnemyAtPosition:FirstCombatPosition]];
                
                /*
                Knight *enemy;
                Knight *allyKnight;
                for (id item in level.scene) {
                    Knight *entity = [item isKindOfClass:[Knight class]] ? (Knight *)item : nil;
                    if (entity) {
                        if (entity.type == KnightTypeLancelot) {
                            allyKnight = entity;
                        } else if (entity.type == KnightTypeEnemy) {
                            enemy = entity;
                        }
                    }
                }
                
                
                ally.velocity.x = (enemy.position.x - ally.position.x) / 2;
                ally.velocity.y = (enemy.position.y - ally.position.y) / 2;
                
                ally.state = EntityStateApproaching;
                 
                
                allyKnight.attackType = BasicAttack;
                [allyKnight attackTarget:enemy];
                */
            } else {
//                if (level.dicepool.dicesAdded) {
//                    [level.dicepool removeAllDices];
//                }
                
                if (selectedDice) {
                    [selectedDice resetPositionToOrigin:YES];
                    selectedDice = nil;
                }
            }
            
            
            Rectangle *area;
            for (int i = 0; i < CombatPositions; i++) {
                // check if enemy touched
                area = [level.battlefield getAreaOfEnemy:i];
                if ([area containsX:touchInScene.x y:touchInScene.y]) {
                    target = [level.battlefield getEnemyAtPosition:i];
                    NSLog(@"Target is enemy on position: %d", i + 1);
                    break;
                }
                
                // check if ally touched
                area = [level.battlefield getAreaOfAlly:i];
                if ([area containsX:touchInScene.x y:touchInScene.y]) {
                    NSLog(@"Touched ally: %d", i + 1);
                    
                    if (target) {
                        Knight *selected = [level.battlefield getAllyAtPosition:i];
                        selected.attackType = BasicAttack;
                        [selected attackTarget:target];
                    }
                    
                    // also check if combo area of that ally touched
                    area = [level.battlefield getComboAreaOfAlly:i];
                    if ([area containsX:touchInScene.x y:touchInScene.y]) {
                        NSLog(@"Touched combo field as well!");
                        Dice *dice = [level.battlefield removeComboAtTouchLocation:touchInScene fromAlly:i];
                        if (dice) {
                            [dice resetPositionToOrigin:YES];
                            [level.dicepool addDice:dice];
                        }
                    }
                    break;
                }
            }
        }
    }
}

//- (BOOL) checkIfCanAttack {
//    for (id item in level.scene) {
//        Knight *entity = [item isKindOfClass:[Knight class]] ? (Knight *)item : nil;
//        if (entity) {
//            if (entity.type == KnightTypeLancelot) {
//                if (entity.state == EntityStateJustAttacked) {
//                    entity.state = EntityStateIdle;
//                    return YES;
//                }
//            }
//        }
//    }
//
//    return false;
//}

@end
