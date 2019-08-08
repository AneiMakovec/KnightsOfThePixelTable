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
    
    int lvl;
    int currentExp;
    int skillLvl[SkillTypes];
    int weaponLvl;
    int armorLvl;
}

@property (nonatomic, readonly) NSString *keyID;
@property (nonatomic, readonly) KnightType type;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, readonly) int lvl;
@property (nonatomic, readonly) int currentExp;
@property (nonatomic, readonly) int weaponLvl;
@property (nonatomic, readonly) int armorLvl;

- (id) initWithID:(NSString *)stringID type:(KnightType)knightType name:(NSString *) knightName;

// DEBUG INIT
- (id) initWithID:(NSString *)stringID type:(KnightType)knightType name:(NSString *)knightName level:(int)level currentExp:(int)exp weaponLvl:(int)wLevel armorLvl:(int)aLevel;

- (void) gainExp:(int)amount;
- (void) upgradeSkill:(SkillType)skill;
- (int) getLevelOfSkill:(SkillType)skill;
- (void) upgradeWeapon;
- (void) upgradeArmor;


// DEBUG METHOD
- (void) setLevelOfSkill:(SkillType)skill lvl:(int)level;

@end

NS_ASSUME_NONNULL_END
