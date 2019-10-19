//
//  KnightBowman.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "KnightBowman.h"

#import "Pixlron.Knights.h"

@implementation KnightBowman

- (id) initWithLevel:(Level*)theLevel gameHud:(GameHud *)hud {
    self = [super initKnight:KnightTypeLongbowman level:theLevel gameHud:hud entityType:Agility health:[Constants bowmanHealthPoints] damageType:[Constants bowmanDamageType] maxRadius:60];
    if (self != nil) {
        // init stats
        for (int i = 0; i < StatTypes; i++) {
            stats[i] = [[Stat alloc] initWithValue:[Constants bowmanValueOfStat:i] upgradeMargin:[Constants bowmanGainMarginOfStat:i]];
        }
        
        // init skills
        for (int i = 0; i < SkillTypes; i++) {
            skills[i] = [[SkillFactory createSkill:i forAlly:type] retain];
        }
        
        // init skill combos
        for (int i = 0; i < SkillTypes; i++) {
            comboSkillTypes[i] = Accuracy;
        }
        
//        // init textures
//        for (int i = 0; i < EntityStates; i++) {
//            animations[i] = [[TextureComponent getAnimationType:i forAlly:type] retain];
//        }
    }
    return self;
}

@end
