//
//  Constants.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KOTPTEnums.h"
#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface Constants : GameComponent {
    NSDictionary *data_position;
    NSDictionary *data_value;
    NSDictionary *data_text;
    NSDictionary *data_meta;
}

+ (void) initializeWithGame:(Game *)game;

+ (Vector2 *) getPositionDataForKey:(NSString *)key;
+ (Vector2 *) getPositionDataForKey:(NSString *)key withAdded:(NSString *)addKey;
+ (MetaData *) getMetaDataForKey:(NSString *)key;
+ (NSString *) getTextForKey:(NSString *)key;
+ (NSDictionary *) getValueDataForKey:(NSString *)key;

+ (int) getStartingGold;
+ (int) getMaxSkillLvl;
+ (int) getMaxUnitLvl;
+ (int) getMaxEquipmentLvl;
+ (int) getMaxDiceLvl;
+ (int) getXpForLvl:(Lvl)lvl;
+ (int) getNumOfDicesForLvl:(Lvl)lvl;
+ (NSArray *) getComboForUnit:(KnightType)type forSkill:(SkillType)skill;
+ (NSArray *) getBaseStatsForUnit:(KnightType)type;
+ (int) getBaseHpForUnit:(KnightType)type;

+ (int) getUpgradeCostOfSkillLvl:(Lvl)lvl;
+ (int) getUpgradeCostOfDicesLvl:(Lvl)lvl;
+ (int) getUpgradeCostOfEquipmentLvl:(Lvl)lvl;

+ (Rectangle *) getInterfaceScrollRect;

+ (NSString*) progressFilePath;

+ (int) backgroundWidth;
+ (int) battlefieldHeight;
+ (int) hudHeight;

+ (int) positionXOfAlly:(CombatPosition)theAlly;
+ (int) positionYOfAlly:(CombatPosition)theAlly;

+ (int) areaXOfAlly:(CombatPosition)theAlly;
+ (int) areaYOfAlly:(CombatPosition)theAlly;
+ (int) allyAreaWidth;
+ (int) allyAreaHeight;

+ (int) comboAreaXOfAlly:(CombatPosition)theAlly;
+ (int) comboAreaYOfAlly:(CombatPosition)theAlly;
+ (int) comboAreaWidth;
+ (int) comboAreaHeight;

+ (int) comboAreaXOfAlly:(CombatPosition)theAlly atPosition:(ComboItem)theItem;
+ (int) comboAreaYOfAlly:(CombatPosition)theAlly atPosition:(ComboItem)theItem;
+ (int) separateComboAreaSize;

+ (int) hpPoolXOfAlly:(CombatPosition)theAlly;
+ (int) hpPoolYOfAlly:(CombatPosition)theAlly;
+ (int) hpPoolWidth;
+ (int) hpPoolHeight;

+ (int) portraitXOfAlly:(CombatPosition)theAlly;
+ (int) portraitYOfAlly:(CombatPosition)theAlly;
+ (int) portraitSize;

+ (int) skillXOfAlly:(CombatPosition)theAlly;
+ (int) skillYOfAlly:(CombatPosition)theAlly;
+ (int) skillSize;

+ (int) dicepoolLeftWall;
+ (int) dicepoolRightWall;
+ (int) dicepoolUpWall;
+ (int) dicepoolDownWall;

+ (DamageType) advantageOfDamageType:(DamageType)type;
+ (DamageType) disadvantageOfDamageType:(DamageType)type;

+ (int) requiredExpToLvlUp;
+ (int) expGainNormal;
+ (int) expGainElite;
+ (int) expGainBoss;

+ (int) maxSkillLevel;

// allies
+ (int) brawlerHealthPoints;
+ (DamageType) brawlerDamageType;
+ (int) brawlerValueOfStat:(StatType)stat;
+ (int) brawlerGainMarginOfStat:(StatType)stat;
//+ (SkillFunction) brawlerFunctionOfSkill:(SkillType)skill;
//+ (SkillRange) brawlerRangeOfSkill:(SkillType)skill;
//+ (SkillTarget) brawlerTargetOfSkill:(SkillType)skill;
//+ (SkillUseOn) brawlerUseOnSkill:(SkillType)skill;
+ (float) brawlerDamageOfSkill:(SkillType)skill;
+ (float) brawlerGainMarginOfSkill:(SkillType)skill;

+ (int) bowmanHealthPoints;
+ (DamageType) bowmanDamageType;
+ (int) bowmanValueOfStat:(StatType)stat;
+ (int) bowmanGainMarginOfStat:(StatType)stat;
//+ (SkillFunction) bowmanFunctionOfSkill:(SkillType)skill;
//+ (SkillRange) bowmanRangeOfSkill:(SkillType)skill;
//+ (SkillTarget) bowmanTargetOfSkill:(SkillType)skill;
//+ (SkillUseOn) bowmanUseOnSkill:(SkillType)skill;
+ (float) bowmanDamageOfSkill:(SkillType)skill;
+ (float) bowmanGainMarginOfSkill:(SkillType)skill;

+ (int) paladinHealthPoints;
+ (DamageType) paladinDamageType;
+ (int) paladinValueOfStat:(StatType)stat;
+ (int) paladinGainMarginOfStat:(StatType)stat;
//+ (SkillFunction) paladinFunctionOfSkill:(SkillType)skill;
//+ (SkillRange) paladinRangeOfSkill:(SkillType)skill;
//+ (SkillTarget) paladinTargetOfSkill:(SkillType)skill;
//+ (SkillUseOn) paladinUseOnSkill:(SkillType)skill;
+ (float) paladinDamageOfSkill:(SkillType)skill;
+ (float) paladinGainMarginOfSkill:(SkillType)skill;

+ (int) fireEnchantressHealthPoints;
+ (DamageType) fireEnchantressDamageType;
+ (int) fireEnchantressValueOfStat:(StatType)stat;
+ (int) fireEnchantressGainMarginOfStat:(StatType)stat;
//+ (SkillFunction) fireEnchantressFunctionOfSkill:(SkillType)skill;
//+ (SkillRange) fireEnchantressRangeOfSkill:(SkillType)skill;
//+ (SkillTarget) fireEnchantressTargetOfSkill:(SkillType)skill;
//+ (SkillUseOn) fireEnchantressUseOnSkill:(SkillType)skill;
+ (float) fireEnchantressDamageOfSkill:(SkillType)skill;
+ (float) fireEnchantressGainMarginOfSkill:(SkillType)skill;

// enemies
+ (int) enemyWarriorHealthPoints;
+ (DamageType) enemyWarriorDamageType;
+ (int) enemyWarriorValueOfStat:(StatType)stat;
+ (int) enemyWarriorGainMarginOfStat:(StatType)stat;
//+ (SkillFunction) enemyWarriorFunctionOfSkill:(SkillType)skill;
//+ (SkillRange) enemyWarriorRangeOfSkill:(SkillType)skill;
//+ (SkillTarget) enemyWarriorTargetOfSkill:(SkillType)skill;
//+ (SkillUseOn) enemyWarriorUseOnSkill:(SkillType)skill;
+ (float) enemyWarriorDamageOfSkill:(SkillType)skill;
+ (float) enemyWarriorGainMarginOfSkill:(SkillType)skill;

+ (int) enemyBruteHealthPoints;
+ (DamageType) enemyBruteDamageType;
+ (int) enemyBruteValueOfStat:(StatType)stat;
+ (int) enemyBruteGainMarginOfStat:(StatType)stat;
//+ (SkillFunction) enemyBruteFunctionOfSkill:(SkillType)skill;
//+ (SkillRange) enemyBruteRangeOfSkill:(SkillType)skill;
//+ (SkillTarget) enemyBruteTargetOfSkill:(SkillType)skill;
//+ (SkillUseOn) enemyBruteUseOnSkill:(SkillType)skill;
+ (float) enemyBruteDamageOfSkill:(SkillType)skill;
+ (float) enemyBruteGainMarginOfSkill:(SkillType)skill;

+ (int) enemyVikingHealthPoints;
+ (DamageType) enemyVikingDamageType;
+ (int) enemyVikingValueOfStat:(StatType)stat;
+ (int) enemyVikingGainMarginOfStat:(StatType)stat;
//+ (SkillFunction) enemyVikingFunctionOfSkill:(SkillType)skill;
//+ (SkillRange) enemyVikingRangeOfSkill:(SkillType)skill;
//+ (SkillTarget) enemyVikingTargetOfSkill:(SkillType)skill;
//+ (SkillUseOn) enemyVikingUseOnSkill:(SkillType)skill;
+ (float) enemyVikingDamageOfSkill:(SkillType)skill;
+ (float) enemyVikingGainMarginOfSkill:(SkillType)skill;

+ (int) enemyBossKnightHealthPoints;
+ (DamageType) enemyBossKnightDamageType;
+ (int) enemyBossKnightValueOfStat:(StatType)stat;
+ (int) enemyBossKnightGainMarginOfStat:(StatType)stat;
//+ (SkillFunction) enemyBossKnightFunctionOfSkill:(SkillType)skill;
//+ (SkillRange) enemyBossKnightRangeOfSkill:(SkillType)skill;
//+ (SkillTarget) enemyBossKnightTargetOfSkill:(SkillType)skill;
//+ (SkillUseOn) enemyBossKnightUseOnSkill:(SkillType)skill;
+ (float) enemyBossKnightDamageOfSkill:(SkillType)skill;
+ (float) enemyBossKnightGainMarginOfSkill:(SkillType)skill;






// ally animations
+ (int) spritesheetWidthOfAlly:(KnightType)ally;
+ (int) frameWidthOfAnimation:(AnimationType)type ally:(KnightType)ally;
+ (int) frameHeightOfAnimation:(AnimationType)type ally:(KnightType)ally;
+ (int) framePositionForAnimation:(AnimationType)type ally:(KnightType)ally;
+ (int) numFramesInAnimation:(AnimationType)type ally:(KnightType)ally;
+ (float) durationOfAnimation:(AnimationType)type ally:(KnightType)ally;

// enemy animations
+ (int) spritesheetWidthOfEnemy:(MonsterType)enemy;
+ (int) frameWidthOfAnimation:(AnimationType)type enemy:(MonsterType)enemy;
+ (int) frameHeightOfAnimation:(AnimationType)type enemy:(MonsterType)enemy;
+ (int) framePositionForAnimation:(AnimationType)type enemy:(MonsterType)enemy;
+ (int) numFramesInAnimation:(AnimationType)type enemy:(MonsterType)enemy;
+ (float) durationOfAnimation:(AnimationType)type enemy:(MonsterType)enemy;




// interface
+ (NSString *) getSwitchButtonText:(BuildingType)type;






// calculations
+ (int) getExpNeededForNextLvl:(int)lvl;



// characters stats
+ (int) getMaxKnightLvl;


@end

NS_ASSUME_NONNULL_END
