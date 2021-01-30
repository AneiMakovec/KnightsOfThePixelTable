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

- (id) init {
    self = [super init];
    if (self != nil) {
        dices = [[NSMutableArray alloc] initWithCapacity:[GameProgress getNumOfDices]];
        borders = [[NSMutableArray alloc] initWithCapacity:4];
        
        dicesAdded = NO;
        
        Vector2 *dicepoolPos = [Constants getPositionDataForKey:POSITION_HUD_DICEPOOL];
        MetaData *dicepoolData = [Constants getMetaDataForKey:META_HUD_DICEPOOL];
        dicepoolArea = [[Rectangle alloc] initWithX:dicepoolPos.x y:dicepoolPos.y width:dicepoolData.width height:dicepoolData.height];
    }
    return self;
}

@synthesize dices, borders, dicepoolArea, dicesAdded;


- (void) initialize {
    DicepoolLimit *border = [[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveX distance:dicepoolArea.x]];
    [borders addObject:border];
    [border release];
    
    border = [[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeX distance:-(dicepoolArea.x + dicepoolArea.width)]];
    [borders addObject:border];
    [border release];
    
    border = [[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveY distance:dicepoolArea.y]];
    [borders addObject:border];
    [border release];
    
    border = [[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeY distance:-(dicepoolArea.y + dicepoolArea.height)]];
    [borders addObject:border];
    [border release];
}

- (void) addDices {
    if ([dices count] == 0) {
        for (int i = 0; i < [GameProgress getNumOfDices]; i++) {
            Dice *dice = [[Dice alloc] initWithType:[Random intLessThan:StatTypes]];
            dice.position.x = [Random intGreaterThanOrEqual:(int)dicepoolArea.x+(int)dice.radius*2+15 lessThan:(int)dicepoolArea.x+dicepoolArea.width-(int)dice.radius*2-15];
            dice.position.y = [Random intGreaterThanOrEqual:(int)dicepoolArea.y+(int)dice.radius*2+15 lessThan:(int)dicepoolArea.y+dicepoolArea.height-(int)dice.radius*2-15];;
            dice.velocity.x = [Random intGreaterThanOrEqual:-700 lessThan:700];
            dice.velocity.y = [Random intGreaterThanOrEqual:-700 lessThan:700];
            dice.state = DiceStateRolling;
            [dices addObject:dice];
            [Level addItemToScene:dice];
            [dice release];
        }
        
        dicesAdded = YES;
    }
}

- (void) removeAllDices {
    if ([dices count] > 0) {
        for (Dice *dice in dices) {
            [Level removeItemFromScene:dice];
        }
        
        [dices removeAllObjects];
        
        dicesAdded = NO;
    }
}

- (void) addDice:(Dice *)dice {
    [dices addObject:dice];
    [Level addItemToScene:dice];
}

- (void) removeDice:(Dice *)dice {
    [dices removeObject:dice];
    [Level removeItemFromScene:dice];
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
