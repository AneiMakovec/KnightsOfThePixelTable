//
//  ICombatEntity.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PixEngine.Scene.Objects.h"
#import "KOTPTEnums.h"

@protocol ICombatEntity <ICustomUpdate, ICustomCollider, IParticleCollider>

@property (nonatomic, readonly) float maxRadius;

@property (nonatomic, retain) Rectangle *entityArea;

@property (nonatomic, readonly) BOOL isDead;
@property (nonatomic, readonly) BOOL stunned;
@property (nonatomic, readonly) BOOL finishedAttacking;
@property (nonatomic) BOOL isTargeted;

@property (nonatomic, readonly) EntityState state;
@property (nonatomic, readonly) SkillType skillType;
@property (nonatomic, readonly) StatType entityType;
@property (nonatomic, readonly) DamageType damageType;
@property (nonatomic) CombatPosition combatPosition;
@property (nonatomic, readonly) BattlePosition *origin;

@property (nonatomic, readonly) BattlePosition *target;

@property (nonatomic, readonly) NSMutableArray *combo;
@property (nonatomic, retain) NSMutableArray *statEffects;

@property (nonatomic, retain) GameHud *hud;

- (void) setCombatPosition:(CombatPosition)theCombatPosition ally:(BOOL)isAlly;

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

- (BOOL) isOnlyStunnEffect:(Condition*)condition;


@end
