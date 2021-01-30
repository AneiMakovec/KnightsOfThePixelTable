//
//  StatEffectFactory.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 15/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "StatEffectFactory.h"

#import "Pixlron.Knights.h"

@implementation StatEffectFactory

+ (StatEffect*) createStatEffect:(StatEffect *)statEffect {
    if ([statEffect isKindOfClass:[Buff class]]) {
        Buff *buff = (Buff *)statEffect;
        return [[[Buff alloc] initWithStatType:buff.type buff:buff.buff duration:buff.duration chance:buff.chance chanceUpgradeMargin:buff.chanceUpgradeMargin] autorelease];
    } else if ([statEffect isKindOfClass:[Debuff class]]) {
        Debuff *debuff = (Debuff *)statEffect;
        return [[[Debuff alloc] initWithStatType:debuff.type debuff:debuff.debuff duration:debuff.duration chance:debuff.chance chanceUpgradeMargin:debuff.chanceUpgradeMargin] autorelease];
    } else if ([statEffect isKindOfClass:[Condition class]]) {
        Condition *cond = (Condition *)statEffect;
        return [[[Condition alloc] initWithConditionType:cond.type damage:cond.dmg duration:cond.duration chance:cond.chance chanceUpgradeMargin:cond.chanceUpgradeMargin] autorelease];
    } else {
        return nil;
    }
}

@end
