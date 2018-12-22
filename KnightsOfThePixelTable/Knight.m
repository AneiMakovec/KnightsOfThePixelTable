//
//  Knight.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Knight.h"

#import "Pixlron.Knights.h"

@implementation Knight

- (id) initWithPosition:(Vector2 *)thePosition knightType:(KnightType)theType health:(int)hp damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius {
    self = [super initWithPosition:thePosition health:hp damageStrength:theDamageStrength maxRadius:theMaxRadius];
    if (self != nil) {
        maxLevel = 80;
        currentLevel = 1;
        exp = 0;
        
        type = theType;
    }
    return self;
}

@synthesize maxLevel, currentLevel, exp, type;


- (void) gainExperience:(int)theExp {
    exp += theExp;
    
    // calculate if gained enough experiance to level up
    
}

- (void) levelUp {
    if (currentLevel < maxLevel) {
        currentLevel++;
    }
}

@end
