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

- (id) initWithHealth:(int)hp damageStrength:(float)theDamageStrength currentLevel:(int)theCurrentLevel {
    self = [super initWithHealth:hp damageStrength:theDamageStrength];
    if (self != nil) {
        maxLevel = 80;
        currentLevel = theCurrentLevel;
        exp = 0;
    }
    return self;
}

@synthesize maxLevel, currentLevel, exp;


- (void) gainExperience:(int)exp {
    
}

- (void) levelUp {
    
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    
}

@end
