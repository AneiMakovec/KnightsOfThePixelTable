//
//  MonsterWarrior.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 23/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "MonsterWarrior.h"

#import "Pixlron.Knights.h"

@implementation MonsterWarrior

- (id) init {
    self = [super initMonster:MonsterTypeWarrior expType:ExpTypeNormal entityType:Strength health:100 damageType:DamageTypeMelee damageStrength:0.85 maxRadius:60];
    if (self != nil) {
        // init stats
        for (int i = 0; i < StatTypes; i++) {
            stats[i] = [[Stat alloc] initWithValue:[Constants lancelotValueOfStat:i] upgradeMargin:[Constants lancelotGainMarginOfStat:i]];
        }
        
        // init skills
        for (int i = 0; i < SkillTypes; i++) {
            skills[i] = [[Skill alloc] initWithDamage:[Constants lancelotDamageOfSkill:i] range:[Constants lancelotRangeOfSkill:i] duration:[Constants lancelotDurationOfSkill:i] upgradeMargin:[Constants lancelotGainMarginOfSkill:i]];
        }
        
        for (int i = 0; i < SkillTypes; i++) {
            comboSkillTypes[i] = Agility;
        }
    }
    return self;
}

@end
