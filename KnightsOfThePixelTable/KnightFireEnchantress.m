//
//  KnightFireEnchantress.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "KnightFireEnchantress.h"

#import "Pixlron.Knights.h"

@implementation KnightFireEnchantress

- (id) initWithBattlefield:(Battlefield*)theBattlefield gameHud:(GameHud *)hud {
    self = [super initKnight:KnightTypeFireEnchantress battlefield:theBattlefield gameHud:hud entityType:Strength health:[Constants lancelotHealthPoints] damageType:DamageTypeMelee damageStrength:0.85 maxRadius:60];
    if (self != nil) {
        // init stats
        for (int i = 0; i < StatTypes; i++) {
            stats[i] = [[Stat alloc] initWithValue:[Constants lancelotValueOfStat:i] upgradeMargin:[Constants lancelotGainMarginOfStat:i]];
        }
        
        // init skills
        StatEffect *effect;
        for (int i = 0; i < SkillTypes; i++) {
            skills[i] = [[Skill alloc] initWithFunction:[Constants lancelotFunctionOfSkill:i] range:[Constants lancelotRangeOfSkill:i] target:[Constants lancelotTargetOfSkill:i] useOn:[Constants lancelotUseOnSkill:i] damage:[Constants lancelotDamageOfSkill:i] duration:[Constants lancelotDurationOfSkill:i] upgradeMargin:[Constants lancelotGainMarginOfSkill:i]];
            
            effect = [[Debuff alloc] initWithStatType:Strength debuff:0.5f duration:1 chance:100 chanceUpgradeMargin:5];
            [skills[i] addStatEffect:effect];
            [effect release];
        }
        
        for (int i = 0; i < SkillTypes; i++) {
            comboSkillTypes[i] = Agility;
        }
    }
    return self;
}

@end
