//
//  StatEffect.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 15/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "StatEffect.h"

#import "Pixlron.Knights.h"

@implementation StatEffect

- (id) initWithDuration:(int)theDuration chance:(int)theChance chanceUpgradeMargin:(int)theChanceMargin {
    self = [super init];
    if (self != nil) {
        if (theChance > 100) {
            chance = theChance % 100;
        } else {
            chance = theChance;
        }
        
        chanceUpgradeMargin = theChanceMargin;
        
        duration = theDuration;
        active = NO;
    }
    return self;
}

@synthesize duration, active, chance, chanceUpgradeMargin;


- (void) activateWithTarget:(CombatEntity *)theTarget {
    target = [theTarget retain];
    active = YES;
}

- (void) deactivate {
    active = NO;
}


- (void) increaseDuration {
    duration++;
}

- (void) decreaseDuration {
    duration--;
}

- (void) upgrade {
    chance += chanceUpgradeMargin;
    
    if (chance > 100)
        chance = 100;
}


- (void) update {
    if (duration > 0) {
        duration--;
    } else {
        [self deactivate];
    }
}



- (void) dealloc {
    [target release];
    
    [super dealloc];
}

@end
