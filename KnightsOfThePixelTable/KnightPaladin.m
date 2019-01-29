//
//  KnightPaladin.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "KnightPaladin.h"

#import "Pixlron.Knights.h"

@implementation KnightPaladin

- (id) initWithLevel:(Level*)theLevel gameHud:(GameHud *)hud {
    self = [super initKnight:KnightTypePaladin level:theLevel gameHud:hud entityType:Strength health:[Constants paladinHealthPoints] damageType:[Constants paladinDamageType] damageStrength:0.85 maxRadius:60];
    if (self != nil) {
        // init stats
        for (int i = 0; i < StatTypes; i++) {
            stats[i] = [[Stat alloc] initWithValue:[Constants paladinValueOfStat:i] upgradeMargin:[Constants paladinGainMarginOfStat:i]];
        }
        
        // init skills
        StatEffect *effect;
        for (int i = 0; i < SkillTypes; i++) {
            skills[i] = [[SkillFactory createSkill:i forAlly:type] retain];
            
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
