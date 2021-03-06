//
//  Buff.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 16/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "Buff.h"

#import "Pixlron.Knights.h"

@implementation Buff

- (id) initWithStatType:(StatType)theType buff:(float)theBuff duration:(int)duration chance:(int)chance chanceUpgradeMargin:(int)theChanceMargin {
    self = [super initWithDuration:duration chance:chance chanceUpgradeMargin:theChanceMargin];
    if (self != nil) {
        type = theType;
        buff = theBuff;
    }
    return self;
}

@synthesize buff, type;


- (void) activateWithTarget:(CombatEntity *)theTarget {
    // call super method
    [super activateWithTarget:theTarget];
    
    // increase target stat
    [target buffStat:type amount:buff];
}

- (void) deactivate {
    // reset target stat
    [target resetStat:type];
    
    // call super method
    [super deactivate];
}

@end
