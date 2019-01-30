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

- (id) initWithFunction:(SkillFunction)theFunction range:(SkillRange)theRange target:(SkillTarget)theTarget useOn:(SkillUseOn)theUseOn damage:(float)dmg upgradeMargin:(float)theMargin {
    self = [super init];
    if (self != nil) {
        damage = dmg;
        upgradeMargin = theMargin;
        
        function = theFunction;
        
        maxSkillLevel = [Constants maxSkillLevel];
        currentSkillLevel = 1;
        
        // set parameters for healing skill
        if (function == SkillFunctionHeal) {
            useOn = SkillUseOnAlly;
            range = SkillRangeRanged;
        } else {
            useOn = theUseOn;
            range = theRange;
        }
        
        target = theTarget;
        statEffects = [[NSMutableArray alloc] init];
    }
    return self;
}

@synthesize damage, function, range, target, statEffects, useOn;


- (void) addStatEffect:(StatEffect *)statEffect {
    [statEffects addObject:statEffect];
}

- (BOOL) hasEffect:(SkillEffect)effect {
    return additionalEffects[effect];
}

- (void) setEffect:(SkillEffect)effect {
    additionalEffects[effect] = YES;
}

- (BOOL) isMaxLevel {
    return currentSkillLevel == maxSkillLevel;
}


- (void) upgrade {
    if (currentSkillLevel < maxSkillLevel) {
        damage += upgradeMargin;
        
        for (StatEffect *effect in statEffects) {
            [effect upgrade];
        }
    }
}

- (void) dealloc {
    [statEffects release];
    
    [super dealloc];
}

@end
