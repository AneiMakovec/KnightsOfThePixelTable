//
//  Skill.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Skill.h"

#import "Pixlron.Knights.h"

@implementation Skill

- (id) initWithFunction:(Function)theFunction range:(Range)theRange target:(Target)theTarget damage:(float)dmg damageType:(DamageType)dType {
    self = [super init];
    if (self != nil) {
        lvl = LvlZero;
        
        damage = dmg;
        function = theFunction;
        target = theTarget;
        range = theRange;
        damageType = dType;
        
        conditions = [[NSMutableArray alloc] init];
    }
    return self;
}

@synthesize damage, function, range, target, damageType, lvl, conditions;


- (void) addCondition:(ConditionData *)condition {
    [conditions addObject:condition];
}



- (void) upgrade {
    lvl++;
    // TODO: upgrade dmg + status effect chances
}

- (void) dealloc {
    [conditions release];
    
    [super dealloc];
}

@end
