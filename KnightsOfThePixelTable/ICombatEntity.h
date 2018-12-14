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

@property (nonatomic) EntityState state;
@property (nonatomic) AttackType attackType;
@property (nonatomic, retain) BattlePosition *origin;
@property (nonatomic, retain) NSArray *stats;
@property (nonatomic, retain) NSArray *attackDamage;
@property (nonatomic, retain) NSArray *attackDuration;
@property (nonatomic, retain) Entity *target;
//@property (nonatomic, retain) NSArray *targets;

- (void) attackTarget:(Entity *)theTarget;

@end
