//
//  AIPlayer.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "AIPlayer.h"
#import "Pixlron.Knights.h"

@implementation AIPlayer

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
    self = [super initWithGame:theGame];
    if (self != nil) {
        level = theLevel;
        
        myTurn = NO;
    }
    return self;
}

@synthesize myTurn;

- (void) startTurn {
    [level.dicepool resetDicepool];
    
    [level.dicepool addDicesOfType:DiceFrameTypeEvil];
    
    myTurn = YES;
}

- (void) endTurn {
    myTurn = NO;
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    // scan dices for usable combos
    // scan ally entities for weakneses
    // assign dices to combat entities
    // attack
}

@end
