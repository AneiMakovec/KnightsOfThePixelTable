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

@interface CombatEntity : Entity<IMovable, ICustomUpdate, ICustomCollider, IParticleCollider, IDamageDealer> {
    // physics variables
    Vector2 *position;
    Vector2 *velocity;
    float radius;
    float maxRadius;
    
    // move points
    BattlePosition *origin;
    BattlePosition *attackPosition;
    
    // class holding entity stats, skills and types
    EntityData *entityData;
    
    // touch area
//    Rectangle *entityArea;
    
    // action switches
    BOOL stunned;
    BOOL finishedAttacking;
    BOOL isTargeted;
    
    // combo check variables
    NSMutableArray *combo;
    
    // current skill
    SkillType skillType;
    
    // position of unit on the battlefield
//    CombatPosition combatPosition;
    
    // state of unit
    EntityState state;
    
    // active conditions
    NSMutableArray *conditions;
    
    // selected targets
    NSMutableArray *targets;
    
    AnimatedSprite *animations[AnimationTypes];
}

@property (nonatomic, readonly) BOOL stunned;
@property (nonatomic, readonly) BOOL finishedAttacking;
@property (nonatomic) BOOL isTargeted;

@property (nonatomic, readonly) EntityState state;
@property (nonatomic, readonly) SkillType skillType;

@property (nonatomic, readonly) BattlePosition *origin;
@property (nonatomic, readonly) BattlePosition *attackPosition;

@property (nonatomic, readonly) NSMutableArray *combo;
@property (nonatomic, retain) NSMutableArray *conditions;

- (id) initWithData:(EntityData *)data;

- (void) attackTarget:(CombatEntity *)theTarget ally:(BOOL)isAlly;
- (void) resetAttack;
- (void) stopDefending;
- (void) startDefending;

- (BOOL) addComboItem:(Dice *)theItem;
- (Dice *) removeCombo:(ComboItem)theItem;
- (void) updateSkillType;

- (StatType) getAttackValueForAttack:(SkillType)theAttack;

//- (void) addStat:(Stat*)stat type:(StatType)type;
//- (void) addSkill:(Skill*)skill type:(SkillType)type;
- (Stat *) getStat:(StatType)type;

- (void) addStatEffect:(StatEffect*)effect;
- (void) updateStatEffects;

- (void) buffStat:(StatType)type amount:(float)amount;
- (void) debuffStat:(StatType)type amount:(float)amount;
- (void) resetStat:(StatType)type;

- (BOOL) isStunned;
- (void) stun;
- (void) recoverFromStun;

//- (BOOL) isOnlyStunnEffect:(Condition*)condition;


- (void) addConditionAnimation:(ConditionType)condition;


- (AnimatedSprite *) getCurrentAnimation;


- (void) cancelAttack;

@end

NS_ASSUME_NONNULL_END
