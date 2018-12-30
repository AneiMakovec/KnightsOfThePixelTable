//
//  Dicepool.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Dicepool.h"

#import "Pixlron.Knights.h"

@implementation Dicepool

- (id) initWithLevel:(Level *)theLevel {
    self = [super init];
    if (self != nil) {
        level = theLevel;
        dices = [[NSMutableArray alloc] initWithCapacity:level.num_of_dices];
        borders = [[NSMutableArray alloc] initWithCapacity:4];
        dicepoolArea = [[Rectangle alloc] init];
        
        dicesAdded = NO;
        
//        dicepoolArea.x = [[ScreenComponent getScale:@"hud"] scaleX:162.0f];
//        dicepoolArea.width = [[ScreenComponent getScale:@"hud"] scaleX:250.0f];
//        dicepoolArea.y = [[ScreenComponent getScale:@"hud"] scaleY:5.0f];
//        dicepoolArea.height = [[ScreenComponent getScale:@"hud"] scaleY:42.0f];
        
        dicepoolArea.x = [Constants dicepoolLeftWall];
        dicepoolArea.width = [Constants dicepoolRightWall];
        dicepoolArea.y = [Constants dicepoolUpWall];
        dicepoolArea.height = [Constants dicepoolDownWall];
        
        DicepoolLimit *border = [[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveX distance:dicepoolArea.x]];
        [borders addObject:border];
        
        border = [[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeX distance:-dicepoolArea.width]];
        [borders addObject:border];
        
        border = [[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveY distance:dicepoolArea.y]];
        [borders addObject:border];
        
        border = [[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeY distance:-dicepoolArea.height]];
        [borders addObject:border];
        
        [border release];
    }
    return self;
}

@synthesize dices, borders, dicepoolArea, dicesAdded;

- (void) addDicesOfType:(DiceFrameType)diceType {
    if ([dices count] == 0) {
        for (int i = 0; i < level.num_of_dices; i++) {
            Dice *dice = [[Dice alloc] init];
            dice.position.x = [Random intGreaterThanOrEqual:(int)dicepoolArea.x+(int)dice.radius*2+15 lessThan:(int)dicepoolArea.x+dicepoolArea.width-(int)dice.radius*2-15];
            dice.position.y = [Random intGreaterThanOrEqual:(int)dicepoolArea.y+(int)dice.radius*2+15 lessThan:(int)dicepoolArea.y+dicepoolArea.height-(int)dice.radius*2-15];;
            dice.velocity.x = [Random intGreaterThanOrEqual:-700 lessThan:700];
            dice.velocity.y = [Random intGreaterThanOrEqual:-700 lessThan:700];
            dice.state = DiceStateRolling;
            dice.type = [Random intLessThan:StatTypes];
            dice.frameType = diceType;
            [dices addObject:dice];
            [level.scene addItem:dice];
            [dice release];
        }
        
        dicesAdded = YES;
    }
}

- (void) removeAllDices {
    if ([dices count] > 0) {
        for (Dice *dice in dices) {
            [level.scene removeItem:dice];
        }
        
        [dices removeAllObjects];
        
        dicesAdded = NO;
    }
}

- (void) addDice:(Dice *)dice {
    [dices addObject:dice];
    [level.scene addItem:dice];
}

- (void) removeDice:(Dice *)dice {
    [dices removeObject:dice];
    [level.scene removeItem:dice];
}

- (Dice *) getDiceAtTouchLocation:(Vector2 *)touchLocation {
    for (Dice *dice in dices) {
        float distance = [[Vector2 subtract:dice.position by:touchLocation] length];
        if (distance < dice.radius) {
            return dice;
        }
    }
    
    return nil;
}

- (void) resetDicepool {
    dicesAdded = NO;
}



- (void) dealloc {
    [dices release];
    [borders release];
    [dicepoolArea release];
    
    [super dealloc];
}

@end
