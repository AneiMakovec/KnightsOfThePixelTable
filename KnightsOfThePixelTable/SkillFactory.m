//
//  SkillFactory.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "SkillFactory.h"

#import "Pixlron.Knights.h"

@implementation SkillFactory

+ (Skill *) createSkill:(SkillType)type forAlly:(KnightType)ally {
    switch (ally) {
        // BRAWLER
        case KnightTypeBrawler:
            switch (type) {
                case BasicAttack:
                    // DOUBLE SLASH
                    return [[[Skill alloc] initWithFunction:[Constants brawlerFunctionOfSkill:BasicAttack] range:[Constants brawlerRangeOfSkill:BasicAttack] target:[Constants brawlerTargetOfSkill:BasicAttack] useOn:[Constants brawlerUseOnSkill:BasicAttack] damage:[Constants brawlerDamageOfSkill:BasicAttack] duration:[Constants brawlerDurationOfSkill:BasicAttack] upgradeMargin:[Constants brawlerGainMarginOfSkill:BasicAttack]] autorelease];
                    break;
                    
                case FirstComboSkill:
                    // BLADE EDGE
                    return [[[Skill alloc] initWithFunction:[Constants brawlerFunctionOfSkill:FirstComboSkill] range:[Constants brawlerRangeOfSkill:FirstComboSkill] target:[Constants brawlerTargetOfSkill:FirstComboSkill] useOn:[Constants brawlerUseOnSkill:FirstComboSkill] damage:[Constants brawlerDamageOfSkill:FirstComboSkill] duration:[Constants brawlerDurationOfSkill:FirstComboSkill] upgradeMargin:[Constants brawlerGainMarginOfSkill:FirstComboSkill]] autorelease];
                    break;
                
                case SecondComboSkill:
                    // BLADE TWIST
                    return [[[Skill alloc] initWithFunction:[Constants brawlerFunctionOfSkill:SecondComboSkill] range:[Constants brawlerRangeOfSkill:SecondComboSkill] target:[Constants brawlerTargetOfSkill:SecondComboSkill] useOn:[Constants brawlerUseOnSkill:SecondComboSkill] damage:[Constants brawlerDamageOfSkill:SecondComboSkill] duration:[Constants brawlerDurationOfSkill:SecondComboSkill] upgradeMargin:[Constants brawlerGainMarginOfSkill:SecondComboSkill]] autorelease];
                    break;
                    
                case ThirdComboSkill:
                    // BLADE WALTZ
                    return [[[Skill alloc] initWithFunction:[Constants brawlerFunctionOfSkill:ThirdComboSkill] range:[Constants brawlerRangeOfSkill:ThirdComboSkill] target:[Constants brawlerTargetOfSkill:ThirdComboSkill] useOn:[Constants brawlerUseOnSkill:ThirdComboSkill] damage:[Constants brawlerDamageOfSkill:ThirdComboSkill] duration:[Constants brawlerDurationOfSkill:ThirdComboSkill] upgradeMargin:[Constants brawlerGainMarginOfSkill:ThirdComboSkill]] autorelease];
                    break;
                    
                default:
                    break;
            }
            break;
        
        // BOWMAN
        case KnightTypeBowman:
            switch (type) {
                case BasicAttack:
                    // MARKSMAN SHOT
                    return [[[Skill alloc] initWithFunction:[Constants bowmanFunctionOfSkill:BasicAttack] range:[Constants bowmanRangeOfSkill:BasicAttack] target:[Constants bowmanTargetOfSkill:BasicAttack] useOn:[Constants bowmanUseOnSkill:BasicAttack] damage:[Constants bowmanDamageOfSkill:BasicAttack] duration:[Constants bowmanDurationOfSkill:BasicAttack] upgradeMargin:[Constants bowmanGainMarginOfSkill:BasicAttack]] autorelease];
                    break;
                    
                case FirstComboSkill:
                    // DOUBLE ARROW
                    return [[[Skill alloc] initWithFunction:[Constants bowmanFunctionOfSkill:FirstComboSkill] range:[Constants bowmanRangeOfSkill:FirstComboSkill] target:[Constants bowmanTargetOfSkill:FirstComboSkill] useOn:[Constants bowmanUseOnSkill:FirstComboSkill] damage:[Constants bowmanDamageOfSkill:FirstComboSkill] duration:[Constants bowmanDurationOfSkill:FirstComboSkill] upgradeMargin:[Constants bowmanGainMarginOfSkill:FirstComboSkill]] autorelease];
                    break;
                    
                case SecondComboSkill:
                    // BLEEDING SHOT
                    return [[[Skill alloc] initWithFunction:[Constants bowmanFunctionOfSkill:SecondComboSkill] range:[Constants bowmanRangeOfSkill:SecondComboSkill] target:[Constants brawlerTargetOfSkill:SecondComboSkill] useOn:[Constants bowmanUseOnSkill:SecondComboSkill] damage:[Constants bowmanDamageOfSkill:SecondComboSkill] duration:[Constants bowmanDurationOfSkill:SecondComboSkill] upgradeMargin:[Constants bowmanGainMarginOfSkill:SecondComboSkill]] autorelease];
                    break;
                    
                case ThirdComboSkill:
                    // ARROW VOLLEY
                    return [[[Skill alloc] initWithFunction:[Constants bowmanFunctionOfSkill:ThirdComboSkill] range:[Constants bowmanRangeOfSkill:ThirdComboSkill] target:[Constants bowmanTargetOfSkill:ThirdComboSkill] useOn:[Constants bowmanUseOnSkill:ThirdComboSkill] damage:[Constants bowmanDamageOfSkill:ThirdComboSkill] duration:[Constants bowmanDurationOfSkill:ThirdComboSkill] upgradeMargin:[Constants bowmanGainMarginOfSkill:ThirdComboSkill]] autorelease];
                    break;
                    
                default:
                    break;
            }
            break;
            
        case KnightTypePaladin:
            switch (type) {
                case BasicAttack:
                    // RIGHTIOUS SLASH
                    return [[[Skill alloc] initWithFunction:[Constants paladinFunctionOfSkill:BasicAttack] range:[Constants paladinRangeOfSkill:BasicAttack] target:[Constants paladinTargetOfSkill:BasicAttack] useOn:[Constants paladinUseOnSkill:BasicAttack] damage:[Constants paladinDamageOfSkill:BasicAttack] duration:[Constants paladinDurationOfSkill:BasicAttack] upgradeMargin:[Constants paladinGainMarginOfSkill:BasicAttack]] autorelease];
                    break;
                    
                case FirstComboSkill:
                    // LEAP OF FAITH
                    return [[[Skill alloc] initWithFunction:[Constants paladinFunctionOfSkill:FirstComboSkill] range:[Constants paladinRangeOfSkill:FirstComboSkill] target:[Constants paladinTargetOfSkill:FirstComboSkill] useOn:[Constants paladinUseOnSkill:FirstComboSkill] damage:[Constants paladinDamageOfSkill:FirstComboSkill] duration:[Constants paladinDurationOfSkill:FirstComboSkill] upgradeMargin:[Constants paladinGainMarginOfSkill:FirstComboSkill]] autorelease];
                    break;
                    
                case SecondComboSkill:
                    // PUNISHMENT
                    return [[[Skill alloc] initWithFunction:[Constants paladinFunctionOfSkill:SecondComboSkill] range:[Constants paladinRangeOfSkill:SecondComboSkill] target:[Constants paladinTargetOfSkill:SecondComboSkill] useOn:[Constants paladinUseOnSkill:SecondComboSkill] damage:[Constants paladinDamageOfSkill:SecondComboSkill] duration:[Constants paladinDurationOfSkill:SecondComboSkill] upgradeMargin:[Constants paladinGainMarginOfSkill:SecondComboSkill]] autorelease];
                    break;
                    
                case ThirdComboSkill:
                    // HOLLY INTERVENTION
                    return [[[Skill alloc] initWithFunction:[Constants paladinFunctionOfSkill:ThirdComboSkill] range:[Constants paladinRangeOfSkill:ThirdComboSkill] target:[Constants paladinTargetOfSkill:ThirdComboSkill] useOn:[Constants paladinUseOnSkill:ThirdComboSkill] damage:[Constants paladinDamageOfSkill:ThirdComboSkill] duration:[Constants paladinDurationOfSkill:ThirdComboSkill] upgradeMargin:[Constants paladinGainMarginOfSkill:ThirdComboSkill]] autorelease];
                    break;
                    
                default:
                    break;
            }
            break;
            
        case KnightTypeFireEnchantress:
            switch (type) {
                case BasicAttack:
                    // FLAME STRIKE
                    return [[[Skill alloc] initWithFunction:[Constants fireEnchantressFunctionOfSkill:BasicAttack] range:[Constants fireEnchantressRangeOfSkill:BasicAttack] target:[Constants fireEnchantressTargetOfSkill:BasicAttack] useOn:[Constants fireEnchantressUseOnSkill:BasicAttack] damage:[Constants fireEnchantressDamageOfSkill:BasicAttack] duration:[Constants fireEnchantressDurationOfSkill:BasicAttack] upgradeMargin:[Constants fireEnchantressGainMarginOfSkill:BasicAttack]] autorelease];
                    break;
                    
                case FirstComboSkill:
                    // PURGING FLAME
                    return [[[Skill alloc] initWithFunction:[Constants fireEnchantressFunctionOfSkill:FirstComboSkill] range:[Constants fireEnchantressRangeOfSkill:FirstComboSkill] target:[Constants fireEnchantressTargetOfSkill:FirstComboSkill] useOn:[Constants fireEnchantressUseOnSkill:FirstComboSkill] damage:[Constants fireEnchantressDamageOfSkill:FirstComboSkill] duration:[Constants fireEnchantressDurationOfSkill:FirstComboSkill] upgradeMargin:[Constants fireEnchantressGainMarginOfSkill:FirstComboSkill]] autorelease];
                    break;
                    
                case SecondComboSkill:
                    // FIRE DESTRUCTION
                    return [[[Skill alloc] initWithFunction:[Constants fireEnchantressFunctionOfSkill:SecondComboSkill] range:[Constants fireEnchantressRangeOfSkill:SecondComboSkill] target:[Constants fireEnchantressTargetOfSkill:SecondComboSkill] useOn:[Constants fireEnchantressUseOnSkill:SecondComboSkill] damage:[Constants fireEnchantressDamageOfSkill:SecondComboSkill] duration:[Constants fireEnchantressDurationOfSkill:SecondComboSkill] upgradeMargin:[Constants fireEnchantressGainMarginOfSkill:SecondComboSkill]] autorelease];
                    break;
                    
                case ThirdComboSkill:
                    // INFERNO
                    return [[[Skill alloc] initWithFunction:[Constants fireEnchantressFunctionOfSkill:ThirdComboSkill] range:[Constants fireEnchantressRangeOfSkill:ThirdComboSkill] target:[Constants fireEnchantressTargetOfSkill:ThirdComboSkill] useOn:[Constants fireEnchantressUseOnSkill:ThirdComboSkill] damage:[Constants fireEnchantressDamageOfSkill:ThirdComboSkill] duration:[Constants fireEnchantressDurationOfSkill:ThirdComboSkill] upgradeMargin:[Constants fireEnchantressGainMarginOfSkill:ThirdComboSkill]] autorelease];
                    break;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return nil;
}

+ (Skill *) createSkill:(SkillType)type forEnemy:(MonsterType)enemy {
    return nil;
}

@end
