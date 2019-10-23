//
//  KnightData.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 06/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "KnightData.h"

#import "Pixlron.Knights.h"

@implementation KnightData

- (id) initWithID:(NSString *)stringID type:(KnightType)knightType name:(NSString *)knightName {
    self = [super init];
    if (self != nil) {
        keyID = [stringID retain];
        
        type = knightType;
        name = [knightName retain];
        
        // init starting values
        lvl = 1;
        currentExp = 0;
        
        for (int i = 0; i < SkillTypes; i++) {
            skillLvl[i] = 1;
        }
        
        weaponLvl = 1;
        armorLvl = 1;
    }
    return self;
}


// DEBUG INIT
- (id) initWithID:(NSString *)stringID type:(KnightType)knightType name:(NSString *)knightName level:(int)level currentExp:(int)exp weaponLvl:(int)wLevel armorLvl:(int)aLevel {
    self = [super init];
    if (self != nil) {
        keyID = [stringID retain];
        
        type = knightType;
        name = [knightName retain];
        character = @"TODO";
        
        // init starting values
        lvl = level;
        currentExp = exp;
        
        for (int i = 0; i < SkillTypes; i++) {
            skillLvl[i] = 1;
        }
        
        for (int i = 0; i < StatTypes; i++) {
            stats[i] = 100;
            weaponBonus[i] = 0;
            armorBonus[i] = 0;
        }
        
        weaponLvl = wLevel;
        armorLvl = aLevel;
    }
    return self;
}

@synthesize keyID, type, name, lvl, currentExp, weaponLvl, armorLvl, characterType, damageType, hp, character;

- (int) getLevelOfSkill:(SkillType)skill {
    return skillLvl[skill];
}

- (int) getValueOfStat:(StatType)stat {
    return stats[stat];
}

- (int) getWeaponBonusForStat:(StatType)stat {
    return weaponBonus[stat];
}

- (int) getArmorBonusForStat:(StatType)stat {
    return armorBonus[stat];
}





- (BOOL) isSkillAtMaxLvl:(SkillType)skill {
    return skillLvl[skill] == [Constants getMaxSkillLvl];
}



- (void) gainXp:(int)amount {
    // check if reached max lvl
    if (lvl < [Constants getMaxKnightLvl]) {
        currentExp += amount;
        
        // check if leveled up
        int nextLvlExp = [Constants getExpNeededForNextLvl:lvl];
        if (currentExp >= nextLvlExp) {
            lvl++;
            currentExp -= nextLvlExp;
        }
    }
}

- (void) upgradeSkill:(SkillType)skill {
    if (skillLvl[skill] < [Constants getMaxSkillLvl])
        skillLvl[skill]++;
}

- (void) upgradeWeaponWithBonus:(StatType)stat {
    if (weaponLvl < [Constants getMaxEquipmentLvl]) {
        weaponLvl++;
        weaponBonus[stat]++;
    }
}

- (void) upgradeArmorWithBonus:(StatType)stat {
    if (armorLvl < [Constants getMaxEquipmentLvl]) {
        armorLvl++;
        armorBonus[stat]++;
    }
}


// DEBUG METHOD
- (void) setLevelOfSkill:(SkillType)skill lvl:(int)level {
    skillLvl[skill] = level;
}

- (void) setValueOfStat:(StatType)stat value:(int)value {
    stats[stat] = value;
}


- (void) dealloc {
    [keyID release];
    [name release];
    
    [super dealloc];
}

@end
