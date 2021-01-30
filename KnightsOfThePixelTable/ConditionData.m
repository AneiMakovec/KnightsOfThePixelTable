//
//  ConditionData.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 27/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "ConditionData.h"

#import "Pixlron.Knights.h"

@implementation ConditionData

- (id) initWithType:(ConditionType)cType target:(Target)tTarget chance:(float)cChance duration:(int)dDuration {
    self = [super init];
    if (self != nil) {
        type = cType;
//        statType = sType;
        target = tTarget;
        chance = cChance;
        duration = dDuration;
    }
    
    return self;
}

@synthesize type, target, chance, duration;

- (void) upgrade {
    chance += 0.02f;
}

@end
