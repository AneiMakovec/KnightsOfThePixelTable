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
    }
    return self;
}

- (void) initialize {
    ally = [[Rectangle alloc] initWithX:200 y:200 width:500 height:500];
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
        
        if (touch.state == TouchLocationStateReleased) {
            if ([level.dicePool containsX:touchInScene.x y:touchInScene.y]) {
                [SoundEngine play:SoundEffectTypeClick];
                
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
            } else if ([ally containsX:touchInScene.x y:touchInScene.y]) {
                //[[level.battlefield getAllyAtPosition:FirstCombatPosition] attackTarget:[level.battlefield getEnemyAtPosition:FirstCombatPosition]];
                
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
                
                /*
                ally.velocity.x = (enemy.position.x - ally.position.x) / 2;
                ally.velocity.y = (enemy.position.y - ally.position.y) / 2;
                
                ally.state = EntityStateApproaching;
                 */
                
                allyKnight.attackType = BasicAttack;
                [allyKnight attackTarget:enemy];
            } else {
                for (id item in level.scene) {
                    Dice *dice = [item isKindOfClass:[Dice class]] ? (Dice*)item : nil;
                    if (dice && dice.frameType == DiceFrameTypeGood) {
                        [level.scene removeItem:item];
                    }
                }
            }
        }
    }
}

- (BOOL) checkIfCanAttack {
    for (id item in level.scene) {
        Knight *entity = [item isKindOfClass:[Knight class]] ? (Knight *)item : nil;
        if (entity) {
            if (entity.type == KnightTypeLancelot) {
                if (entity.state == EntityStateJustAttacked) {
                    entity.state = EntityStateIdle;
                    return YES;
                }
            }
        }
    }
    
    return false;
}

@end
