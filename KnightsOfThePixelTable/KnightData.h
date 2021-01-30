//
//  KnightData.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 06/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

#import "EntityData.h"

NS_ASSUME_NONNULL_BEGIN

@interface KnightData : EntityData {
    NSString *keyID;
    
    KnightType type;
    NSString *name;
    NSString *character;
    
    CharacterType characterType;
    
    int currentExp;
    Lvl weaponLvl;
    int weaponBonus[StatTypes];
    Lvl armorLvl;
    int armorBonus[StatTypes];
    
    int fatigue;
}

@property (nonatomic, readonly) NSString *keyID;

@property (nonatomic, readonly) KnightType type;
@property (nonatomic, readonly) CharacterType characterType;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *character;

@property (nonatomic, readonly) int currentExp;
@property (nonatomic, readonly) Lvl weaponLvl;
@property (nonatomic, readonly) Lvl armorLvl;

@property (nonatomic, readonly) int fatigue;

- (id) initWithID:(NSString *)stringID type:(KnightType)knightType characterType:(CharacterType)charType name:(NSString *) knightName;

// DEBUG INIT
- (id) initWithID:(NSString *)stringID type:(KnightType)knightType characterType:(CharacterType)charType name:(NSString *)knightName level:(int)level currentExp:(int)exp weaponLvl:(int)wLevel armorLvl:(int)aLevel;

// GETTER METHODS
- (int) getLevelOfSkill:(SkillType)skill;
- (int) getWeaponBonusForStat:(StatType)stat;
- (int) getArmorBonusForStat:(StatType)stat;


// BOOL METHODS
- (BOOL) isSkillAtMaxLvl:(SkillType)skill;


// UPGRADE METHODS
- (void) gainXp:(int)amount;
- (void) upgradeSkill:(SkillType)skill;
- (void) upgradeWeaponWithBonus:(StatType)stat;
- (void) upgradeArmorWithBonus:(StatType)stat;


// UPDATE METHODS
- (void) updateStats;
- (void) decreaseFatigue;
- (void) increaseFatigue;


// DEBUG METHOD
- (void) setLevelOfSkill:(SkillType)skill lvl:(int)level;
- (void) setValueOfStat:(StatType)stat value:(int)value;

@end

NS_ASSUME_NONNULL_END
