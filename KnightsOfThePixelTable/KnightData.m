//
//  KnightData.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 06/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "KnightData.h"

#import "Pixlron.Knights.h"

#define HP_MODIFIER 200

@implementation KnightData

- (id) initWithID:(NSString *)stringID type:(KnightType)knightType characterType:(CharacterType)charType name:(NSString *)knightName {
    self = [super init];
    if (self != nil) {
        keyID = [stringID retain];
        
        type = knightType;
        switch (type) {
            case KnightTypeBrawler:
                damageType = DamageTypePhysical;
                break;
                
            case KnightTypePaladin:
                damageType = DamageTypePhysical;
                break;
                
            case KnightTypeBard:
                damageType = DamageTypePhysical;
                break;
                
            case KnightTypeLongbowman:
                damageType = DamageTypeRanged;
                break;
                
            case KnightTypeCrossbowman:
                damageType = DamageTypeRanged;
                break;
                
            case KnightTypeScout:
                damageType = DamageTypeRanged;
                break;
                
            case KnightTypeBattlemage:
                damageType = DamageTypeMagic;
                break;
                
            case KnightTypeWizard:
                damageType = DamageTypeMagic;
                break;
                
            case KnightTypeMonk:
                damageType = DamageTypeMagic;
                break;
                
            default:
                break;
        }
        
        name = [knightName retain];
        
        characterType = charType;
        switch (characterType) {
            case CharacterTypeBrave:
                character = @"BRAVE";
                break;
                
            case CharacterTypeCalm:
                character = @"CALM";
                break;
                
            case CharacterTypeBold:
                character = @"BOLD";
                break;
                
            case CharacterTypePrepared:
                character = @"PREPARED";
                break;
            
            case CharacterTypeHasty:
                character = @"HASTY";
                break;
                
            case CharacterTypeCareful:
                character = @"CAREFUL";
                break;
                
            default:
                break;
        }
        
        // init starting values
        lvl = 1;
        currentExp = 0;
        
        for (int i = 0; i < SkillTypes; i++) {
            skillLvl[i] = 1;
        }
        
        weaponLvl = 1;
        armorLvl = 1;
        
        for (int i = 0; i < StatTypes; i++) {
            weaponBonus[i] = 0;
            armorBonus[i] = 0;
        }
        
        [self updateStats];
    }
    return self;
}


// DEBUG INIT
- (id) initWithID:(NSString *)stringID type:(KnightType)knightType characterType:(CharacterType)charType name:(NSString *)knightName level:(int)level currentExp:(int)exp weaponLvl:(int)wLevel armorLvl:(int)aLevel {
    self = [super init];
    if (self != nil) {
        keyID = [stringID retain];
        
        type = knightType;
        switch (type) {
            case KnightTypeBrawler:
                damageType = DamageTypePhysical;
                break;
                
            case KnightTypePaladin:
                damageType = DamageTypePhysical;
                break;
                
            case KnightTypeBard:
                damageType = DamageTypePhysical;
                break;
                
            case KnightTypeLongbowman:
                damageType = DamageTypeRanged;
                break;
                
            case KnightTypeCrossbowman:
                damageType = DamageTypeRanged;
                break;
                
            case KnightTypeScout:
                damageType = DamageTypeRanged;
                break;
                
            case KnightTypeBattlemage:
                damageType = DamageTypeMagic;
                break;
                
            case KnightTypeWizard:
                damageType = DamageTypeMagic;
                break;
                
            case KnightTypeMonk:
                damageType = DamageTypeMagic;
                break;
                
            default:
                break;
        }
        
        
        name = [knightName retain];
        
        characterType = charType;
        switch (characterType) {
            case CharacterTypeBrave:
                character = @"BRAVE";
                break;
                
            case CharacterTypeCalm:
                character = @"CALM";
                break;
                
            case CharacterTypeBold:
                character = @"BOLD";
                break;
                
            case CharacterTypePrepared:
                character = @"PREPARED";
                break;
                
            case CharacterTypeHasty:
                character = @"HASTY";
                break;
                
            case CharacterTypeCareful:
                character = @"CAREFUL";
                break;
                
            default:
                break;
        }
        
        // init starting values
        lvl = level;
        currentExp = exp;
        
        for (int i = 0; i < SkillTypes; i++) {
            skillLvl[i] = 1;
        }
        
        weaponLvl = wLevel;
        armorLvl = aLevel;
        
        for (int i = 0; i < StatTypes; i++) {
            weaponBonus[i] = 0;
            armorBonus[i] = 0;
        }
        
        [self updateStats];
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
            [self updateStats];
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




- (void) updateStats {
    NSArray *baseStats = [Constants getBaseStatsForUnit:type];
    int maxLvl = [Constants getMaxUnitLvl];
    for (int i = 0; i < StatTypes; i++) {
        // calc stat value
        stats[i] = (2 * [[baseStats objectAtIndex:i] intValue] * lvl) / maxLvl;
        
        // add armor and weapon bonuses
        stats[i] += weaponBonus[i];
        stats[i] += armorBonus[i];
    }
    
    switch (characterType) {
        case CharacterTypeBrave:
            stats[Strength] += lvl;
            stats[Defence] -= lvl;
            break;
            
        case CharacterTypeCalm:
            stats[Accuracy] += lvl;
            stats[Agility] -= lvl;
            break;
            
        case CharacterTypeBold:
            stats[Cunning] += lvl;
            stats[Sturdiness] -= lvl;
            break;
            
        case CharacterTypePrepared:
            stats[Defence] += lvl;
            stats[Strength] -= lvl;
            break;
            
        case CharacterTypeHasty:
            stats[Agility] += lvl;
            stats[Accuracy] -= lvl;
            break;
            
        case CharacterTypeCareful:
            stats[Sturdiness] += lvl;
            stats[Cunning] -= lvl;
            break;
            
        default:
            break;
    }
    
    int baseHp = [Constants getBaseHpForUnit:type];
    hp = (150 * baseHp * lvl) / maxLvl;
    hp += HP_MODIFIER * lvl;
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
