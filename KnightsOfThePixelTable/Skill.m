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

- (id) initWithFunction:(SkillFunction)theFunction range:(SkillRange)theRange target:(SkillTarget)theTarget damage:(float)dmg duration:(NSTimeInterval)theDuration upgradeMargin:(float)theMargin {
    self = [super init];
    if (self != nil) {
        damage = dmg;
        upgradeMargin = theMargin;
        
        function = theFunction;
        range = theRange;
        target = theTarget;
        duration = [[ResetableLifetime alloc] initWithStart:0 duration:theDuration];
        
        statEffects = [[NSMutableArray alloc] init];
    }
    return self;
}

@synthesize damage, function, range, target, duration, statEffects;


- (void) addStatEffect:(StatEffect *)statEffect {
    [statEffects addObject:statEffect];
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
