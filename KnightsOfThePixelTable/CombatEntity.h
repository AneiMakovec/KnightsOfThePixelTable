//
//  CombatEntity.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Scene.Objects.h"
#import "Pixlron.Knights.classes.h"
#import "ICombatEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface CombatEntity : DamageDealer<ICombatEntity> {
    float radius;
    float maxRadius;
    
    Rectangle *entityArea;
    
    BOOL stunned;
    BOOL isDead;
    BOOL finishedAttacking;
    BOOL isTargeted;
    
    StatType entityType;
    EntityState state;
    DamageType damageType;
    SkillType skillType;
    CombatPosition combatPosition;
    BattlePosition *origin;
    
    Stat *stats[StatTypes];
    Skill *skills[SkillTypes];
    NSMutableArray *combo;
    StatType comboSkillTypes[SkillTypes];
    
    NSMutableArray *statEffects;
    
    CombatEntity *target;
}

- (id) initWithEntityType:(StatType)theType health:(int)hp damageType:(DamageType)theDamageType damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius;

@end

NS_ASSUME_NONNULL_END
