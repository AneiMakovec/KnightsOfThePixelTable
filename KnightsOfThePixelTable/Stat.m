//
//  Stat.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Stat.h"

@implementation Stat

- (id) initWithValue:(int)theValue upgradeMargin:(int)theMargin {
    self = [super init];
    if (self != nil) {
        defaultValue = theValue;
        statValue = theValue;
        upgradeMargin = theMargin;
    }
    return self;
}

@synthesize statValue;

- (void) increaseByPercentage:(float)amount {
    amount = amount + 1.0f;
    statValue *= amount;
}

- (void) decreaseByPercentage:(float)amount {
    amount = 1.0f - amount;
    statValue *= amount;
}

- (void) reset {
    statValue = defaultValue;
}


- (void) upgrade {
    float scale = (float)statValue / (float)defaultValue;
    defaultValue += upgradeMargin;
    statValue = defaultValue * scale;
}

@end
