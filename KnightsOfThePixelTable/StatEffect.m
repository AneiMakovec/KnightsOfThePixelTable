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

- (id) initWithDuration:(int)theDuration {
    self = [super init];
    if (self != nil) {
        duration = theDuration;
        active = NO;
    }
    return self;
}

@synthesize duration, active;


- (void) activateWithTarget:(CombatEntity *)theTarget {
    target = [theTarget retain];
    active = YES;
}

- (void) deactivate {
    active = NO;
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
