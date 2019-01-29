//
//  MonsterBossViking.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "MonsterBossViking.h"

#import "Pixlron.Knights.h"

@implementation MonsterBossViking

- (id) initWithLevel:(Level*)theLevel gameHud:(GameHud *)hud {
    self = [super initMonster:MonsterTypeBossViking level:theLevel gameHud:hud expType:ExpTypeNormal entityType:Strength health:[Constants brawlerHealthPoints] damageType:[Constants brawlerDamageType] damageStrength:0.85 maxRadius:60];
    if (self != nil) {
        // init stats
        for (int i = 0; i < StatTypes; i++) {
            stats[i] = [[Stat alloc] initWithValue:[Constants brawlerValueOfStat:i] upgradeMargin:[Constants brawlerGainMarginOfStat:i]];
        }
        
        // init skills
        for (int i = 0; i < SkillTypes; i++) {
            skills[i] = [[SkillFactory createSkill:i forAlly:KnightTypeBrawler] retain];
        }
        
        for (int i = 0; i < SkillTypes; i++) {
            comboSkillTypes[i] = Agility;
        }
    }
    return self;
}

@end
