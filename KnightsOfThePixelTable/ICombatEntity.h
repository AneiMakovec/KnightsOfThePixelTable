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
@property (nonatomic, readonly) BOOL finishedAttacking;

@property (nonatomic, readonly) EntityState state;
@property (nonatomic, readonly) AttackType attackType;
@property (nonatomic, readonly) StatType entityType;
@property (nonatomic, readonly) DamageType damageType;
@property (nonatomic) CombatPosition combatPosition;
@property (nonatomic, readonly) BattlePosition *origin;

@property (nonatomic, readonly) CombatEntity *target;

@property (nonatomic, readonly) NSMutableArray *combo;

- (void) setCombatPosition:(CombatPosition)theCombatPosition ally:(BOOL)isAlly;

- (void) attackTarget:(CombatEntity *)theTarget;

- (BOOL) addComboItem:(Dice *)theItem;

- (Dice *) removeCombo:(ComboItem)theItem;

- (void) resetAttack;

- (void) updateAttackType;

- (void) stopDefending;

- (StatType) getAttackValueForAttack:(AttackType)theAttack;


@end
