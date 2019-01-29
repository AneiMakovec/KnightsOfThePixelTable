//
//  KnightBrawler.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 17/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "KnightBrawler.h"

#import "Pixlron.Knights.h"

@implementation KnightBrawler

- (id) initWithLevel:(Level*)theLevel gameHud:(GameHud *)hud {
    self = [super initKnight:KnightTypeBrawler level:theLevel gameHud:hud entityType:Strength health:[Constants brawlerHealthPoints] damageType:[Constants brawlerDamageType] damageStrength:0.85 maxRadius:60];
    if (self != nil) {
        // init stats
        for (int i = 0; i < StatTypes; i++) {
            stats[i] = [[Stat alloc] initWithValue:[Constants brawlerValueOfStat:i] upgradeMargin:[Constants brawlerGainMarginOfStat:i]];
        }
        
        // init skills
        StatEffect *effect;
        for (int i = 0; i < SkillTypes; i++) {
            skills[i] = [[SkillFactory createSkill:i forAlly:type] retain];
            
//            effect = [[Debuff alloc] initWithStatType:Strength debuff:0.5f duration:1 chance:100 chanceUpgradeMargin:5];
//            effect = [[Buff alloc] initWithStatType:Strength buff:0.5f duration:1 chance:100 chanceUpgradeMargin:5];
//            effect = [[Condition alloc] initWithConditionType:ConditionTypeFrostbite damage:0.1f duration:1 chance:100 chanceUpgradeMargin:5];
//            effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.1f duration:1 chance:100 chanceUpgradeMargin:5];
//            effect = [[Condition alloc] initWithConditionType:ConditionTypeBurn damage:0.1f duration:1 chance:100 chanceUpgradeMargin:5];
//            effect = [[Condition alloc] initWithConditionType:ConditionTypePoison damage:0.1f duration:1 chance:100 chanceUpgradeMargin:5];
            effect = [[Condition alloc] initWithConditionType:ConditionTypeStun damage:0 duration:1 chance:100 chanceUpgradeMargin:5];
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
