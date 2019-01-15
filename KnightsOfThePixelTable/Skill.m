//
//  AttackValue.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Skill.h"

#import "Pixlron.Knights.h"

@implementation Skill

- (id) initWithValue:(int)theValue range:(SkillRange)theRange duration:(NSTimeInterval)theDuration upgradeMargin:(int)theMargin {
    self = [super init];
    if (self != nil) {
        upgradeMargin = theMargin;
        
        range = theRange;
        duration = [[ResetableLifetime alloc] initWithStart:0 duration:theDuration];
        
        statEffects = [[NSMutableArray alloc] init];
        conditions = [[NSMutableArray alloc] init];
    }
    return self;
}

@synthesize range, duration, conditions, statEffects;


- (void) addStatEffect:(StatEffect *)statEffect {
    [statEffects addObject:statEffect];
}

- (void) addCondition:(Condition *)condition {
    [conditions addObject:condition];
}


- (void) upgrade {
    // TODO
}

@end
