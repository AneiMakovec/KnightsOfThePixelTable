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

- (id) initWithConditionType:(ConditionType)theType damage:(float)damage duration:(int)duration chance:(int)chance {
    self = [super initWithDuration:duration chance:chance];
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


- (void) activateWithTarget:(CombatEntity *)theTarget {
    // call super method
    [super activateWithTarget:theTarget];
    
    // stun the target
    if (type == ConditionTypeStun && ![target isStunned]) {
        [target stun];
        
        // TODO - add stun animation
    }
}

- (void) deactivate {
    if (type == ConditionTypeStun) {
        if ([target isOnlyStunnEffect:self]) {
            // remove stun from target
            [target recoverFromStun];
        }
    }
    
    // call super method
    [super deactivate];
}


- (void) update {
    if (active) {
        // stun the target
        if (type == ConditionTypeStun && ![target isStunned]) {
            [target stun];
        }
        
        // deal damage to target
        if (type != ConditionTypeStun) {
            [target takePercentDamage:dmg];
            
            // TODO add damage indicators and animations
        }
    }
    
    // call super method
    [super update];
}

@end
