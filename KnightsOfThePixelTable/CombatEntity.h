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

@interface CombatEntity : Entity<ICombatEntity> {
    
    // physics variables
    Vector2 *position;
    Vector2 *velocity;
    float radius;
    float maxRadius;
    BattlePosition *origin;
    
    // touch area
    Rectangle *entityArea;
    
    // action switches
    BOOL stunned;
    BOOL finishedAttacking;
    BOOL isTargeted;
    
    // combo check variables
    StatType entityType;
    StatType comboSkillTypes[SkillTypes];
    NSMutableArray *combo;
    
    // current skill
    SkillType skillType;
    
    // type of unit
    DamageType damageType;
    
    // position of unit on the battlefield
    CombatPosition combatPosition;
    
    // state of unit
    EntityState state;
    
    // stats and skills
    Stat *stats[StatTypes];
    Skill *skills[SkillTypes];
    
    // active status effects
    NSMutableArray *statEffects;
    
    // selected targets
    BattlePosition *targetPosition;
    NSMutableArray *targets;
    
    // pointers to game components
    GameHud *hud;
    Level *level;
    
    AnimatedSprite *animations[EntityStates];
}

- (id) initWithLevel:(Level*)theLevel gameHud:(GameHud*)theHud entityType:(StatType)theType health:(int)hp damageType:(DamageType)theDamageType maxRadius:(float)theMaxRadius;

@end

NS_ASSUME_NONNULL_END
