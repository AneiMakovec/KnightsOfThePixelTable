//
//  Stat.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Stat.h"

@implementation Stat

- (id) initWithValue:(int)theValue upgradeMargin:(StatUpgrade)theMargin {
    self = [super init];
    if (self != nil) {
        maxValue = 255;
        defaultValue = theValue;
        statValue = theValue;
        upgradeMargin = theMargin;
        
        changeStack = [[NSMutableArray alloc] init];
    }
    return self;
}

@synthesize statValue;

- (void) increaseByPercentage:(float)amount {
    // save current value
    [self pushValue];
    amount = amount + 1.0f;
    statValue *= amount;
}

- (void) decreaseByPercentage:(float)amount {
    // save curent value
    [self pushValue];
    amount = 1.0f - amount;
    statValue *= amount;
}

- (void) pushValue {
    NSNumber *valueToStore = [[NSNumber alloc] initWithInt:statValue];
    [changeStack addObject:valueToStore];
    [valueToStore release];
}

- (void) popValue {
    NSNumber *storedValue = [changeStack lastObject];
    statValue = [storedValue intValue];
    [changeStack removeLastObject];
}

- (void) reset {
    // reset to previous value
    [self popValue];
}

- (void) resetAll {
    // reset to base value
    statValue = defaultValue;
    [changeStack removeAllObjects];
}


- (void) upgrade {
    [self resetAll];
    
    defaultValue += upgradeMargin + 1;
    statValue += upgradeMargin + 1;
}

@end
