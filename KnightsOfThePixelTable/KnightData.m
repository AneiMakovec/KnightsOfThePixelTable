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
    self = [super initWithDamageType:0 hp:0 lvl:0];
    if (self != nil) {
        keyID = [stringID retain];
        
        fatigue = 0;
        
        type = knightType;
        switch (type) {
            case KnightTypeBrawler:
                dmgType = DamageTypePhysical;
                break;
                
            case KnightTypePaladin:
                dmgType = DamageTypePhysical;
                break;
                
            case KnightTypeBard:
                dmgType = DamageTypePhysical;
                break;
                
            case KnightTypeLongbowman:
                dmgType = DamageTypeRanged;
                break;
                
            case KnightTypeCrossbowman:
                dmgType = DamageTypeRanged;
                break;
                
            case KnightTypeScout:
                dmgType = DamageTypeRanged;
                break;
                
            case KnightTypeBattlemage:
                dmgType = DamageTypeMagic;
                break;
                
            case KnightTypeWizard:
                dmgType = DamageTypeMagic;
                break;
                
            case KnightTypeMonk:
                dmgType = DamageTypeMagic;
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
            skills[i] = [SkillFactory createSkill:i forAlly:type];
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
    self = [super initWithDamageType:0 hp:0 lvl:level];
    if (self != nil) {
        keyID = [stringID retain];
        
        fatigue = 0;
        
        type = knightType;
        switch (type) {
            case KnightTypeBrawler:
                dmgType = DamageTypePhysical;
                break;
                
            case KnightTypePaladin:
                dmgType = DamageTypePhysical;
                break;
                
            case KnightTypeBard:
                dmgType = DamageTypePhysical;
                break;
                
            case KnightTypeLongbowman:
                dmgType = DamageTypeRanged;
                break;
                
            case KnightTypeCrossbowman:
                dmgType = DamageTypeRanged;
                break;
                
            case KnightTypeScout:
                dmgType = DamageTypeRanged;
                break;
                
            case KnightTypeBattlemage:
                dmgType = DamageTypeMagic;
                break;
                
            case KnightTypeWizard:
                dmgType = DamageTypeMagic;
                break;
                
            case KnightTypeMonk:
                dmgType = DamageTypeMagic;
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
        currentExp = exp;
        
        for (int i = 0; i < SkillTypes; i++) {
            skills[i] = [SkillFactory createSkill:i forAlly:type];
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

@synthesize type, name, currentExp, weaponLvl, armorLvl, characterType, character, fatigue;

- (int) getLevelOfSkill:(SkillType)skill {
    return skills[skill].lvl;
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

- (Skill *) getSkill:(SkillType)skill {
    return skills[skill];
}





- (BOOL) isSkillAtMaxLvl:(SkillType)skill {
    return skills[skill].lvl == [Constants getMaxSkillLvl];
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
    if (skills[skill].lvl < [Constants getMaxSkillLvl])
        [skills[skill] upgrade];
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


- (void) increaseFatigue {
    fatigue += [Random intGreaterThanOrEqual:5 lessThan:21];
    
    if (fatigue > 100)
        fatigue = 100;
}

- (void) decreaseFatigue {
    fatigue -= [Random intGreaterThanOrEqual:5 lessThan:21];
    
    if (fatigue < 0)
        fatigue = 0;
}



// DEBUG METHOD
- (void) setLevelOfSkill:(SkillType)skill lvl:(int)level {
    
}

- (void) setValueOfStat:(StatType)stat value:(int)value {
    stats[stat] = value;
}


- (void) dealloc {
    [name release];
    
    [super dealloc];
}

@end
