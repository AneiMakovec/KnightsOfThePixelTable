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
    Skill *skill = nil;
    StatEffect *effect = nil;
    
    switch (ally) {
        // BRAWLER
        case KnightTypeBrawler:
            switch (type) {
                case BasicAttack:
                    // DOUBLE SLASH
                    skill = [[[Skill alloc] initWithFunction:[Constants brawlerFunctionOfSkill:BasicAttack] range:[Constants brawlerRangeOfSkill:BasicAttack] target:[Constants brawlerTargetOfSkill:BasicAttack] useOn:[Constants brawlerUseOnSkill:BasicAttack] damage:[Constants brawlerDamageOfSkill:BasicAttack] duration:[Constants brawlerDurationOfSkill:BasicAttack] upgradeMargin:[Constants brawlerGainMarginOfSkill:BasicAttack]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.2f duration:2 chance:30 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                case FirstComboSkill:
                    // BLADE EDGE
                    skill = [[[Skill alloc] initWithFunction:[Constants brawlerFunctionOfSkill:FirstComboSkill] range:[Constants brawlerRangeOfSkill:FirstComboSkill] target:[Constants brawlerTargetOfSkill:FirstComboSkill] useOn:[Constants brawlerUseOnSkill:FirstComboSkill] damage:[Constants brawlerDamageOfSkill:FirstComboSkill] duration:[Constants brawlerDurationOfSkill:FirstComboSkill] upgradeMargin:[Constants brawlerGainMarginOfSkill:FirstComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.2f duration:2 chance:50 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                
                case SecondComboSkill:
                    // BLADE TWIST
                    skill = [[[Skill alloc] initWithFunction:[Constants brawlerFunctionOfSkill:SecondComboSkill] range:[Constants brawlerRangeOfSkill:SecondComboSkill] target:[Constants brawlerTargetOfSkill:SecondComboSkill] useOn:[Constants brawlerUseOnSkill:SecondComboSkill] damage:[Constants brawlerDamageOfSkill:SecondComboSkill] duration:[Constants brawlerDurationOfSkill:SecondComboSkill] upgradeMargin:[Constants brawlerGainMarginOfSkill:SecondComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.2f duration:2 chance:70 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                case ThirdComboSkill:
                    // BLADE WALTZ
                    skill = [[[Skill alloc] initWithFunction:[Constants brawlerFunctionOfSkill:ThirdComboSkill] range:[Constants brawlerRangeOfSkill:ThirdComboSkill] target:[Constants brawlerTargetOfSkill:ThirdComboSkill] useOn:[Constants brawlerUseOnSkill:ThirdComboSkill] damage:[Constants brawlerDamageOfSkill:ThirdComboSkill] duration:[Constants brawlerDurationOfSkill:ThirdComboSkill] upgradeMargin:[Constants brawlerGainMarginOfSkill:ThirdComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.2f duration:2 chance:100 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
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
                    skill = [[[Skill alloc] initWithFunction:[Constants bowmanFunctionOfSkill:BasicAttack] range:[Constants bowmanRangeOfSkill:BasicAttack] target:[Constants bowmanTargetOfSkill:BasicAttack] useOn:[Constants bowmanUseOnSkill:BasicAttack] damage:[Constants bowmanDamageOfSkill:BasicAttack] duration:[Constants bowmanDurationOfSkill:BasicAttack] upgradeMargin:[Constants bowmanGainMarginOfSkill:BasicAttack]] autorelease];
                    break;
                    
                case FirstComboSkill:
                    // POISONED SHOT
                    skill = [[[Skill alloc] initWithFunction:[Constants bowmanFunctionOfSkill:FirstComboSkill] range:[Constants bowmanRangeOfSkill:FirstComboSkill] target:[Constants bowmanTargetOfSkill:FirstComboSkill] useOn:[Constants bowmanUseOnSkill:FirstComboSkill] damage:[Constants bowmanDamageOfSkill:FirstComboSkill] duration:[Constants bowmanDurationOfSkill:FirstComboSkill] upgradeMargin:[Constants bowmanGainMarginOfSkill:FirstComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypePoison damage:0.2f duration:2 chance:30 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                case SecondComboSkill:
                    // DOUBLE ARROW
                    skill = [[[Skill alloc] initWithFunction:[Constants bowmanFunctionOfSkill:SecondComboSkill] range:[Constants bowmanRangeOfSkill:SecondComboSkill] target:[Constants brawlerTargetOfSkill:SecondComboSkill] useOn:[Constants bowmanUseOnSkill:SecondComboSkill] damage:[Constants bowmanDamageOfSkill:SecondComboSkill] duration:[Constants bowmanDurationOfSkill:SecondComboSkill] upgradeMargin:[Constants bowmanGainMarginOfSkill:SecondComboSkill]] autorelease];
                    break;
                    
                case ThirdComboSkill:
                    // ARROW VOLLEY
                    skill = [[[Skill alloc] initWithFunction:[Constants bowmanFunctionOfSkill:ThirdComboSkill] range:[Constants bowmanRangeOfSkill:ThirdComboSkill] target:[Constants bowmanTargetOfSkill:ThirdComboSkill] useOn:[Constants bowmanUseOnSkill:ThirdComboSkill] damage:[Constants bowmanDamageOfSkill:ThirdComboSkill] duration:[Constants bowmanDurationOfSkill:ThirdComboSkill] upgradeMargin:[Constants bowmanGainMarginOfSkill:ThirdComboSkill]] autorelease];
                    effect = [[Debuff alloc] initWithStatType:Insight debuff:0.2f duration:2 chance:100 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                default:
                    break;
            }
            break;
            
        case KnightTypePaladin:
            switch (type) {
                case BasicAttack:
                    // RIGHTIOUS SLASH
                    skill = [[[Skill alloc] initWithFunction:[Constants paladinFunctionOfSkill:BasicAttack] range:[Constants paladinRangeOfSkill:BasicAttack] target:[Constants paladinTargetOfSkill:BasicAttack] useOn:[Constants paladinUseOnSkill:BasicAttack] damage:[Constants paladinDamageOfSkill:BasicAttack] duration:[Constants paladinDurationOfSkill:BasicAttack] upgradeMargin:[Constants paladinGainMarginOfSkill:BasicAttack]] autorelease];
                    break;
                    
                case FirstComboSkill:
                    // LEAP OF FAITH
                    skill = [[[Skill alloc] initWithFunction:[Constants paladinFunctionOfSkill:FirstComboSkill] range:[Constants paladinRangeOfSkill:FirstComboSkill] target:[Constants paladinTargetOfSkill:FirstComboSkill] useOn:[Constants paladinUseOnSkill:FirstComboSkill] damage:[Constants paladinDamageOfSkill:FirstComboSkill] duration:[Constants paladinDurationOfSkill:FirstComboSkill] upgradeMargin:[Constants paladinGainMarginOfSkill:FirstComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeStun damage:0 duration:2 chance:40 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                case SecondComboSkill:
                    // PUNISHMENT
                    skill = [[[Skill alloc] initWithFunction:[Constants paladinFunctionOfSkill:SecondComboSkill] range:[Constants paladinRangeOfSkill:SecondComboSkill] target:[Constants paladinTargetOfSkill:SecondComboSkill] useOn:[Constants paladinUseOnSkill:SecondComboSkill] damage:[Constants paladinDamageOfSkill:SecondComboSkill] duration:[Constants paladinDurationOfSkill:SecondComboSkill] upgradeMargin:[Constants paladinGainMarginOfSkill:SecondComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeStun damage:0 duration:2 chance:50 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                case ThirdComboSkill:
                    // HOLLY INTERVENTION
                    skill = [[[Skill alloc] initWithFunction:[Constants paladinFunctionOfSkill:ThirdComboSkill] range:[Constants paladinRangeOfSkill:ThirdComboSkill] target:[Constants paladinTargetOfSkill:ThirdComboSkill] useOn:[Constants paladinUseOnSkill:ThirdComboSkill] damage:[Constants paladinDamageOfSkill:ThirdComboSkill] duration:[Constants paladinDurationOfSkill:ThirdComboSkill] upgradeMargin:[Constants paladinGainMarginOfSkill:ThirdComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeStun damage:0 duration:2 chance:60 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                default:
                    break;
            }
            break;
            
        case KnightTypeFireEnchantress:
            switch (type) {
                case BasicAttack:
                    // FLAME STRIKE
                    skill = [[[Skill alloc] initWithFunction:[Constants fireEnchantressFunctionOfSkill:BasicAttack] range:[Constants fireEnchantressRangeOfSkill:BasicAttack] target:[Constants fireEnchantressTargetOfSkill:BasicAttack] useOn:[Constants fireEnchantressUseOnSkill:BasicAttack] damage:[Constants fireEnchantressDamageOfSkill:BasicAttack] duration:[Constants fireEnchantressDurationOfSkill:BasicAttack] upgradeMargin:[Constants fireEnchantressGainMarginOfSkill:BasicAttack]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBurn damage:0.2f duration:2 chance:30 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                case FirstComboSkill:
                    // PURGING FLAME
                    skill = [[[Skill alloc] initWithFunction:[Constants fireEnchantressFunctionOfSkill:FirstComboSkill] range:[Constants fireEnchantressRangeOfSkill:FirstComboSkill] target:[Constants fireEnchantressTargetOfSkill:FirstComboSkill] useOn:[Constants fireEnchantressUseOnSkill:FirstComboSkill] damage:[Constants fireEnchantressDamageOfSkill:FirstComboSkill] duration:[Constants fireEnchantressDurationOfSkill:FirstComboSkill] upgradeMargin:[Constants fireEnchantressGainMarginOfSkill:FirstComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBurn damage:0.2f duration:2 chance:40 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                case SecondComboSkill:
                    // FIRE DESTRUCTION
                    skill = [[[Skill alloc] initWithFunction:[Constants fireEnchantressFunctionOfSkill:SecondComboSkill] range:[Constants fireEnchantressRangeOfSkill:SecondComboSkill] target:[Constants fireEnchantressTargetOfSkill:SecondComboSkill] useOn:[Constants fireEnchantressUseOnSkill:SecondComboSkill] damage:[Constants fireEnchantressDamageOfSkill:SecondComboSkill] duration:[Constants fireEnchantressDurationOfSkill:SecondComboSkill] upgradeMargin:[Constants fireEnchantressGainMarginOfSkill:SecondComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBurn damage:0.2f duration:2 chance:50 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                case ThirdComboSkill:
                    // INFERNO
                    skill = [[[Skill alloc] initWithFunction:[Constants fireEnchantressFunctionOfSkill:ThirdComboSkill] range:[Constants fireEnchantressRangeOfSkill:ThirdComboSkill] target:[Constants fireEnchantressTargetOfSkill:ThirdComboSkill] useOn:[Constants fireEnchantressUseOnSkill:ThirdComboSkill] damage:[Constants fireEnchantressDamageOfSkill:ThirdComboSkill] duration:[Constants fireEnchantressDurationOfSkill:ThirdComboSkill] upgradeMargin:[Constants fireEnchantressGainMarginOfSkill:ThirdComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBurn damage:0.2f duration:2 chance:80 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return skill;
}

+ (Skill *) createSkill:(SkillType)type forEnemy:(MonsterType)enemy {
    Skill *skill = nil;
    StatEffect *effect = nil;
    
    switch (enemy) {
        
        // WARRIOR
        case MonsterTypeWarrior:
            switch (type) {
                case BasicAttack:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyWarriorFunctionOfSkill:BasicAttack] range:[Constants enemyWarriorRangeOfSkill:BasicAttack] target:[Constants enemyWarriorTargetOfSkill:BasicAttack] useOn:[Constants enemyWarriorUseOnSkill:BasicAttack] damage:[Constants enemyWarriorDamageOfSkill:BasicAttack] duration:[Constants enemyWarriorDurationOfSkill:BasicAttack] upgradeMargin:[Constants enemyWarriorGainMarginOfSkill:BasicAttack]] autorelease];
                    break;
                    
                case FirstComboSkill:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyWarriorFunctionOfSkill:FirstComboSkill] range:[Constants enemyWarriorRangeOfSkill:FirstComboSkill] target:[Constants enemyWarriorTargetOfSkill:FirstComboSkill] useOn:[Constants enemyWarriorUseOnSkill:FirstComboSkill] damage:[Constants enemyWarriorDamageOfSkill:FirstComboSkill] duration:[Constants enemyWarriorDurationOfSkill:FirstComboSkill] upgradeMargin:[Constants enemyWarriorGainMarginOfSkill:FirstComboSkill]] autorelease];
                    break;
                    
                case SecondComboSkill:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyWarriorFunctionOfSkill:SecondComboSkill] range:[Constants enemyWarriorRangeOfSkill:SecondComboSkill] target:[Constants enemyWarriorTargetOfSkill:SecondComboSkill] useOn:[Constants enemyWarriorUseOnSkill:SecondComboSkill] damage:[Constants enemyWarriorDamageOfSkill:SecondComboSkill] duration:[Constants enemyWarriorDurationOfSkill:SecondComboSkill] upgradeMargin:[Constants enemyWarriorGainMarginOfSkill:SecondComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeFrostbite damage:0.1f duration:1 chance:30 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                case ThirdComboSkill:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyWarriorFunctionOfSkill:ThirdComboSkill] range:[Constants enemyWarriorRangeOfSkill:ThirdComboSkill] target:[Constants enemyWarriorTargetOfSkill:ThirdComboSkill] useOn:[Constants enemyWarriorUseOnSkill:ThirdComboSkill] damage:[Constants enemyWarriorDamageOfSkill:ThirdComboSkill] duration:[Constants enemyWarriorDurationOfSkill:ThirdComboSkill] upgradeMargin:[Constants enemyWarriorGainMarginOfSkill:ThirdComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeFrostbite damage:0.1f duration:1 chance:30 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                default:
                    break;
            }
            break;
        
        // BRUTE
        case MonsterTypeBrute:
            switch (type) {
                case BasicAttack:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBruteFunctionOfSkill:BasicAttack] range:[Constants enemyBruteRangeOfSkill:BasicAttack] target:[Constants enemyBruteTargetOfSkill:BasicAttack] useOn:[Constants enemyBruteUseOnSkill:BasicAttack] damage:[Constants enemyBruteDamageOfSkill:BasicAttack] duration:[Constants enemyBruteDurationOfSkill:BasicAttack] upgradeMargin:[Constants enemyBruteGainMarginOfSkill:BasicAttack]] autorelease];
                    break;
                    
                case FirstComboSkill:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBruteFunctionOfSkill:FirstComboSkill] range:[Constants enemyBruteRangeOfSkill:FirstComboSkill] target:[Constants enemyBruteTargetOfSkill:FirstComboSkill] useOn:[Constants enemyBruteUseOnSkill:FirstComboSkill] damage:[Constants enemyBruteDamageOfSkill:FirstComboSkill] duration:[Constants enemyBruteDurationOfSkill:FirstComboSkill] upgradeMargin:[Constants enemyBruteGainMarginOfSkill:FirstComboSkill]] autorelease];
                    break;
                    
                case SecondComboSkill:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBruteFunctionOfSkill:SecondComboSkill] range:[Constants enemyBruteRangeOfSkill:SecondComboSkill] target:[Constants enemyBruteTargetOfSkill:SecondComboSkill] useOn:[Constants enemyBruteUseOnSkill:SecondComboSkill] damage:[Constants enemyBruteDamageOfSkill:SecondComboSkill] duration:[Constants enemyBruteDurationOfSkill:SecondComboSkill] upgradeMargin:[Constants enemyBruteGainMarginOfSkill:SecondComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.1f duration:1 chance:30 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                case ThirdComboSkill:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBruteFunctionOfSkill:ThirdComboSkill] range:[Constants enemyBruteRangeOfSkill:ThirdComboSkill] target:[Constants enemyBruteTargetOfSkill:ThirdComboSkill] useOn:[Constants enemyBruteUseOnSkill:ThirdComboSkill] damage:[Constants enemyBruteDamageOfSkill:ThirdComboSkill] duration:[Constants enemyBruteDurationOfSkill:ThirdComboSkill] upgradeMargin:[Constants enemyBruteGainMarginOfSkill:ThirdComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.1f duration:1 chance:30 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                default:
                    break;
            }
            break;
        
        // VIKING
        case MonsterTypeBossViking:
            switch (type) {
                case BasicAttack:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyVikingFunctionOfSkill:BasicAttack] range:[Constants enemyVikingRangeOfSkill:BasicAttack] target:[Constants enemyVikingTargetOfSkill:BasicAttack] useOn:[Constants enemyVikingUseOnSkill:BasicAttack] damage:[Constants enemyVikingDamageOfSkill:BasicAttack] duration:[Constants enemyVikingDurationOfSkill:BasicAttack] upgradeMargin:[Constants enemyVikingGainMarginOfSkill:BasicAttack]] autorelease];
                    break;
                    
                case FirstComboSkill:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyVikingFunctionOfSkill:FirstComboSkill] range:[Constants enemyVikingRangeOfSkill:FirstComboSkill] target:[Constants enemyVikingTargetOfSkill:FirstComboSkill] useOn:[Constants enemyVikingUseOnSkill:FirstComboSkill] damage:[Constants enemyVikingDamageOfSkill:FirstComboSkill] duration:[Constants enemyVikingDurationOfSkill:FirstComboSkill] upgradeMargin:[Constants enemyVikingGainMarginOfSkill:FirstComboSkill]] autorelease];
                    break;
                    
                case SecondComboSkill:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyVikingFunctionOfSkill:SecondComboSkill] range:[Constants enemyVikingRangeOfSkill:SecondComboSkill] target:[Constants enemyVikingTargetOfSkill:SecondComboSkill] useOn:[Constants enemyVikingUseOnSkill:SecondComboSkill] damage:[Constants enemyVikingDamageOfSkill:SecondComboSkill] duration:[Constants enemyVikingDurationOfSkill:SecondComboSkill] upgradeMargin:[Constants enemyVikingGainMarginOfSkill:SecondComboSkill]] autorelease];
                    break;
                    
                case ThirdComboSkill:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyVikingFunctionOfSkill:ThirdComboSkill] range:[Constants enemyVikingRangeOfSkill:ThirdComboSkill] target:[Constants enemyVikingTargetOfSkill:ThirdComboSkill] useOn:[Constants enemyVikingUseOnSkill:ThirdComboSkill] damage:[Constants enemyVikingDamageOfSkill:ThirdComboSkill] duration:[Constants enemyVikingDurationOfSkill:ThirdComboSkill] upgradeMargin:[Constants enemyVikingGainMarginOfSkill:ThirdComboSkill]] autorelease];
                    break;
                    
                default:
                    break;
            }
            break;
        
        // BOSS KNIGHT
        case MonsterTypeBossKnight:
            switch (type) {
                case BasicAttack:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBossKnightFunctionOfSkill:BasicAttack] range:[Constants enemyBossKnightRangeOfSkill:BasicAttack] target:[Constants enemyBossKnightTargetOfSkill:BasicAttack] useOn:[Constants enemyBossKnightUseOnSkill:BasicAttack] damage:[Constants enemyBossKnightDamageOfSkill:BasicAttack] duration:[Constants enemyBossKnightDurationOfSkill:BasicAttack] upgradeMargin:[Constants enemyBossKnightGainMarginOfSkill:BasicAttack]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypePoison damage:0.1f duration:1 chance:30 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                case FirstComboSkill:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBossKnightFunctionOfSkill:FirstComboSkill] range:[Constants enemyBossKnightRangeOfSkill:FirstComboSkill] target:[Constants enemyBossKnightTargetOfSkill:FirstComboSkill] useOn:[Constants enemyBossKnightUseOnSkill:FirstComboSkill] damage:[Constants enemyBossKnightDamageOfSkill:FirstComboSkill] duration:[Constants enemyBossKnightDurationOfSkill:FirstComboSkill] upgradeMargin:[Constants enemyBossKnightGainMarginOfSkill:FirstComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeFrostbite damage:0.1f duration:1 chance:30 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                case SecondComboSkill:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBossKnightFunctionOfSkill:SecondComboSkill] range:[Constants enemyBossKnightRangeOfSkill:SecondComboSkill] target:[Constants enemyBossKnightTargetOfSkill:SecondComboSkill] useOn:[Constants enemyBossKnightUseOnSkill:SecondComboSkill] damage:[Constants enemyBossKnightDamageOfSkill:SecondComboSkill] duration:[Constants enemyBossKnightDurationOfSkill:SecondComboSkill] upgradeMargin:[Constants enemyBossKnightGainMarginOfSkill:SecondComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.1f duration:2 chance:30 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                case ThirdComboSkill:
                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBossKnightFunctionOfSkill:ThirdComboSkill] range:[Constants enemyBossKnightRangeOfSkill:ThirdComboSkill] target:[Constants enemyBossKnightTargetOfSkill:ThirdComboSkill] useOn:[Constants enemyBossKnightUseOnSkill:ThirdComboSkill] damage:[Constants enemyBossKnightDamageOfSkill:ThirdComboSkill] duration:[Constants enemyBossKnightDurationOfSkill:ThirdComboSkill] upgradeMargin:[Constants enemyBossKnightGainMarginOfSkill:ThirdComboSkill]] autorelease];
                    effect = [[Condition alloc] initWithConditionType:ConditionTypeStun damage:0 duration:1 chance:20 chanceUpgradeMargin:5];
                    [skill addStatEffect:effect];
                    break;
                    
                default:
                    break;
            }
            break;
        
        default:
            break;
    }
    
    return skill;
}

@end
