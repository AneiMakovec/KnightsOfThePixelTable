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

- (id) initWithLevel:(Level*)theLevel gameHud:(GameHud *)hud {
    self = [super initKnight:KnightTypeFireEnchantress level:theLevel gameHud:hud entityType:Insight health:[Constants fireEnchantressHealthPoints] damageType:[Constants fireEnchantressDamageType] maxRadius:60];
    if (self != nil) {
        // init stats
        for (int i = 0; i < StatTypes; i++) {
            stats[i] = [[Stat alloc] initWithValue:[Constants fireEnchantressValueOfStat:i] upgradeMargin:[Constants fireEnchantressGainMarginOfStat:i]];
        }
        
        // init skills
        for (int i = 0; i < SkillTypes; i++) {
            skills[i] = [[SkillFactory createSkill:i forAlly:type] retain];
        }
        
        // init skill types
        for (int i = 0; i < SkillTypes; i++) {
            comboSkillTypes[i] = Defence;
        }
        
//        // init textures
//        for (int i = 0; i < EntityStates; i++) {
//            animations[i] = [[TextureComponent getAnimationType:i forAlly:type] retain];
//        }
    }
    return self;
}

@end
