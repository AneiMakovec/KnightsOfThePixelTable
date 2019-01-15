//
//  StatValue.m
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
        value = theValue;
        upgradeMargin = theMargin;
    }
    return self;
}

@synthesize value;

- (void) increaseByPercentage:(float)amount {
    amount = amount + 1.0f;
    value *= amount;
}

- (void) decreaseByPercentage:(float)amount {
    value *= amount;
}


- (void) upgrade {
    value += upgradeMargin;
}

@end
