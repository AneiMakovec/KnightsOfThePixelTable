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
        
        int hudOffset = level.bounds.height * 0.625;
        float leftWall = [TextureStretcher scaleX:162.0f fromWidth:256.0f toWidth:(float)level.bounds.width];
        float rightWall = [TextureStretcher scaleX:250.0f fromWidth:256.0f toWidth:(float)level.bounds.width];
        float topWall = [TextureStretcher scaleY:5.0f fromHeight:48.0f toHeight:(float)level.bounds.height - (float)hudOffset];
        float bottomWall = [TextureStretcher scaleY:42.0f fromHeight:48.0f toHeight:(float)level.bounds.height - (float)hudOffset];
        
        dicepoolArea.x = leftWall;
        dicepoolArea.y = topWall + hudOffset;
        dicepoolArea.width = rightWall - leftWall;
        dicepoolArea.height = bottomWall - topWall;
        
        DicepoolLimit *border = [[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveX distance:leftWall]];
        [borders addObject:border];
        
        border = [[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeX distance:-rightWall]];
        [borders addObject:border];
        
        border = [[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveY distance:topWall + hudOffset]];
        [borders addObject:border];
        
        border = [[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeY distance:-bottomWall - hudOffset]];
        [borders addObject:border];
    }
    return self;
}

@synthesize dices, borders, dicepoolArea, dicesAdded;

- (void) addDicesOfType:(DiceFrameType)diceType {
    if ([dices count] == 0) {
        for (int i = 0; i < level.num_of_dices; i++) {
            Dice *dice = [[Dice alloc] init];
            dice.position.x = [Random intGreaterThanOrEqual:(int)dicepoolArea.x+(int)dice.radius lessThan:(int)dicepoolArea.x+dicepoolArea.width-(int)dice.radius];
            dice.position.y = [Random intGreaterThanOrEqual:(int)dicepoolArea.y+(int)dice.radius lessThan:(int)dicepoolArea.y+dicepoolArea.height-(int)dice.radius];;
            dice.velocity.x = [Random intGreaterThanOrEqual:-700 lessThan:700];
            dice.velocity.y = [Random intGreaterThanOrEqual:-700 lessThan:700];
            dice.state = DiceStateMoving;
            dice.type = [Random intLessThan:StatTypes];
            dice.frameType = diceType;
            [dices addObject:dice];
            [level.scene addItem:dice];
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



- (void) dealloc {
    for (Dice *dice in dices) {
        [dice release];
    }
    
    for (DicepoolLimit *border in borders) {
        [border release];
    }
    
    [dicepoolArea release];
    
    [super dealloc];
}

@end
