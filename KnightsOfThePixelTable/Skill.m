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

- (id) initWithName:(NSString *)theName function:(Function)theFunction range:(Range)theRange target:(Target)theTarget damage:(float)dmg damageType:(DamageType)dType projectileType:(ProjectileType)projectile skillEffect:(SkillEffect)sEffect {
    self = [super init];
    if (self != nil) {
        name = [theName retain];
        lvl = LvlZero;
        
        damage = dmg;
        function = theFunction;
        target = theTarget;
        range = theRange;
        damageType = dType;
        
        projectileType = projectile;
        skillEffect = sEffect;
        
        conditions = [[NSMutableArray alloc] init];
    }
    return self;
}

@synthesize damage, function, range, target, damageType, lvl, name, projectileType, skillEffect, conditions;


- (void) addCondition:(ConditionData *)condition {
    [conditions addObject:condition];
}



- (void) upgrade {
    lvl++;
    
    damage += 0.02f;
    
    for (ConditionData *condData in conditions) {
        [condData upgrade];
    }
}

- (void) dealloc {
    [conditions release];
    
    [super dealloc];
}

@end
