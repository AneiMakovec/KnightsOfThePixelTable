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
        for (int i = 0; i < SkillTypes; i++) {
            skills[i] = [[SkillFactory createSkill:i forAlly:type] retain];
        }
        
        for (int i = 0; i < SkillTypes; i++) {
            comboSkillTypes[i] = Cunning;
        }
    }
    return self;
}

@end
