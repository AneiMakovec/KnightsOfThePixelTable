//
//  Debuff.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 16/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "Debuff.h"

#import "Pixlron.Knights.h"

@implementation Debuff

- (id) initWithStatType:(StatType)theType debuff:(float)theDebuff duration:(int)duration {
    self = [super initWithDuration:duration];
    if (self != nil) {
        type = theType;
        debuff = theDebuff;
    }
    return self;
}

@synthesize debuff, type;


- (void) activateWithTarget:(CombatEntity *)theTarget {
    // call super method
    [super activateWithTarget:theTarget];
    
    // increase target stat
    [target debuffStat:type amount:debuff];
}

- (void) deactivate {
    // reset target stat
    [target resetStat:type];
    
    // call super method
    [super deactivate];
}

@end
