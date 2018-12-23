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
    
    EntityState state;
    AttackType attackType;
    CombatPosition combatPosition;
    BattlePosition *origin;
    
    NSMutableArray *stats;
    NSMutableArray *attackDamage;
    NSMutableArray *attackDuration;
    NSMutableArray *combo;
    
    Entity *target;
}

- (id) initWithHealth:(int)hp damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius;

- (void) setCombatPosition:(CombatPosition)theCombatPosition ally:(BOOL)isAlly;

@end

NS_ASSUME_NONNULL_END
