//
//  Condition.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 16/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "Condition.h"

#import "Pixlron.Knights.h"

@implementation Condition

- (id) initWithConditionType:(ConditionType)theType damage:(int)damage duration:(int)duration {
    self = [super initWithDuration:duration];
    if (self != nil) {
        type = theType;
        
        if (type == ConditionTypeStun)
            dmg = 0;
        else
            dmg = damage;
    }
    return self;
}

@synthesize dmg, type;


- (void) deactivate {
    if (type == ConditionTypeStun) {
        // remove stun from target
        [target recoverFromStun];
    }
    
    // call super method
    [super deactivate];
}


- (void) update {
    // stun the target
    if (type == ConditionTypeStun && ![target isStunned]) {
        [target stun];
    }
    
    // deal damage to target
    [target takeDamage:dmg];
    
    // call super method
    [super update];
}

@end
