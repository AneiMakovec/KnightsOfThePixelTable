//
//  AttackValue.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "AttackValue.h"

@implementation AttackValue

- (id) initWithValue:(int)theValue statUsed:(StatType)theStat gainRate:(StatGainRate)theGainRate upgradeMargin:(int)theMargin {
    self = [super initWithValue:theValue gainRate:theGainRate upgradeMargin:theMargin];
    if (self != nil) {
        statUsed = theStat;
    }
    return self;
}

@synthesize statUsed;

@end
