//
//  Constants.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Constants.h"

#import "Pixlron.Knights.h"

#define X @"x"
#define Y @"y"
#define WIDTH @"w"
#define HEIGHT @"h"
#define STEP @"step"
#define MAX_STEP @"max"

Constants *constantsInstance;

@implementation Constants


/*
 MARK: INITIALIZE WITH GAME
*/
+ (void) initializeWithGame:(Game *)game {
    constantsInstance = [[Constants alloc] initWithGame:game];
    [game.components addComponent:constantsInstance];
}

+ (Vector2 *) getPositionDataForKey:(NSString *)key {
    return [constantsInstance getPositionDataForKey:key];
}

+ (Vector2 *) getPositionDataForKey:(NSString *)key withAdded:(NSString *)addKey {
    return [constantsInstance getPositionDataForKey:key withAdded:addKey];
}

+ (MetaData *) getMetaDataForKey:(NSString *)key {
    return [constantsInstance getMetaDataForKey:key];
}

+ (NSString *) getTextForKey:(NSString *)key {
    return [constantsInstance getTextForKey:key];
}

+ (NSDictionary *) getValueDataForKey:(NSString *)key {
    return [constantsInstance getValueDataForKey:key];
}

+ (Rectangle *) getInterfaceScrollRect {
    return [constantsInstance getInterfaceScrollRect];
}

+ (int) getStartingGold {
    return [constantsInstance getStartingGold];
}

+ (int) getMaxSkillLvl {
    return [constantsInstance getMaxSkillLvl];
}

+ (int) getMaxUnitLvl {
    return [constantsInstance getMaxUnitLvl];
}

+ (int) getMaxEquipmentLvl {
    return [constantsInstance getMaxEquipmentLvl];
}

+ (int) getMaxDiceLvl {
    return [constantsInstance getMaxDiceLvl];
}

+ (int) getUpgradeCostOfSkillLvl:(Lvl)lvl {
    return [constantsInstance getUpgradeCostOfSkillLvl:lvl];
}

+ (int) getUpgradeCostOfDicesLvl:(Lvl)lvl {
    return [constantsInstance getUpgradeCostOfDicesLvl:lvl];
}

+ (int) getUpgradeCostOfEquipmentLvl:(Lvl)lvl {
    return [constantsInstance getUpgradeCostOfEquipmentLvl:lvl];
}

+ (int) getXpForLvl:(Lvl)lvl {
    return [constantsInstance getXpForLvl:lvl];
}

+ (int) getNumOfDicesForLvl:(Lvl)lvl {
    return [constantsInstance getNumOfDicesForLvl:lvl];
}

+ (float) getDifficultyForStage:(StageType)stage {
    return [constantsInstance getDifficultyForStage:stage];
}

+ (NSArray *) getComboForUnit:(KnightType)type forSkill:(SkillType)skill {
    return [constantsInstance getComboForUnit:type forSkill:skill];
}

+ (NSArray *) getBaseStatsForUnit:(KnightType)type {
    return [constantsInstance getBaseStatsForUnit:type];
}

+ (int) getBaseHpForUnit:(KnightType)type {
    return [constantsInstance getBaseHpForUnit:type];
}

+ (int) getWavesForStage:(StageType)stage {
    return [constantsInstance getWavesForStage:stage];
}

+ (int) getMonsterLvlForStage:(StageType)stage ofLevel:(LevelType)level {
    return [constantsInstance getMonsterLvlForStage:stage ofLevel:level];
}















- (Vector2 *) getPositionDataForKey:(NSString *)key {
    if (![key containsString:@"interface"]) {
        NSDictionary *positionData = [data_position objectForKey:key];
        
        return [Vector2 vectorWithX:[[positionData valueForKey:X] intValue] y:[[positionData valueForKey:Y] intValue]];
    } else {
        NSDictionary *positionData = [data_position objectForKey:POSITION_INTERFACE_BACKGROUND];
        
        if ([key isEqualToString:POSITION_INTERFACE_BACKGROUND]) {
            return [Vector2 vectorWithX:[[positionData valueForKey:X] intValue] y:[[positionData valueForKey:Y] intValue]];
        }
        
        NSDictionary *itemPositionData = [data_position objectForKey:key];
        
        return [Vector2 vectorWithX:[[positionData valueForKey:X] intValue] + [[itemPositionData valueForKey:X] intValue] y:[[positionData valueForKey:Y] intValue] + [[itemPositionData valueForKey:Y] intValue]];
    }
}

- (Vector2 *) getPositionDataForKey:(NSString *)key withAdded:(NSString *)addKey {
    NSDictionary *positionData = [data_position objectForKey:key];
    NSDictionary *positionData1 = [data_position objectForKey:addKey];
    
    return [Vector2 vectorWithX:[[positionData valueForKey:X] intValue] + [[positionData1 valueForKey:X] intValue] y:[[positionData valueForKey:Y] intValue] + [[positionData1 valueForKey:Y] intValue]];
}

- (MetaData *) getMetaDataForKey:(NSString *)key {
    NSDictionary *metaData = [data_meta objectForKey:key];
    
    if ([[metaData allKeys] containsObject:WIDTH] && [[metaData allKeys] containsObject:HEIGHT]) {
        if ([[metaData allKeys] containsObject:STEP])
            return [[[MetaData alloc] initWithStep:[[metaData valueForKey:STEP] intValue] width:[[metaData valueForKey:WIDTH] intValue] height:[[metaData valueForKey:HEIGHT] intValue]] autorelease];
        else
            return [[[MetaData alloc] initWithWidth:[[metaData valueForKey:WIDTH] intValue] height:[[metaData valueForKey:HEIGHT] intValue]] autorelease];
    } else if ([[metaData allKeys] containsObject:STEP]) {
        if ([[metaData allKeys] containsObject:MAX_STEP])
            return [[[MetaData alloc] initWithStep:[[metaData valueForKey:STEP] intValue] max:[[metaData valueForKey:MAX_STEP] intValue]] autorelease];
        else
            return [[[MetaData alloc] initWithStep:[[metaData valueForKey:STEP] intValue]] autorelease];
    }
    
    return nil;
}

- (NSString *) getTextForKey:(NSString *)key {
    return [data_text objectForKey:key];
}

- (NSDictionary *) getValueDataForKey:(NSString *)key {
    return [data_value objectForKey:key];
}

- (int) getStartingGold {
    return [[data_value valueForKey:VALUE_STARTING_GOLD] intValue];
}

- (int) getMaxSkillLvl {
    return [[data_value valueForKey:VALUE_MAX_LVL_SKILLS] intValue];
}

- (int) getMaxUnitLvl {
    return [[data_value valueForKey:VALUE_MAX_LVL_UNIT] intValue];
}

- (int) getMaxEquipmentLvl {
    return [[data_value valueForKey:VALUE_MAX_LVL_EQUIPMENT] intValue];
}

- (int) getMaxDiceLvl {
    return [[data_value valueForKey:VALUE_MAX_LVL_DICE] intValue];
}

- (int) getUpgradeCostOfSkillLvl:(Lvl)lvl {
    return [[[[data_value objectForKey:VALUE_UPGRADE_COST] objectForKey:VALUE_UPGRADE_COST_SKILL] valueForKey:[NSString stringWithFormat:@"%d", lvl]] intValue];
}

- (int) getUpgradeCostOfDicesLvl:(Lvl)lvl {
    return [[[[data_value objectForKey:VALUE_UPGRADE_COST] objectForKey:VALUE_UPGRADE_COST_DICES] valueForKey:[NSString stringWithFormat:@"%d", lvl]] intValue];
}

- (int) getUpgradeCostOfEquipmentLvl:(Lvl)lvl {
    return [[[[data_value objectForKey:VALUE_UPGRADE_COST] objectForKey:VALUE_UPGRADE_COST_EQUIPMENT] valueForKey:[NSString stringWithFormat:@"%d", lvl]] intValue];
}

- (int) getXpForLvl:(Lvl)lvl {
    return [[[data_value objectForKey:VALUE_XP_FOR_LVL] valueForKey:[NSString stringWithFormat:@"%d", lvl]] intValue];
}

- (int) getNumOfDicesForLvl:(Lvl)lvl {
    return [[[data_value objectForKey:VALUE_DICE_NUM] valueForKey:[NSString stringWithFormat:@"%d", lvl]] intValue];
}

- (float) getDifficultyForStage:(StageType)stage {
    return [[[data_value objectForKey:VALUE_DIFFICULTY] valueForKey:[NSString stringWithFormat:@"%d", stage]] floatValue];
}

- (NSArray *) getComboForUnit:(KnightType)type forSkill:(SkillType)skill {
    return [[data_value objectForKey:VALUE_COMBO_FOR_UNIT_TYPE] objectForKey:[NSString stringWithFormat:@"%d_%d", type, skill]];
}

- (NSArray *) getBaseStatsForUnit:(KnightType)type {
    return [[data_value objectForKey:VALUE_BASE_STATS_ALLIES] objectForKey:[NSString stringWithFormat:@"%d", type]];
}

- (int) getBaseHpForUnit:(KnightType)type {
    return [[[data_value objectForKey:VALUE_BASE_HP_ALLIES] valueForKey:[NSString stringWithFormat:@"%d", type]] intValue];
}

- (NSArray *) getBaseStatsForEnemy:(MonsterType)type {
    return [[data_value objectForKey:VALUE_BASE_STATS_ENEMIES] objectForKey:[NSString stringWithFormat:@"%d", type]];
}

- (int) getBaseHpForEnemy:(MonsterType)type {
    return [[[data_value objectForKey:VALUE_BASE_HP_ENEMIES] valueForKey:[NSString stringWithFormat:@"%d", type]] intValue];
}

- (int) getWavesForStage:(StageType)stage {
    return [[[data_value objectForKey:VALUE_STAGE_NUM_OF_WAVES] valueForKey:[NSString stringWithFormat:@"%d", stage]] intValue];
}

- (int) getMonsterLvlForStage:(StageType)stage ofLevel:(LevelType)level {
    return [[[[data_value objectForKey:VALUE_STAGE_MONSTER_LVL] objectForKey:[NSString stringWithFormat:@"%d", level]] valueForKey:[NSString stringWithFormat:@"%d", stage]] intValue];
}









- (Rectangle *) getInterfaceScrollRect {
    Vector2 *position = [self getPositionDataForKey:POSITION_INTERFACE_SCROLL_BACKGOUND];
    MetaData *meta = [self getMetaDataForKey:META_INTERFACE_SCROLL];
    
    return [Rectangle rectangleWithX:position.x y:position.y width:meta.width height:meta.height];
}

- (void) initialize {
    NSDictionary *data = [self loadData:DATA_CONSTANTS];
    
    // load data
    data_position = [[data objectForKey:POSITION_DATA] retain];
    data_value = [[data objectForKey:VALUE_DATA] retain];
    data_text = [[data objectForKey:TEXT_DATA] retain];
    data_meta = [[data objectForKey:META_DATA] retain];
}

- (NSDictionary *) loadData:(NSString *)file {
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}


/*
 MARK: PROGRESS FILE PATH
*/
+ (NSString*) progressFilePath {
    return @"KOTPTSave";
}

/*
 MARK: BACKGROUND SIZE
*/
+ (int) backgroundWidth {
    return 1024;
}

+ (int) battlefieldHeight {
    return 320;
}

+ (int) hudHeight {
    return 192;
}


/*
 MARK: ALLY ENTITY POSITIONS
*/
+ (int) positionXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 308;
        case SecondCombatPosition:
            return 256;
        case ThirdCombatPosition:
            return 152;
        case FourthCombatPosition:
            return 104;
        default:
            return -1;
    }
}

+ (int) positionYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 184;
        case SecondCombatPosition:
            return 248;
        case ThirdCombatPosition:
            return 184;
        case FourthCombatPosition:
            return 248;
        default:
            return -1;
    }
}


/*
 MARK: ALLY ENTITIES TOUCH AREAS
*/
+ (int) areaXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 324;
        case SecondCombatPosition:
            return 324;
        case ThirdCombatPosition:
            return 12;
        case FourthCombatPosition:
            return 12;
        default:
            return -1;
    }
}

+ (int) areaYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 12 + [self battlefieldHeight];
        case SecondCombatPosition:
            return 100 + [self battlefieldHeight];
        case ThirdCombatPosition:
            return 12 + [self battlefieldHeight];
        case FourthCombatPosition:
            return 100 + [self battlefieldHeight];
        default:
            return -1;
    }
}

+ (int) allyAreaWidth {
    return 304;
}

+ (int) allyAreaHeight {
    return 80;
}


/*
 MARK: ALLY ENTITY COMBO TOUCH AREAS
*/
+ (int) comboAreaXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 416;
        case SecondCombatPosition:
            return 416;
        case ThirdCombatPosition:
            return 104;
        case FourthCombatPosition:
            return 104;
        default:
            return -1;
    }
}

+ (int) comboAreaYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 20 + [self battlefieldHeight];
        case SecondCombatPosition:
            return 108 + [self battlefieldHeight];
        case ThirdCombatPosition:
            return 20 + [self battlefieldHeight];
        case FourthCombatPosition:
            return 108 + [self battlefieldHeight];
        default:
            return -1;
    }
}

+ (int) comboAreaWidth {
    return 152;
}

+ (int) comboAreaHeight {
    return 32;
}


/*
 MARK: SEPARATE COMBO AREAS
*/
+ (int) comboAreaXOfAlly:(CombatPosition)theAlly atPosition:(ComboItem)theItem {
    switch (theAlly) {
        case FirstCombatPosition:
            switch (theItem) {
                case FirstComboItem:
                    return 420;
                case SecondComboItem:
                    return 460;
                case ThirdComboItem:
                    return 500;
                case FourthComboItem:
                    return 540;
                default:
                    return -1;
            }
        case SecondCombatPosition:
            switch (theItem) {
                case FirstComboItem:
                    return 420;
                case SecondComboItem:
                    return 460;
                case ThirdComboItem:
                    return 500;
                case FourthComboItem:
                    return 540;
                default:
                    return -1;
            }
        case ThirdCombatPosition:
            switch (theItem) {
                case FirstComboItem:
                    return 108;
                case SecondComboItem:
                    return 148;
                case ThirdComboItem:
                    return 188;
                case FourthComboItem:
                    return 228;
                default:
                    return -1;
            }
        case FourthCombatPosition:
            switch (theItem) {
                case FirstComboItem:
                    return 108;
                case SecondComboItem:
                    return 148;
                case ThirdComboItem:
                    return 188;
                case FourthComboItem:
                    return 228;
                default:
                    return -1;
            }
        default:
            return -1;
    }
}

+ (int) comboAreaYOfAlly:(CombatPosition)theAlly atPosition:(ComboItem)theItem {
    switch (theAlly) {
        case FirstCombatPosition:
            return 24 + [self battlefieldHeight];
        case SecondCombatPosition:
            return 112 + [self battlefieldHeight];
        case ThirdCombatPosition:
            return 24 + [self battlefieldHeight];
        case FourthCombatPosition:
            return 112 + [self battlefieldHeight];
        default:
            return -1;
    }
}

+ (int) separateComboAreaSize {
    return 24;
}


/*
 MARK: ALLY HP POOL
*/
+ (int) hpPoolXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 456;
        case SecondCombatPosition:
            return 456;
        case ThirdCombatPosition:
            return 144;
        case FourthCombatPosition:
            return 144;
        default:
            return -1;
    }
}

+ (int) hpPoolYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 68 + [self battlefieldHeight];
        case SecondCombatPosition:
            return 156 + [self battlefieldHeight];
        case ThirdCombatPosition:
            return 68 + [self battlefieldHeight];
        case FourthCombatPosition:
            return 156 + [self battlefieldHeight];
        default:
            return -1;
    }
}

+ (int) hpPoolWidth {
    return 108;
}

+ (int) hpPoolHeight {
    return 12;
}


/*
 MARK: ALLY ENTITY PORTRAIT AREAS
*/
+ (int) portraitXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 340;
        case SecondCombatPosition:
            return 340;
        case ThirdCombatPosition:
            return 28;
        case FourthCombatPosition:
            return 28;
        default:
            return -1;
    }
}

+ (int) portraitYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 24 + [self battlefieldHeight];
        case SecondCombatPosition:
            return 112 + [self battlefieldHeight];
        case ThirdCombatPosition:
            return 24 + [self battlefieldHeight];
        case FourthCombatPosition:
            return 112 + [self battlefieldHeight];
        default:
            return -1;
    }
}

+ (int) portraitSize {
    return 56;
}


/*
 MARK: ALLY ENTITY SKILL AREAS
*/
+ (int) skillXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 584;
        case SecondCombatPosition:
            return 584;
        case ThirdCombatPosition:
            return 272;
        case FourthCombatPosition:
            return 272;
        default:
            return -1;
    }
}

+ (int) skillYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 36 + [self battlefieldHeight];
        case SecondCombatPosition:
            return 124 + [self battlefieldHeight];
        case ThirdCombatPosition:
            return 36 + [self battlefieldHeight];
        case FourthCombatPosition:
            return 124 + [self battlefieldHeight];
        default:
            return -1;
    }
}

+ (int) skillSize {
    return 32;
}

/*
 MARK: DICEPOOL BOUNDS
*/
+ (int) dicepoolLeftWall {
    return 647;
}

+ (int) dicepoolRightWall {
    return 1004;
}

+ (int) dicepoolUpWall {
    return 19 + [self battlefieldHeight];
}

+ (int) dicepoolDownWall {
    return 172 + [self battlefieldHeight];
}


/*
 MARK: DAMAGE TYPE TYPING
*/
+ (DamageType) advantageOfDamageType:(DamageType)type {
    switch (type) {
        case DamageTypePhysical:
            return DamageTypeRanged;
        case DamageTypeRanged:
            return DamageTypeMagic;
        case DamageTypeMagic:
            return DamageTypePhysical;
            
        default:
            break;
    }
    
    return NoDamageType;
}

+ (DamageType) disadvantageOfDamageType:(DamageType)type {
    switch (type) {
        case DamageTypePhysical:
            return DamageTypeMagic;
        case DamageTypeRanged:
            return DamageTypePhysical;
        case DamageTypeMagic:
            return DamageTypeRanged;
            
        default:
            break;
    }
    
    return NoDamageType;
}


/*
 MARK: EXPERIENCE
*/
+ (int) requiredExpToLvlUp {
    return 500;
}

+ (int) expGainNormal {
    return 100;
}

+ (int) expGainElite {
    return 500;
}

+ (int) expGainBoss {
    return 1000;
}


/*
 MARK: SKILLS
*/
+ (int) maxSkillLevel {
    return 10;
}



/*
 MARK: KNIGHTS STAT VALUES
*/

/*
 MARK: BRAWLER STATS
*/
+ (int) brawlerHealthPoints {
    return 500;
}

+ (DamageType) brawlerDamageType {
    return DamageTypePhysical;
}

+ (int) brawlerValueOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 60;
        case Agility:
            return 60;
        case Defence:
            return 60;
        case Accuracy:
            return 60;
        case Cunning:
            return 60;
        case Sturdiness:
            return 60;
        default:
            return -1;
    }
}

+ (int) brawlerGainMarginOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 4;
        case Agility:
            return 4;
        case Defence:
            return 4;
        case Accuracy:
            return 4;
        case Cunning:
            return 4;
        case Sturdiness:
            return 4;
        default:
            return -1;
    }
}

//+ (SkillFunction) brawlerFunctionOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillFunctionDamage;
//        case FirstComboSkill:
//            return SkillFunctionDamage;
//        case SecondComboSkill:
//            return SkillFunctionDamage;
//        case ThirdComboSkill:
//            return SkillFunctionDamage;
//        default:
//            return SkillFunctionDamage;
//    }
//}

//+ (SkillRange) brawlerRangeOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillRangeMelee;
//        case FirstComboSkill:
//            return SkillRangeMelee;
//        case SecondComboSkill:
//            return SkillRangeMelee;
//        case ThirdComboSkill:
//            return SkillRangeMelee;
//        default:
//            return SkillRangeMelee;
//    }
//}

//+ (SkillTarget) brawlerTargetOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillTargetSingle;
//        case FirstComboSkill:
//            return SkillTargetSingle;
//        case SecondComboSkill:
//            return SkillTargetRow;
//        case ThirdComboSkill:
//            return SkillTargetAll;
//        default:
//            return SkillTargetSingle;
//    }
//}
//
//+ (SkillUseOn) brawlerUseOnSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillUseOnEnemy;
//        case FirstComboSkill:
//            return SkillUseOnEnemy;
//        case SecondComboSkill:
//            return SkillUseOnEnemy;
//        case ThirdComboSkill:
//            return SkillUseOnEnemy;
//        default:
//            return SkillUseOnEnemy;
//    }
//}

+ (float) brawlerDamageOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 1.5f;
        case FirstComboSkill:
            return 1.5f;
        case SecondComboSkill:
            return 1.5f;
        case ThirdComboSkill:
            return 1.5f;
        default:
            return -1;
    }
}

+ (float) brawlerGainMarginOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 10;
        case FirstComboSkill:
            return 10;
        case SecondComboSkill:
            return 10;
        case ThirdComboSkill:
            return 10;
        default:
            return -1;
    }
}


/*
 MARK: BOWMAN STATS
 */
+ (int) bowmanHealthPoints {
    return 500;
}

+ (DamageType) bowmanDamageType {
    return DamageTypeRanged;
}

+ (int) bowmanValueOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 60;
        case Agility:
            return 60;
        case Defence:
            return 60;
        case Accuracy:
            return 60;
        case Cunning:
            return 60;
        case Sturdiness:
            return 60;
        default:
            return -1;
    }
}

+ (int) bowmanGainMarginOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 4;
        case Agility:
            return 4;
        case Defence:
            return 4;
        case Accuracy:
            return 4;
        case Cunning:
            return 4;
        case Sturdiness:
            return 4;
        default:
            return -1;
    }
}

//+ (SkillFunction) bowmanFunctionOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillFunctionDamage;
//        case FirstComboSkill:
//            return SkillFunctionDamage;
//        case SecondComboSkill:
//            return SkillFunctionDamage;
//        case ThirdComboSkill:
//            return SkillFunctionDamage;
//        default:
//            return SkillFunctionDamage;
//    }
//}
//
//+ (SkillRange) bowmanRangeOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillRangeRanged;
//        case FirstComboSkill:
//            return SkillRangeRanged;
//        case SecondComboSkill:
//            return SkillRangeRanged;
//        case ThirdComboSkill:
//            return SkillRangeRanged;
//        default:
//            return SkillRangeRanged;
//    }
//}
//
//+ (SkillTarget) bowmanTargetOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillTargetSingle;
//        case FirstComboSkill:
//            return SkillTargetSingle;
//        case SecondComboSkill:
//            return SkillTargetRow;
//        case ThirdComboSkill:
//            return SkillTargetAll;
//        default:
//            return SkillTargetSingle;
//    }
//}
//
//+ (SkillUseOn) bowmanUseOnSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillUseOnEnemy;
//        case FirstComboSkill:
//            return SkillUseOnEnemy;
//        case SecondComboSkill:
//            return SkillUseOnEnemy;
//        case ThirdComboSkill:
//            return SkillUseOnEnemy;
//        default:
//            return SkillUseOnEnemy;
//    }
//}

+ (float) bowmanDamageOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 1.5f;
        case FirstComboSkill:
            return 1.5f;
        case SecondComboSkill:
            return 1.5f;
        case ThirdComboSkill:
            return 1.5f;
        default:
            return -1;
    }
}

+ (float) bowmanGainMarginOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 10;
        case FirstComboSkill:
            return 10;
        case SecondComboSkill:
            return 10;
        case ThirdComboSkill:
            return 10;
        default:
            return -1;
    }
}


/*
 MARK: PALADIN STATS
 */
+ (int) paladinHealthPoints {
    return 500;
}

+ (DamageType) paladinDamageType {
    return DamageTypePhysical;
}

+ (int) paladinValueOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 60;
        case Agility:
            return 60;
        case Defence:
            return 60;
        case Accuracy:
            return 60;
        case Cunning:
            return 60;
        case Sturdiness:
            return 60;
        default:
            return -1;
    }
}

+ (int) paladinGainMarginOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 4;
        case Agility:
            return 4;
        case Defence:
            return 4;
        case Accuracy:
            return 4;
        case Cunning:
            return 4;
        case Sturdiness:
            return 4;
        default:
            return -1;
    }
}

//+ (SkillFunction) paladinFunctionOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillFunctionDamage;
//        case FirstComboSkill:
//            return SkillFunctionDamage;
//        case SecondComboSkill:
//            return SkillFunctionDamage;
//        case ThirdComboSkill:
//            return SkillFunctionDamage;
//        default:
//            return SkillFunctionDamage;
//    }
//}
//
//+ (SkillRange) paladinRangeOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillRangeMelee;
//        case FirstComboSkill:
//            return SkillRangeMelee;
//        case SecondComboSkill:
//            return SkillRangeMelee;
//        case ThirdComboSkill:
//            return SkillRangeMelee;
//        default:
//            return SkillRangeMelee;
//    }
//}
//
//+ (SkillTarget) paladinTargetOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillTargetSingle;
//        case FirstComboSkill:
//            return SkillTargetRow;
//        case SecondComboSkill:
//            return SkillTargetSingle;
//        case ThirdComboSkill:
//            return SkillTargetAll;
//        default:
//            return SkillTargetSingle;
//    }
//}
//
//+ (SkillUseOn) paladinUseOnSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillUseOnEnemy;
//        case FirstComboSkill:
//            return SkillUseOnEnemy;
//        case SecondComboSkill:
//            return SkillUseOnEnemy;
//        case ThirdComboSkill:
//            return SkillUseOnEnemy;
//        default:
//            return SkillUseOnEnemy;
//    }
//}

+ (float) paladinDamageOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 1.5f;
        case FirstComboSkill:
            return 1.5f;
        case SecondComboSkill:
            return 1.5f;
        case ThirdComboSkill:
            return 1.5f;
        default:
            return -1;
    }
}

+ (float) paladinGainMarginOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 10;
        case FirstComboSkill:
            return 10;
        case SecondComboSkill:
            return 10;
        case ThirdComboSkill:
            return 10;
        default:
            return -1;
    }
}




/*
 MARK: FIRE ENCHANTRESS STATS
 */
+ (int) fireEnchantressHealthPoints {
    return 600;
}

+ (DamageType) fireEnchantressDamageType {
    return DamageTypeMagic;
}

+ (int) fireEnchantressValueOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 60;
        case Agility:
            return 60;
        case Defence:
            return 60;
        case Accuracy:
            return 60;
        case Cunning:
            return 60;
        case Sturdiness:
            return 60;
        default:
            return -1;
    }
}

+ (int) fireEnchantressGainMarginOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 4;
        case Agility:
            return 4;
        case Defence:
            return 4;
        case Accuracy:
            return 4;
        case Cunning:
            return 4;
        case Sturdiness:
            return 4;
        default:
            return -1;
    }
}

//+ (SkillFunction) fireEnchantressFunctionOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillFunctionDamage;
//        case FirstComboSkill:
//            return SkillFunctionDamage;
//        case SecondComboSkill:
//            return SkillFunctionDamage;
//        case ThirdComboSkill:
//            return SkillFunctionDamage;
//        default:
//            return SkillFunctionDamage;
//    }
//}

//+ (SkillRange) fireEnchantressRangeOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillRangeRanged;
//        case FirstComboSkill:
//            return SkillRangeRanged;
//        case SecondComboSkill:
//            return SkillRangeRanged;
//        case ThirdComboSkill:
//            return SkillRangeRanged;
//        default:
//            return SkillRangeRanged;
//    }
//}
//
//+ (SkillTarget) fireEnchantressTargetOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillTargetSingle;
//        case FirstComboSkill:
//            return SkillTargetSingle;
//        case SecondComboSkill:
//            return SkillTargetRow;
//        case ThirdComboSkill:
//            return SkillTargetAll;
//        default:
//            return SkillTargetSingle;
//    }
//}
//
//+ (SkillUseOn) fireEnchantressUseOnSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillUseOnEnemy;
//        case FirstComboSkill:
//            return SkillUseOnEnemy;
//        case SecondComboSkill:
//            return SkillUseOnEnemy;
//        case ThirdComboSkill:
//            return SkillUseOnEnemy;
//        default:
//            return SkillUseOnEnemy;
//    }
//}

+ (float) fireEnchantressDamageOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 1.5f;
        case FirstComboSkill:
            return 1.5f;
        case SecondComboSkill:
            return 1.5f;
        case ThirdComboSkill:
            return 1.5f;
        default:
            return -1;
    }
}

+ (float) fireEnchantressGainMarginOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 10;
        case FirstComboSkill:
            return 10;
        case SecondComboSkill:
            return 10;
        case ThirdComboSkill:
            return 10;
        default:
            return -1;
    }
}



/*
 MARK: MONSTERS STAT VALUES
 */

/*
 MARK: MONSTER WARRIOR STAT VALUES
 */
+ (int) enemyWarriorHealthPoints {
    return 300;
}

+ (DamageType) enemyWarriorDamageType {
    return DamageTypePhysical;
}

+ (int) enemyWarriorValueOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 30;
        case Agility:
            return 30;
        case Defence:
            return 30;
        case Accuracy:
            return 30;
        case Cunning:
            return 30;
        case Sturdiness:
            return 30;
        default:
            return -1;
    }
}

+ (int) enemyWarriorGainMarginOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 4;
        case Agility:
            return 4;
        case Defence:
            return 4;
        case Accuracy:
            return 4;
        case Cunning:
            return 4;
        case Sturdiness:
            return 4;
        default:
            return -1;
    }
}

//+ (SkillFunction) enemyWarriorFunctionOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillFunctionDamage;
//        case FirstComboSkill:
//            return SkillFunctionDamage;
//        case SecondComboSkill:
//            return SkillFunctionDamage;
//        case ThirdComboSkill:
//            return SkillFunctionDamage;
//        default:
//            return SkillFunctionDamage;
//    }
//}
//
//+ (SkillRange) enemyWarriorRangeOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillRangeMelee;
//        case FirstComboSkill:
//            return SkillRangeMelee;
//        case SecondComboSkill:
//            return SkillRangeMelee;
//        case ThirdComboSkill:
//            return SkillRangeMelee;
//        default:
//            return SkillRangeMelee;
//    }
//}
//
//+ (SkillTarget) enemyWarriorTargetOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillTargetSingle;
//        case FirstComboSkill:
//            return SkillTargetSingle;
//        case SecondComboSkill:
//            return SkillTargetSingle;
//        case ThirdComboSkill:
//            return SkillTargetRow;
//        default:
//            return SkillTargetSingle;
//    }
//}
//
//+ (SkillUseOn) enemyWarriorUseOnSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillUseOnEnemy;
//        case FirstComboSkill:
//            return SkillUseOnEnemy;
//        case SecondComboSkill:
//            return SkillUseOnEnemy;
//        case ThirdComboSkill:
//            return SkillUseOnEnemy;
//        default:
//            return SkillUseOnEnemy;
//    }
//}

+ (float) enemyWarriorDamageOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 0.8f;
        case FirstComboSkill:
            return 0.8f;
        case SecondComboSkill:
            return 0.8f;
        case ThirdComboSkill:
            return 0.8f;
        default:
            return -1;
    }
}

+ (float) enemyWarriorGainMarginOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 10;
        case FirstComboSkill:
            return 10;
        case SecondComboSkill:
            return 10;
        case ThirdComboSkill:
            return 10;
        default:
            return -1;
    }
}



/*
 MARK: MONSTER BRUTE STAT VALUES
 */
+ (int) enemyBruteHealthPoints {
    return 300;
}

+ (DamageType) enemyBruteDamageType {
    return DamageTypePhysical;
}

+ (int) enemyBruteValueOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 30;
        case Agility:
            return 30;
        case Defence:
            return 30;
        case Accuracy:
            return 30;
        case Cunning:
            return 30;
        case Sturdiness:
            return 30;
        default:
            return -1;
    }
}

+ (int) enemyBruteGainMarginOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 4;
        case Agility:
            return 4;
        case Defence:
            return 4;
        case Accuracy:
            return 4;
        case Cunning:
            return 4;
        case Sturdiness:
            return 4;
        default:
            return -1;
    }
}

//+ (SkillFunction) enemyBruteFunctionOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillFunctionDamage;
//        case FirstComboSkill:
//            return SkillFunctionDamage;
//        case SecondComboSkill:
//            return SkillFunctionDamage;
//        case ThirdComboSkill:
//            return SkillFunctionDamage;
//        default:
//            return SkillFunctionDamage;
//    }
//}
//
//+ (SkillRange) enemyBruteRangeOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillRangeMelee;
//        case FirstComboSkill:
//            return SkillRangeMelee;
//        case SecondComboSkill:
//            return SkillRangeMelee;
//        case ThirdComboSkill:
//            return SkillRangeMelee;
//        default:
//            return SkillRangeMelee;
//    }
//}
//
//+ (SkillTarget) enemyBruteTargetOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillTargetSingle;
//        case FirstComboSkill:
//            return SkillTargetSingle;
//        case SecondComboSkill:
//            return SkillTargetSingle;
//        case ThirdComboSkill:
//            return SkillTargetRow;
//        default:
//            return SkillTargetSingle;
//    }
//}
//
//+ (SkillUseOn) enemyBruteUseOnSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillUseOnEnemy;
//        case FirstComboSkill:
//            return SkillUseOnEnemy;
//        case SecondComboSkill:
//            return SkillUseOnEnemy;
//        case ThirdComboSkill:
//            return SkillUseOnEnemy;
//        default:
//            return SkillUseOnEnemy;
//    }
//}

+ (float) enemyBruteDamageOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 0.8f;
        case FirstComboSkill:
            return 0.8f;
        case SecondComboSkill:
            return 0.8f;
        case ThirdComboSkill:
            return 0.8f;
        default:
            return -1;
    }
}

+ (float) enemyBruteGainMarginOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 10;
        case FirstComboSkill:
            return 10;
        case SecondComboSkill:
            return 10;
        case ThirdComboSkill:
            return 10;
        default:
            return -1;
    }
}



/*
 MARK: MONSTER VIKING STAT VALUES
 */
+ (int) enemyVikingHealthPoints {
    return 300;
}

+ (DamageType) enemyVikingDamageType {
    return DamageTypePhysical;
}

+ (int) enemyVikingValueOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 30;
        case Agility:
            return 30;
        case Defence:
            return 30;
        case Accuracy:
            return 30;
        case Cunning:
            return 30;
        case Sturdiness:
            return 30;
        default:
            return -1;
    }
}

+ (int) enemyVikingGainMarginOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 4;
        case Agility:
            return 4;
        case Defence:
            return 4;
        case Accuracy:
            return 4;
        case Cunning:
            return 4;
        case Sturdiness:
            return 4;
        default:
            return -1;
    }
}

//+ (SkillFunction) enemyVikingFunctionOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillFunctionDamage;
//        case FirstComboSkill:
//            return SkillFunctionDamage;
//        case SecondComboSkill:
//            return SkillFunctionDamage;
//        case ThirdComboSkill:
//            return SkillFunctionDamage;
//        default:
//            return SkillFunctionDamage;
//    }
//}
//
//+ (SkillRange) enemyVikingRangeOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillRangeMelee;
//        case FirstComboSkill:
//            return SkillRangeMelee;
//        case SecondComboSkill:
//            return SkillRangeMelee;
//        case ThirdComboSkill:
//            return SkillRangeMelee;
//        default:
//            return SkillRangeMelee;
//    }
//}
//
//+ (SkillTarget) enemyVikingTargetOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillTargetSingle;
//        case FirstComboSkill:
//            return SkillTargetSingle;
//        case SecondComboSkill:
//            return SkillTargetSingle;
//        case ThirdComboSkill:
//            return SkillTargetRow;
//        default:
//            return SkillTargetSingle;
//    }
//}
//
//+ (SkillUseOn) enemyVikingUseOnSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillUseOnEnemy;
//        case FirstComboSkill:
//            return SkillUseOnEnemy;
//        case SecondComboSkill:
//            return SkillUseOnEnemy;
//        case ThirdComboSkill:
//            return SkillUseOnEnemy;
//        default:
//            return SkillUseOnEnemy;
//    }
//}

+ (float) enemyVikingDamageOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 0.8f;
        case FirstComboSkill:
            return 0.8f;
        case SecondComboSkill:
            return 0.8f;
        case ThirdComboSkill:
            return 0.8f;
        default:
            return -1;
    }
}

+ (float) enemyVikingGainMarginOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 10;
        case FirstComboSkill:
            return 10;
        case SecondComboSkill:
            return 10;
        case ThirdComboSkill:
            return 10;
        default:
            return -1;
    }
}




/*
 MARK: MONSTER BOSS KNIGHT STAT VALUES
 */
+ (int) enemyBossKnightHealthPoints {
    return 300;
}

+ (DamageType) enemyBossKnightDamageType {
    return DamageTypePhysical;
}

+ (int) enemyBossKnightValueOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 30;
        case Agility:
            return 30;
        case Defence:
            return 30;
        case Accuracy:
            return 30;
        case Cunning:
            return 30;
        case Sturdiness:
            return 30;
        default:
            return -1;
    }
}

+ (int) enemyBossKnightGainMarginOfStat:(StatType)stat {
    switch (stat) {
        case Strength:
            return 4;
        case Agility:
            return 4;
        case Defence:
            return 4;
        case Accuracy:
            return 4;
        case Cunning:
            return 4;
        case Sturdiness:
            return 4;
        default:
            return -1;
    }
}

//+ (SkillFunction) enemyBossKnightFunctionOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillFunctionDamage;
//        case FirstComboSkill:
//            return SkillFunctionDamage;
//        case SecondComboSkill:
//            return SkillFunctionDamage;
//        case ThirdComboSkill:
//            return SkillFunctionDamage;
//        default:
//            return SkillFunctionDamage;
//    }
//}
//
//+ (SkillRange) enemyBossKnightRangeOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillRangeMelee;
//        case FirstComboSkill:
//            return SkillRangeMelee;
//        case SecondComboSkill:
//            return SkillRangeMelee;
//        case ThirdComboSkill:
//            return SkillRangeMelee;
//        default:
//            return SkillRangeMelee;
//    }
//}
//
//+ (SkillTarget) enemyBossKnightTargetOfSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillTargetSingle;
//        case FirstComboSkill:
//            return SkillTargetRow;
//        case SecondComboSkill:
//            return SkillTargetRow;
//        case ThirdComboSkill:
//            return SkillTargetAll;
//        default:
//            return SkillTargetSingle;
//    }
//}
//
//+ (SkillUseOn) enemyBossKnightUseOnSkill:(SkillType)skill {
//    switch (skill) {
//        case BasicAttack:
//            return SkillUseOnEnemy;
//        case FirstComboSkill:
//            return SkillUseOnEnemy;
//        case SecondComboSkill:
//            return SkillUseOnEnemy;
//        case ThirdComboSkill:
//            return SkillUseOnEnemy;
//        default:
//            return SkillUseOnEnemy;
//    }
//}

+ (float) enemyBossKnightDamageOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 0.8f;
        case FirstComboSkill:
            return 0.8f;
        case SecondComboSkill:
            return 0.8f;
        case ThirdComboSkill:
            return 0.8f;
        default:
            return -1;
    }
}

+ (float) enemyBossKnightGainMarginOfSkill:(SkillType)skill {
    switch (skill) {
        case BasicAttack:
            return 10;
        case FirstComboSkill:
            return 10;
        case SecondComboSkill:
            return 10;
        case ThirdComboSkill:
            return 10;
        default:
            return -1;
    }
}





/*
 MARK: ANIMATION PARAMETERS
*/

/*
 MARK: ALLIES
*/
+ (int) spritesheetWidthOfAlly:(KnightType)ally {
    switch (ally) {
        case KnightTypeBrawler:
            return 8;
            
        case KnightTypeLongbowman:
            return 8;
        
        case KnightTypePaladin:
            return 8;
            
        case KnightTypeWizard:
            return 8;
            
        default:
            break;
    }
    
    return -1;
}

+ (int) frameWidthOfAnimation:(AnimationType)type ally:(KnightType)ally {
    switch (ally) {
        // BRAWLER
        case KnightTypeBrawler:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
        // BOWMAN
        case KnightTypeLongbowman:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
        // PALADIN
        case KnightTypePaladin:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
            
        // FIRE ENCHANTRESS
        case KnightTypeWizard:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return -1;
}

+ (int) frameHeightOfAnimation:(AnimationType)type ally:(KnightType)ally {
    switch (ally) {
        // BRAWLER
        case KnightTypeBrawler:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
        // BOWMAN
        case KnightTypeLongbowman:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
        // PALADIN
        case KnightTypePaladin:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
            
        // FIRE ENCHANTRESS
        case KnightTypeWizard:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return -1;
}

+ (int) framePositionForAnimation:(AnimationType)type ally:(KnightType)ally {
    switch (ally) {
        // BRAWLER
        case KnightTypeBrawler:
            switch (type) {
                case AnimationTypeIdle:
                    return 6;
                    
                case AnimationTypeMove:
                    return 14;
                    
                case AnimationTypeHit:
                    return 20;
                    
                case AnimationTypeDeath:
                    return 31;
                    
                case AnimationTypeAttack:
                    return 37;
                    
                default:
                    break;
            }
            break;
        // BOWMAN
        case KnightTypeLongbowman:
            switch (type) {
                case AnimationTypeIdle:
                    return 6;
                    
                case AnimationTypeMove:
                    return 14;
                    
                case AnimationTypeHit:
                    return 20;
                    
                case AnimationTypeDeath:
                    return 31;
                    
                case AnimationTypeAttack:
                    return 37;
                    
                default:
                    break;
            }
            break;
        // PALADIN
        case KnightTypePaladin:
            switch (type) {
                case AnimationTypeIdle:
                    return 6;
                    
                case AnimationTypeMove:
                    return 14;
                    
                case AnimationTypeHit:
                    return 20;
                    
                case AnimationTypeDeath:
                    return 31;
                    
                case AnimationTypeAttack:
                    return 36;
                    
                default:
                    break;
            }
            break;
            
        // FIRE ENCHANTRESS
        case KnightTypeWizard:
            switch (type) {
                case AnimationTypeIdle:
                    return 6;
                    
                case AnimationTypeMove:
                    return 6;
                    
                case AnimationTypeHit:
                    return 12;
                    
                case AnimationTypeDeath:
                    return 23;
                    
                case AnimationTypeAttack:
                    return 34;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return -1;
}

+ (int) numFramesInAnimation:(AnimationType)type ally:(KnightType)ally {
    switch (ally) {
        // BRAWLER
        case KnightTypeBrawler:
            switch (type) {
                case AnimationTypeIdle:
                    return 6;
                    
                case AnimationTypeMove:
                    return 8;
                    
                case AnimationTypeHit:
                    return 6;
                    
                case AnimationTypeDeath:
                    return 11;
                    
                case AnimationTypeAttack:
                    return 6;
                    
                default:
                    break;
            }
            break;
        // BOWMAN
        case KnightTypeLongbowman:
            switch (type) {
                case AnimationTypeIdle:
                    return 6;
                    
                case AnimationTypeMove:
                    return 8;
                    
                case AnimationTypeHit:
                    return 6;
                    
                case AnimationTypeDeath:
                    return 11;
                    
                case AnimationTypeAttack:
                    return 6;
                    
                default:
                    break;
            }
            break;
        // PALADIN
        case KnightTypePaladin:
            switch (type) {
                case AnimationTypeIdle:
                    return 6;
                    
                case AnimationTypeMove:
                    return 8;
                    
                case AnimationTypeHit:
                    return 6;
                    
                case AnimationTypeDeath:
                    return 11;
                    
                case AnimationTypeAttack:
                    return 5;
                    
                default:
                    break;
            }
            break;
            
        // FIRE ENCHANTRESS
        case KnightTypeWizard:
            switch (type) {
                case AnimationTypeIdle:
                    return 6;
                    
                case AnimationTypeMove:
                    return 1;
                    
                case AnimationTypeHit:
                    return 6;
                    
                case AnimationTypeDeath:
                    return 11;
                    
                case AnimationTypeAttack:
                    return 11;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return -1;
}

+ (float) durationOfAnimation:(AnimationType)type ally:(KnightType)ally {
    switch (ally) {
        // BRAWLER
        case KnightTypeBrawler:
            switch (type) {
                case AnimationTypeIdle:
                    return 0.5f;
                    
                case AnimationTypeMove:
                    return 0.5f;
                    
                case AnimationTypeHit:
                    return 0.4f;
                    
                case AnimationTypeDeath:
                    return 1;
                    
                case AnimationTypeAttack:
                    return 1;
                    
                default:
                    break;
            }
            break;
        // BOWMAN
        case KnightTypeLongbowman:
            switch (type) {
                case AnimationTypeIdle:
                    return 0.5f;
                    
                case AnimationTypeMove:
                    return 0.5f;
                    
                case AnimationTypeHit:
                    return 0.4f;
                    
                case AnimationTypeDeath:
                    return 1;
                    
                case AnimationTypeAttack:
                    return 1;
                    
                default:
                    break;
            }
            break;
        // PALADIN
        case KnightTypePaladin:
            switch (type) {
                case AnimationTypeIdle:
                    return 0.5f;
                    
                case AnimationTypeMove:
                    return 0.5f;
                    
                case AnimationTypeHit:
                    return 0.4f;
                    
                case AnimationTypeDeath:
                    return 1;
                    
                case AnimationTypeAttack:
                    return 1;
                    
                default:
                    break;
            }
            break;
            
        // FIRE ENCHANTRESS
        case KnightTypeWizard:
            switch (type) {
                case AnimationTypeIdle:
                    return 0.5f;
                    
                case AnimationTypeMove:
                    return 0.5f;
                    
                case AnimationTypeHit:
                    return 0.4f;
                    
                case AnimationTypeDeath:
                    return 1;
                    
                case AnimationTypeAttack:
                    return 1;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return -1;
}


/*
 MARK: ENEMIES
 */
+ (int) spritesheetWidthOfEnemy:(MonsterType)enemy {
    switch (enemy) {
        case MonsterTypeWarrior:
            return 8;
            
        case MonsterTypeBrute:
            return 8;
            
        case MonsterTypeBossViking:
            return 8;
            
        default:
            break;
    }
    
    return -1;
}

+ (int) frameWidthOfAnimation:(AnimationType)type enemy:(MonsterType)enemy {
    switch (enemy) {
        // WARRIOR
        case MonsterTypeWarrior:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
        // BRUTE
        case MonsterTypeBrute:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
        // VIKING
        case MonsterTypeBossViking:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return -1;
}

+ (int) frameHeightOfAnimation:(AnimationType)type enemy:(MonsterType)enemy {
    switch (enemy) {
        // WARRIOR
        case MonsterTypeWarrior:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
        // BRUTE
        case MonsterTypeBrute:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
        // VIKING
        case MonsterTypeBossViking:
            switch (type) {
                case AnimationTypeIdle:
                    return 64;
                    
                case AnimationTypeMove:
                    return 64;
                    
                case AnimationTypeHit:
                    return 64;
                    
                case AnimationTypeDeath:
                    return 64;
                    
                case AnimationTypeAttack:
                    return 64;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return -1;
}

+ (int) framePositionForAnimation:(AnimationType)type enemy:(MonsterType)enemy {
    switch (enemy) {
        // WARRIOR
        case MonsterTypeWarrior:
            switch (type) {
                case AnimationTypeIdle:
                    return 4;
                    
                case AnimationTypeMove:
                    return 12;
                    
                case AnimationTypeHit:
                    return 16;
                    
                case AnimationTypeDeath:
                    return 39;
                    
                case AnimationTypeAttack:
                    return 47;
                    
                default:
                    break;
            }
            break;
        // BRUTE
        case MonsterTypeBrute:
            switch (type) {
                case AnimationTypeIdle:
                    return 6;
                    
                case AnimationTypeMove:
                    return 14;
                    
                case AnimationTypeHit:
                    return 18;
                    
                case AnimationTypeDeath:
                    return 37;
                    
                case AnimationTypeAttack:
                    return 47;
                    
                default:
                    break;
            }
            break;
        // VIKING
        case MonsterTypeBossViking:
            switch (type) {
                case AnimationTypeIdle:
                    return 4;
                    
                case AnimationTypeMove:
                    return 12;
                    
                case AnimationTypeHit:
                    return 17;
                    
                case AnimationTypeDeath:
                    return 34;
                    
                case AnimationTypeAttack:
                    return 45;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return -1;
}

+ (int) numFramesInAnimation:(AnimationType)type enemy:(MonsterType)enemy {
    switch (enemy) {
        // WARRIOR
        case MonsterTypeWarrior:
            switch (type) {
                case AnimationTypeIdle:
                    return 4;
                    
                case AnimationTypeMove:
                    return 8;
                    
                case AnimationTypeHit:
                    return 4;
                    
                case AnimationTypeDeath:
                    return 23;
                    
                case AnimationTypeAttack:
                    return 8;
                    
                default:
                    break;
            }
            break;
        // BRUTE
        case MonsterTypeBrute:
            switch (type) {
                case AnimationTypeIdle:
                    return 6;
                    
                case AnimationTypeMove:
                    return 8;
                    
                case AnimationTypeHit:
                    return 4;
                    
                case AnimationTypeDeath:
                    return 19;
                    
                case AnimationTypeAttack:
                    return 10;
                    
                default:
                    break;
            }
            break;
        // VIKING
        case MonsterTypeBossViking:
            switch (type) {
                case AnimationTypeIdle:
                    return 4;
                    
                case AnimationTypeMove:
                    return 8;
                    
                case AnimationTypeHit:
                    return 5;
                    
                case AnimationTypeDeath:
                    return 17;
                    
                case AnimationTypeAttack:
                    return 11;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return -1;
}

+ (float) durationOfAnimation:(AnimationType)type enemy:(MonsterType)enemy {
    switch (enemy) {
        // WARRIOR
        case MonsterTypeWarrior:
            switch (type) {
                case AnimationTypeIdle:
                    return 0.7f;
                    
                case AnimationTypeMove:
                    return 0.7f;
                    
                case AnimationTypeHit:
                    return 0.4f;
                    
                case AnimationTypeDeath:
                    return 2;
                    
                case AnimationTypeAttack:
                    return 1;
                    
                default:
                    break;
            }
            break;
        // BRUTE
        case MonsterTypeBrute:
            switch (type) {
                case AnimationTypeIdle:
                    return 0.7f;
                    
                case AnimationTypeMove:
                    return 0.7f;
                    
                case AnimationTypeHit:
                    return 0.4f;
                    
                case AnimationTypeDeath:
                    return 2;
                    
                case AnimationTypeAttack:
                    return 1;
                    
                default:
                    break;
            }
            break;
        // VIKING
        case MonsterTypeBossViking:
            switch (type) {
                case AnimationTypeIdle:
                    return 0.7f;
                    
                case AnimationTypeMove:
                    return 0.7f;
                    
                case AnimationTypeHit:
                    return 0.4f;
                    
                case AnimationTypeDeath:
                    return 2;
                    
                case AnimationTypeAttack:
                    return 1;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return -1;
}




// MARK: interface
+ (NSString *) getSwitchButtonText:(BuildingType)type {
    switch (type) {
        case BuildingTypeCastle:
            return @"Castle";
            
        case BuildingTypeBarracks:
            return @"Barracks";
            
        case BuildingTypeTrainingYard:
            return @"Training yard";
            
        case BuildingTypeBlacksmith:
            return @"Blacksmith";
            
        case BuildingTypeWarbandCamp:
            return @"Warband camp";
            
        default:
            return nil;
    }
}



+ (int) getExpNeededForNextLvl:(int)lvl {
    return 1;
}


+ (int) getMaxKnightLvl {
    return 10;
}


@end
