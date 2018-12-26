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

@property (nonatomic) float maxRadius;

@property (nonatomic, retain) Rectangle *entityArea;

@property (nonatomic, readonly) BOOL isDead;

@property (nonatomic) EntityState state;
@property (nonatomic) AttackType attackType;
@property (nonatomic) CombatPosition combatPosition;
@property (nonatomic, retain) BattlePosition *origin;

@property (nonatomic, retain) NSMutableArray *stats;
@property (nonatomic, retain) NSMutableArray *attackDamage;
@property (nonatomic, retain) NSMutableArray *attackDuration;
@property (nonatomic, retain) Entity *target;
@property (nonatomic, retain) NSMutableArray *combo;

- (void) setCombatPosition:(CombatPosition)theCombatPosition ally:(BOOL)isAlly;

- (void) attackTarget:(Entity *)theTarget;

- (BOOL) addComboItem:(Dice *)theItem;

- (Dice *) removeCombo:(ComboItem)theItem;


@end
