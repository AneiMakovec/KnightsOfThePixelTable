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

- (id) initWithBattlefield:(Battlefield*)theBattlefield gameHud:(GameHud *)hud {
    self = [super initMonster:MonsterTypeWarrior battlefield:theBattlefield gameHud:hud expType:ExpTypeNormal entityType:Strength health:[Constants lancelotHealthPoints] damageType:DamageTypeMelee damageStrength:0.85 maxRadius:60];
    if (self != nil) {
        // init stats
        for (int i = 0; i < StatTypes; i++) {
            stats[i] = [[Stat alloc] initWithValue:[Constants lancelotValueOfStat:i] upgradeMargin:[Constants lancelotGainMarginOfStat:i]];
        }
        
        // init skills
        for (int i = 0; i < SkillTypes; i++) {
            skills[i] = [[Skill alloc] initWithFunction:[Constants lancelotFunctionOfSkill:i] range:[Constants lancelotRangeOfSkill:i] target:[Constants lancelotTargetOfSkill:i] damage:[Constants lancelotDamageOfSkill:i] duration:[Constants lancelotDurationOfSkill:i] upgradeMargin:[Constants lancelotGainMarginOfSkill:i]];
        }
        
        for (int i = 0; i < SkillTypes; i++) {
            comboSkillTypes[i] = Agility;
        }
    }
    return self;
}

@end
