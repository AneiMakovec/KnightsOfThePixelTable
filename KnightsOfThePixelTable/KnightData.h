//
//  KnightData.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 06/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface KnightData : NSObject {
    NSString *keyID;
    
    KnightType type;
    NSString *name;
    
    DamageType damageType;
    CharacterType characterType;
    
    int hp;
    int lvl;
    int currentExp;
    int skillLvl[SkillTypes];
    int stats[StatTypes];
    int weaponLvl;
    int weaponBonus[StatTypes];
    int armorLvl;
    int armorBonus[StatTypes];
}

@property (nonatomic, readonly) NSString *keyID;
@property (nonatomic, readonly) KnightType type;
@property (nonatomic, readonly) DamageType damageType;
@property (nonatomic, readonly) CharacterType characterType;
@property (nonatomic, retain) NSString *name;

@property (nonatomic, readonly) int hp;
@property (nonatomic, readonly) int lvl;
@property (nonatomic, readonly) int currentExp;
@property (nonatomic, readonly) int weaponLvl;
@property (nonatomic, readonly) int armorLvl;

- (id) initWithID:(NSString *)stringID type:(KnightType)knightType name:(NSString *) knightName;

// DEBUG INIT
- (id) initWithID:(NSString *)stringID type:(KnightType)knightType name:(NSString *)knightName level:(int)level currentExp:(int)exp weaponLvl:(int)wLevel armorLvl:(int)aLevel;

// GETTER METHODS
- (int) getLevelOfSkill:(SkillType)skill;
- (int) getValueOfStat:(StatType)stat;
- (int) getWeaponBonusForStat:(StatType)stat;
- (int) getArmorBonusForStat:(StatType)stat;



// UPGRADE METHODS
- (void) gainXp:(int)amount;
- (void) upgradeSkill:(SkillType)skill;
- (void) upgradeWeaponWithBonus:(StatType)stat;
- (void) upgradeArmorWithBonus:(StatType)stat;


// DEBUG METHOD
- (void) setLevelOfSkill:(SkillType)skill lvl:(int)level;
- (void) setValueOfStat:(StatType)stat value:(int)value;

@end

NS_ASSUME_NONNULL_END
