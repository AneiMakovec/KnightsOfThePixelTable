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

- (id) initWithFunction:(SkillFunction)theFunction range:(SkillRange)theRange target:(SkillTarget)theTarget useOn:(SkillUseOn)theUseOn damage:(float)dmg duration:(NSTimeInterval)theDuration upgradeMargin:(float)theMargin {
    self = [super init];
    if (self != nil) {
        damage = dmg;
        upgradeMargin = theMargin;
        
        function = theFunction;
        
        // set parameters for healing skill
        if (function == SkillFunctionHeal) {
            useOn = SkillUseOnAlly;
            range = SkillRangeRanged;
        } else {
            useOn = theUseOn;
            range = theRange;
        }
        
        target = theTarget;
        duration = [[ResetableLifetime alloc] initWithStart:0 duration:theDuration];
        
        statEffects = [[NSMutableArray alloc] init];
    }
    return self;
}

@synthesize damage, function, range, target, duration, statEffects, useOn;


- (void) addStatEffect:(StatEffect *)statEffect {
    [statEffects addObject:statEffect];
}

- (BOOL) hasEffect:(SkillEffect)effect {
    return additionalEffects[effect];
}

- (void) setEffect:(SkillEffect)effect {
    additionalEffects[effect] = YES;
}


- (void) upgrade {
    // TODO
}

- (void) dealloc {
    [duration release];
    [statEffects release];
    
    [super dealloc];
}

@end
