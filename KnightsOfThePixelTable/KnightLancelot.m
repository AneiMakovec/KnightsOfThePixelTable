//
//  KnightLancelot.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 17/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "KnightLancelot.h"

#import "Pixlron.Knights.h"

@implementation KnightLancelot

- (id) init {
    self = [super initKnight:KnightTypeLancelot entityType:Strength health:100 damageType:DamageTypeMelee damageStrength:0.85 maxRadius:60];
    if (self != nil) {
        // init stats
        Stat *stat;
        for (int i = 0; i < StatTypes; i++) {
            stat = [[Stat alloc] initWithValue:[Constants lancelotValueOfStat:i] upgradeMargin:[Constants lancelotGainMarginOfStat:i]];
            [stats insertObject:stat atIndex:i];
            [stat release];
        }
        
        // init skills
        Skill *skill;
        for (int i = 0; i < AttackTypes; i++) {
            skill = [[Skill alloc] initWithValue:[Constants lancelotPowerOfAttack:i] duration:[Constants lancelotDurationOfAttack:i] upgradeMargin:[Constants lancelotGainMarginOfAttack:i]];
            [skills insertObject:skill atIndex:i];
            [skill release];
        }
        
        for (int i = 0; i < AttackTypes; i++) {
            comboAttackTypes[i] = Agility;
        }
    }
    return self;
}

@end
