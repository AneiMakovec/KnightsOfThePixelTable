//
//  SkillFactory.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "SkillFactory.h"

#import "Pixlron.Knights.h"

#define NAME_KEY @"name"
#define FUNCTION_KEY @"function"
#define DAMAGE_KEY @"damage"
#define TARGET_KEY @"target"
#define RANGE_KEY @"range"
#define DAMAGE_TYPE_KEY @"dmg_type"
#define CONDITIONS_KEY @"conditions"
#define PROJECTILE_KEY @"projectile_type"
#define EFFECT_KEY @"skill_effect"

#define CONDITION_TYPE_KEY @"type"
#define CONDITION_TARGET_KEY @"target"
#define CONDITION_CHANCE_KEY @"chance"
#define CONDITION_DURATION_KEY @"duration"

@implementation SkillFactory

+ (Skill *) createSkill:(SkillType)type forAlly:(KnightType)ally {
    NSDictionary *skillData = [[[Constants getValueDataForKey:VALUE_UNIT_SKILLS] objectForKey:[NSString stringWithFormat:@"%d", ally]] objectForKey:[NSString stringWithFormat:@"%d", type]];
    
    Skill *skill = [[[Skill alloc] initWithName:[skillData objectForKey:NAME_KEY] function:[[skillData valueForKey:FUNCTION_KEY] intValue] range:[[skillData valueForKey:RANGE_KEY] intValue] target:[[skillData valueForKey:TARGET_KEY] intValue] damage:[[skillData valueForKey:DAMAGE_KEY] floatValue] damageType:[[skillData valueForKey:DAMAGE_TYPE_KEY] intValue] projectileType:[[skillData valueForKey:PROJECTILE_KEY] intValue] skillEffect:[[skillData valueForKey:EFFECT_KEY] intValue]] autorelease];
    
    ConditionData *condData = nil;
    for (NSDictionary *dict in [skillData objectForKey:CONDITIONS_KEY]) {
        condData = [[ConditionData alloc] initWithType:[[dict valueForKey:CONDITION_TYPE_KEY] intValue] target:[[dict valueForKey:CONDITION_TARGET_KEY] intValue] chance:[[dict valueForKey:CONDITION_CHANCE_KEY] floatValue] duration:[[dict valueForKey:CONDITION_DURATION_KEY] intValue]];
        [skill addCondition:condData];
        [condData release];
    }
    
    
    
    
//    switch (ally) {
//        // BRAWLER
//        case KnightTypeBrawler:
//            switch (type) {
//                case BasicAttack:
                    // CUT THROUGH
//                    skill = [[[Skill alloc] initWithFunction:[Constants brawlerFunctionOfSkill:BasicAttack] range:[Constants brawlerRangeOfSkill:BasicAttack] target:[Constants brawlerTargetOfSkill:BasicAttack] useOn:[Constants brawlerUseOnSkill:BasicAttack] damage:[Constants brawlerDamageOfSkill:BasicAttack] upgradeMargin:[Constants brawlerGainMarginOfSkill:BasicAttack]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.2f duration:2 chance:30 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
                    
//                    break;
//
//                case FirstComboSkill:
                    // FOCUS
//                    skill = [[[Skill alloc] initWithFunction:[Constants brawlerFunctionOfSkill:FirstComboSkill] range:[Constants brawlerRangeOfSkill:FirstComboSkill] target:[Constants brawlerTargetOfSkill:FirstComboSkill] useOn:[Constants brawlerUseOnSkill:FirstComboSkill] damage:[Constants brawlerDamageOfSkill:FirstComboSkill] upgradeMargin:[Constants brawlerGainMarginOfSkill:FirstComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.2f duration:2 chance:50 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                case SecondComboSkill:
                    // SWINGING SLASH
//                    skill = [[[Skill alloc] initWithFunction:[Constants brawlerFunctionOfSkill:SecondComboSkill] range:[Constants brawlerRangeOfSkill:SecondComboSkill] target:[Constants brawlerTargetOfSkill:SecondComboSkill] useOn:[Constants brawlerUseOnSkill:SecondComboSkill] damage:[Constants brawlerDamageOfSkill:SecondComboSkill] upgradeMargin:[Constants brawlerGainMarginOfSkill:SecondComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.2f duration:2 chance:70 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                case ThirdComboSkill:
                    // UNSTOPABLE RAGE
//                    skill = [[[Skill alloc] initWithFunction:[Constants brawlerFunctionOfSkill:ThirdComboSkill] range:[Constants brawlerRangeOfSkill:ThirdComboSkill] target:[Constants brawlerTargetOfSkill:ThirdComboSkill] useOn:[Constants brawlerUseOnSkill:ThirdComboSkill] damage:[Constants brawlerDamageOfSkill:ThirdComboSkill] upgradeMargin:[Constants brawlerGainMarginOfSkill:ThirdComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.2f duration:2 chance:100 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                default:
//                    break;
//            }
//            break;
//
//        // BOWMAN
//        case KnightTypeLongbowman:
//            switch (type) {
//                case BasicAttack:
                    // MARKSMAN SHOT
//                    skill = [[[Skill alloc] initWithFunction:[Constants bowmanFunctionOfSkill:BasicAttack] range:[Constants bowmanRangeOfSkill:BasicAttack] target:[Constants bowmanTargetOfSkill:BasicAttack] useOn:[Constants bowmanUseOnSkill:BasicAttack] damage:[Constants bowmanDamageOfSkill:BasicAttack] upgradeMargin:[Constants bowmanGainMarginOfSkill:BasicAttack]] autorelease];
//                    break;
//
//                case FirstComboSkill:
                    // POISONED SHOT
//                    skill = [[[Skill alloc] initWithFunction:[Constants bowmanFunctionOfSkill:FirstComboSkill] range:[Constants bowmanRangeOfSkill:FirstComboSkill] target:[Constants bowmanTargetOfSkill:FirstComboSkill] useOn:[Constants bowmanUseOnSkill:FirstComboSkill] damage:[Constants bowmanDamageOfSkill:FirstComboSkill] upgradeMargin:[Constants bowmanGainMarginOfSkill:FirstComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypePoison damage:0.2f duration:2 chance:30 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                case SecondComboSkill:
                    // DOUBLE ARROW
//                    skill = [[[Skill alloc] initWithFunction:[Constants bowmanFunctionOfSkill:SecondComboSkill] range:[Constants bowmanRangeOfSkill:SecondComboSkill] target:[Constants brawlerTargetOfSkill:SecondComboSkill] useOn:[Constants bowmanUseOnSkill:SecondComboSkill] damage:[Constants bowmanDamageOfSkill:SecondComboSkill] upgradeMargin:[Constants bowmanGainMarginOfSkill:SecondComboSkill]] autorelease];
//                    break;
//
//                case ThirdComboSkill:
                    // ARROW VOLLEY
//                    skill = [[[Skill alloc] initWithFunction:[Constants bowmanFunctionOfSkill:ThirdComboSkill] range:[Constants bowmanRangeOfSkill:ThirdComboSkill] target:[Constants bowmanTargetOfSkill:ThirdComboSkill] useOn:[Constants bowmanUseOnSkill:ThirdComboSkill] damage:[Constants bowmanDamageOfSkill:ThirdComboSkill] upgradeMargin:[Constants bowmanGainMarginOfSkill:ThirdComboSkill]] autorelease];
//                    effect = [[Debuff alloc] initWithStatType:Accuracy debuff:0.2f duration:2 chance:100 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                default:
//                    break;
//            }
//            break;
//        // PALADIN
//        case KnightTypePaladin:
//            switch (type) {
//                case BasicAttack:
                    // RIGHTIOUS SLASH
//                    skill = [[[Skill alloc] initWithFunction:[Constants paladinFunctionOfSkill:BasicAttack] range:[Constants paladinRangeOfSkill:BasicAttack] target:[Constants paladinTargetOfSkill:BasicAttack] useOn:[Constants paladinUseOnSkill:BasicAttack] damage:[Constants paladinDamageOfSkill:BasicAttack] upgradeMargin:[Constants paladinGainMarginOfSkill:BasicAttack]] autorelease];
//                    break;
//
//                case FirstComboSkill:
                    // LEAP OF FAITH
//                    skill = [[[Skill alloc] initWithFunction:[Constants paladinFunctionOfSkill:FirstComboSkill] range:[Constants paladinRangeOfSkill:FirstComboSkill] target:[Constants paladinTargetOfSkill:FirstComboSkill] useOn:[Constants paladinUseOnSkill:FirstComboSkill] damage:[Constants paladinDamageOfSkill:FirstComboSkill] upgradeMargin:[Constants paladinGainMarginOfSkill:FirstComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeStun damage:0 duration:2 chance:40 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                case SecondComboSkill:
                    // PUNISHMENT
//                    skill = [[[Skill alloc] initWithFunction:[Constants paladinFunctionOfSkill:SecondComboSkill] range:[Constants paladinRangeOfSkill:SecondComboSkill] target:[Constants paladinTargetOfSkill:SecondComboSkill] useOn:[Constants paladinUseOnSkill:SecondComboSkill] damage:[Constants paladinDamageOfSkill:SecondComboSkill] upgradeMargin:[Constants paladinGainMarginOfSkill:SecondComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeStun damage:0 duration:2 chance:50 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                case ThirdComboSkill:
                    // HOLLY INTERVENTION
//                    skill = [[[Skill alloc] initWithFunction:[Constants paladinFunctionOfSkill:ThirdComboSkill] range:[Constants paladinRangeOfSkill:ThirdComboSkill] target:[Constants paladinTargetOfSkill:ThirdComboSkill] useOn:[Constants paladinUseOnSkill:ThirdComboSkill] damage:[Constants paladinDamageOfSkill:ThirdComboSkill] upgradeMargin:[Constants paladinGainMarginOfSkill:ThirdComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeStun damage:0 duration:2 chance:60 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                default:
//                    break;
//            }
//            break;
//        // FIRE ENCHANTRESS
//        case KnightTypeWizard:
//            switch (type) {
//                case BasicAttack:
                    // FLAME STRIKE
//                    skill = [[[Skill alloc] initWithFunction:[Constants fireEnchantressFunctionOfSkill:BasicAttack] range:[Constants fireEnchantressRangeOfSkill:BasicAttack] target:[Constants fireEnchantressTargetOfSkill:BasicAttack] useOn:[Constants fireEnchantressUseOnSkill:BasicAttack] damage:[Constants fireEnchantressDamageOfSkill:BasicAttack] upgradeMargin:[Constants fireEnchantressGainMarginOfSkill:BasicAttack]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBurn damage:0.2f duration:2 chance:30 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                case FirstComboSkill:
                    // PURGING FLAME
//                    skill = [[[Skill alloc] initWithFunction:[Constants fireEnchantressFunctionOfSkill:FirstComboSkill] range:[Constants fireEnchantressRangeOfSkill:FirstComboSkill] target:[Constants fireEnchantressTargetOfSkill:FirstComboSkill] useOn:[Constants fireEnchantressUseOnSkill:FirstComboSkill] damage:[Constants fireEnchantressDamageOfSkill:FirstComboSkill] upgradeMargin:[Constants fireEnchantressGainMarginOfSkill:FirstComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBurn damage:0.2f duration:2 chance:40 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                case SecondComboSkill:
                    // FIRE DESTRUCTION
//                    skill = [[[Skill alloc] initWithFunction:[Constants fireEnchantressFunctionOfSkill:SecondComboSkill] range:[Constants fireEnchantressRangeOfSkill:SecondComboSkill] target:[Constants fireEnchantressTargetOfSkill:SecondComboSkill] useOn:[Constants fireEnchantressUseOnSkill:SecondComboSkill] damage:[Constants fireEnchantressDamageOfSkill:SecondComboSkill] upgradeMargin:[Constants fireEnchantressGainMarginOfSkill:SecondComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBurn damage:0.2f duration:2 chance:50 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                case ThirdComboSkill:
                    // INFERNO
//                    skill = [[[Skill alloc] initWithFunction:[Constants fireEnchantressFunctionOfSkill:ThirdComboSkill] range:[Constants fireEnchantressRangeOfSkill:ThirdComboSkill] target:[Constants fireEnchantressTargetOfSkill:ThirdComboSkill] useOn:[Constants fireEnchantressUseOnSkill:ThirdComboSkill] damage:[Constants fireEnchantressDamageOfSkill:ThirdComboSkill] upgradeMargin:[Constants fireEnchantressGainMarginOfSkill:ThirdComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBurn damage:0.2f duration:2 chance:80 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                default:
//                    break;
//            }
//            break;
//
//        default:
//            break;
//    }
    
    return [skill retain];
}

+ (Skill *) createSkill:(SkillType)type forEnemy:(MonsterType)enemy {
    NSDictionary *skillData = [[[Constants getValueDataForKey:VALUE_UNIT_SKILLS] objectForKey:[NSString stringWithFormat:@"%d", enemy]] objectForKey:[NSString stringWithFormat:@"%d", type]];
    
    Skill *skill = [[[Skill alloc] initWithName:[skillData objectForKey:NAME_KEY] function:[[skillData valueForKey:FUNCTION_KEY] intValue] range:[[skillData valueForKey:RANGE_KEY] intValue] target:[[skillData valueForKey:TARGET_KEY] intValue] damage:[[skillData valueForKey:DAMAGE_KEY] floatValue] damageType:[[skillData valueForKey:DAMAGE_TYPE_KEY] intValue] projectileType:[[skillData valueForKey:PROJECTILE_KEY] intValue] skillEffect:[[skillData valueForKey:EFFECT_KEY] intValue]] autorelease];
    
    ConditionData *condData = nil;
    for (NSDictionary *dict in [skillData objectForKey:CONDITIONS_KEY]) {
        condData = [[ConditionData alloc] initWithType:[[dict valueForKey:CONDITION_TYPE_KEY] intValue] target:[[dict valueForKey:CONDITION_TARGET_KEY] intValue] chance:[[dict valueForKey:CONDITION_CHANCE_KEY] floatValue] duration:[[dict valueForKey:CONDITION_DURATION_KEY] intValue]];
        [skill addCondition:condData];
        [condData release];
    }
    
//    switch (enemy) {
//
        // WARRIOR
//        case MonsterTypeWarrior:
//            switch (type) {
//                case BasicAttack:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyWarriorFunctionOfSkill:BasicAttack] range:[Constants enemyWarriorRangeOfSkill:BasicAttack] target:[Constants enemyWarriorTargetOfSkill:BasicAttack] useOn:[Constants enemyWarriorUseOnSkill:BasicAttack] damage:[Constants enemyWarriorDamageOfSkill:BasicAttack] upgradeMargin:[Constants enemyWarriorGainMarginOfSkill:BasicAttack]] autorelease];
//                    break;
//
//                case FirstComboSkill:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyWarriorFunctionOfSkill:FirstComboSkill] range:[Constants enemyWarriorRangeOfSkill:FirstComboSkill] target:[Constants enemyWarriorTargetOfSkill:FirstComboSkill] useOn:[Constants enemyWarriorUseOnSkill:FirstComboSkill] damage:[Constants enemyWarriorDamageOfSkill:FirstComboSkill] upgradeMargin:[Constants enemyWarriorGainMarginOfSkill:FirstComboSkill]] autorelease];
//                    break;
//
//                case SecondComboSkill:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyWarriorFunctionOfSkill:SecondComboSkill] range:[Constants enemyWarriorRangeOfSkill:SecondComboSkill] target:[Constants enemyWarriorTargetOfSkill:SecondComboSkill] useOn:[Constants enemyWarriorUseOnSkill:SecondComboSkill] damage:[Constants enemyWarriorDamageOfSkill:SecondComboSkill] upgradeMargin:[Constants enemyWarriorGainMarginOfSkill:SecondComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeFrostbite damage:0.1f duration:1 chance:30 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                case ThirdComboSkill:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyWarriorFunctionOfSkill:ThirdComboSkill] range:[Constants enemyWarriorRangeOfSkill:ThirdComboSkill] target:[Constants enemyWarriorTargetOfSkill:ThirdComboSkill] useOn:[Constants enemyWarriorUseOnSkill:ThirdComboSkill] damage:[Constants enemyWarriorDamageOfSkill:ThirdComboSkill] upgradeMargin:[Constants enemyWarriorGainMarginOfSkill:ThirdComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeFrostbite damage:0.1f duration:1 chance:30 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                default:
//                    break;
//            }
//            break;
//
//        // BRUTE
//        case MonsterTypeBrute:
//            switch (type) {
//                case BasicAttack:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBruteFunctionOfSkill:BasicAttack] range:[Constants enemyBruteRangeOfSkill:BasicAttack] target:[Constants enemyBruteTargetOfSkill:BasicAttack] useOn:[Constants enemyBruteUseOnSkill:BasicAttack] damage:[Constants enemyBruteDamageOfSkill:BasicAttack] upgradeMargin:[Constants enemyBruteGainMarginOfSkill:BasicAttack]] autorelease];
//                    break;
//
//                case FirstComboSkill:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBruteFunctionOfSkill:FirstComboSkill] range:[Constants enemyBruteRangeOfSkill:FirstComboSkill] target:[Constants enemyBruteTargetOfSkill:FirstComboSkill] useOn:[Constants enemyBruteUseOnSkill:FirstComboSkill] damage:[Constants enemyBruteDamageOfSkill:FirstComboSkill] upgradeMargin:[Constants enemyBruteGainMarginOfSkill:FirstComboSkill]] autorelease];
//                    break;
//
//                case SecondComboSkill:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBruteFunctionOfSkill:SecondComboSkill] range:[Constants enemyBruteRangeOfSkill:SecondComboSkill] target:[Constants enemyBruteTargetOfSkill:SecondComboSkill] useOn:[Constants enemyBruteUseOnSkill:SecondComboSkill] damage:[Constants enemyBruteDamageOfSkill:SecondComboSkill] upgradeMargin:[Constants enemyBruteGainMarginOfSkill:SecondComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.1f duration:1 chance:30 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                case ThirdComboSkill:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBruteFunctionOfSkill:ThirdComboSkill] range:[Constants enemyBruteRangeOfSkill:ThirdComboSkill] target:[Constants enemyBruteTargetOfSkill:ThirdComboSkill] useOn:[Constants enemyBruteUseOnSkill:ThirdComboSkill] damage:[Constants enemyBruteDamageOfSkill:ThirdComboSkill] upgradeMargin:[Constants enemyBruteGainMarginOfSkill:ThirdComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.1f duration:1 chance:30 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                default:
//                    break;
//            }
//            break;
//
//        // VIKING
//        case MonsterTypeBossViking:
//            switch (type) {
//                case BasicAttack:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyVikingFunctionOfSkill:BasicAttack] range:[Constants enemyVikingRangeOfSkill:BasicAttack] target:[Constants enemyVikingTargetOfSkill:BasicAttack] useOn:[Constants enemyVikingUseOnSkill:BasicAttack] damage:[Constants enemyVikingDamageOfSkill:BasicAttack] upgradeMargin:[Constants enemyVikingGainMarginOfSkill:BasicAttack]] autorelease];
//                    break;
//
//                case FirstComboSkill:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyVikingFunctionOfSkill:FirstComboSkill] range:[Constants enemyVikingRangeOfSkill:FirstComboSkill] target:[Constants enemyVikingTargetOfSkill:FirstComboSkill] useOn:[Constants enemyVikingUseOnSkill:FirstComboSkill] damage:[Constants enemyVikingDamageOfSkill:FirstComboSkill] upgradeMargin:[Constants enemyVikingGainMarginOfSkill:FirstComboSkill]] autorelease];
//                    break;
//
//                case SecondComboSkill:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyVikingFunctionOfSkill:SecondComboSkill] range:[Constants enemyVikingRangeOfSkill:SecondComboSkill] target:[Constants enemyVikingTargetOfSkill:SecondComboSkill] useOn:[Constants enemyVikingUseOnSkill:SecondComboSkill] damage:[Constants enemyVikingDamageOfSkill:SecondComboSkill] upgradeMargin:[Constants enemyVikingGainMarginOfSkill:SecondComboSkill]] autorelease];
//                    break;
//
//                case ThirdComboSkill:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyVikingFunctionOfSkill:ThirdComboSkill] range:[Constants enemyVikingRangeOfSkill:ThirdComboSkill] target:[Constants enemyVikingTargetOfSkill:ThirdComboSkill] useOn:[Constants enemyVikingUseOnSkill:ThirdComboSkill] damage:[Constants enemyVikingDamageOfSkill:ThirdComboSkill] upgradeMargin:[Constants enemyVikingGainMarginOfSkill:ThirdComboSkill]] autorelease];
//                    break;
//
//                default:
//                    break;
//            }
//            break;
//
//        // BOSS KNIGHT
//        case MonsterTypeBossKnight:
//            switch (type) {
//                case BasicAttack:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBossKnightFunctionOfSkill:BasicAttack] range:[Constants enemyBossKnightRangeOfSkill:BasicAttack] target:[Constants enemyBossKnightTargetOfSkill:BasicAttack] useOn:[Constants enemyBossKnightUseOnSkill:BasicAttack] damage:[Constants enemyBossKnightDamageOfSkill:BasicAttack] upgradeMargin:[Constants enemyBossKnightGainMarginOfSkill:BasicAttack]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypePoison damage:0.1f duration:1 chance:30 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                case FirstComboSkill:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBossKnightFunctionOfSkill:FirstComboSkill] range:[Constants enemyBossKnightRangeOfSkill:FirstComboSkill] target:[Constants enemyBossKnightTargetOfSkill:FirstComboSkill] useOn:[Constants enemyBossKnightUseOnSkill:FirstComboSkill] damage:[Constants enemyBossKnightDamageOfSkill:FirstComboSkill] upgradeMargin:[Constants enemyBossKnightGainMarginOfSkill:FirstComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeFrostbite damage:0.1f duration:1 chance:30 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                case SecondComboSkill:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBossKnightFunctionOfSkill:SecondComboSkill] range:[Constants enemyBossKnightRangeOfSkill:SecondComboSkill] target:[Constants enemyBossKnightTargetOfSkill:SecondComboSkill] useOn:[Constants enemyBossKnightUseOnSkill:SecondComboSkill] damage:[Constants enemyBossKnightDamageOfSkill:SecondComboSkill] upgradeMargin:[Constants enemyBossKnightGainMarginOfSkill:SecondComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeBleed damage:0.1f duration:2 chance:30 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                case ThirdComboSkill:
//                    skill = [[[Skill alloc] initWithFunction:[Constants enemyBossKnightFunctionOfSkill:ThirdComboSkill] range:[Constants enemyBossKnightRangeOfSkill:ThirdComboSkill] target:[Constants enemyBossKnightTargetOfSkill:ThirdComboSkill] useOn:[Constants enemyBossKnightUseOnSkill:ThirdComboSkill] damage:[Constants enemyBossKnightDamageOfSkill:ThirdComboSkill] upgradeMargin:[Constants enemyBossKnightGainMarginOfSkill:ThirdComboSkill]] autorelease];
//                    effect = [[Condition alloc] initWithConditionType:ConditionTypeStun damage:0 duration:1 chance:20 chanceUpgradeMargin:5];
//                    [skill addStatEffect:effect];
//                    break;
//
//                default:
//                    break;
//            }
//            break;
//
//        default:
//            break;
//    }
    
    return [skill retain];
}

@end
