//
//  EntityData.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "EntityData.h"

#import "Pixlron.Knights.h"

@implementation EntityData

- (id) initWithDamageType:(DamageType)dType hp:(int)health lvl:(Lvl)level {
    self = [super init];
    if (self != nil) {
        dmgType = dType;
        hp = health;
        lvl = level;
    }
    
    return self;
}

@synthesize lvl, dmgType, hp;

- (int) getValueOfStat:(StatType)stat {
    return stats[stat];
}

- (Skill *) getSkill:(SkillType)skill {
    return skills[skill];
}

@end
