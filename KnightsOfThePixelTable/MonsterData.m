//
//  MonsterData.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "MonsterData.h"

#import "Pixlron.Knights.h"

@implementation MonsterData

- (id) initWithID:(NSString *)stringID type:(MonsterType)monsterType lvl:(Lvl)level {
    self = [super initWithID:stringID damageType:0 hp:0 lvl:level];
    if (self != nil) {
        type = monsterType;
        
        switch (type) {
            case MonsterTypeBerserker:
                dmgType = DamageTypePhysical;
                break;
                
            case MonsterTypeHuscarl:
                dmgType = DamageTypePhysical;
                break;
                
            case MonsterTypeHornBearer:
                dmgType = DamageTypePhysical;
                break;
                
            case MonsterTypeAxethrower:
                dmgType = DamageTypeRanged;
                break;
                
            case MonsterTypeSlaver:
                dmgType = DamageTypeRanged;
                break;
                
            case MonsterTypeSlinger:
                dmgType = DamageTypeRanged;
                break;
                
            case MonsterTypeRunemaster:
                dmgType = DamageTypeMagic;
                break;
                
            case MonsterTypeSorcerer:
                dmgType = DamageTypeMagic;
                break;
                
            case MonsterTypeShaman:
                dmgType = DamageTypeMagic;
                break;
                
            case MonsterTypeBossFarmlands:
                dmgType = DamageTypePhysical;
                break;
                
            case MonsterTypeBossPinewoods:
                dmgType = DamageTypePhysical;
                break;
                
            case MonsterTypeBossMountains:
                dmgType = DamageTypePhysical;
                break;
                
            case MonsterTypeBossSeashore:
                dmgType = DamageTypePhysical;
                break;
                
            default:
                break;
        }
        
        for (int i = 0; i < SkillTypes; i++) {
            skills[i] = [SkillFactory createSkill:i forEnemy:type];
        }
        
        [self updateStats];
    }
    
    return self;
}

@synthesize type;

- (void) updateStats {
    NSArray *baseStats;
    if (type == MonsterTypeBossFarmlands) {
        baseStats = [Constants getBaseStatsForEnemy:MonsterTypeHuscarl];
    } else if (type == MonsterTypeBossPinewoods) {
        baseStats = [Constants getBaseStatsForEnemy:MonsterTypeRunemaster];
    } else if (type == MonsterTypeBossMountains) {
        baseStats = [Constants getBaseStatsForEnemy:MonsterTypeAxethrower];
    } else if (type == MonsterTypeBossSeashore) {
        baseStats = [Constants getBaseStatsForEnemy:MonsterTypeBerserker];
    } else {
        baseStats = [Constants getBaseStatsForEnemy:type];
    }
    
    int maxLvl = [Constants getMaxUnitLvl];
    for (int i = 0; i < StatTypes; i++) {
        if (type >= MonsterTypeBossFarmlands) {
            // calc boss stat value
            stats[i] = (int) ((2 * [[baseStats objectAtIndex:i] intValue] * 1.2f * lvl) / maxLvl) * [Constants getDifficultyForStage:[GameProgress currentStage]];
        } else {
            // calc stat value
            stats[i] = (int) ((2 * [[baseStats objectAtIndex:i] intValue] * lvl) / maxLvl) * [Constants getDifficultyForStage:[GameProgress currentStage]];
        }
    }
    
    int baseHp;
    if (type == MonsterTypeBossFarmlands) {
        baseHp = [Constants getBaseHpForEnemy:MonsterTypeHuscarl];
    } else if (type == MonsterTypeBossPinewoods) {
        baseHp = [Constants getBaseHpForEnemy:MonsterTypeRunemaster];
    } else if (type == MonsterTypeBossMountains) {
        baseHp = [Constants getBaseHpForEnemy:MonsterTypeAxethrower];
    } else if (type == MonsterTypeBossSeashore) {
        baseHp = [Constants getBaseHpForEnemy:MonsterTypeBerserker];
    } else {
        baseHp = [Constants getBaseHpForEnemy:type];
    }
    
    if (type >= MonsterTypeBossFarmlands) {
        hp = (int) ((150 * baseHp * 2 * lvl) / maxLvl) * [Constants getDifficultyForStage:[GameProgress currentStage]];
    } else {
        hp = (int) ((150 * baseHp * lvl) / maxLvl) * [Constants getDifficultyForStage:[GameProgress currentStage]];
    }
}

@end
