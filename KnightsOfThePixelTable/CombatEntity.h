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
    
    EntityState state;
    AttackType attackType;
    BattlePosition *origin;
    NSArray *stats;
    NSArray *attackDamage;
    NSArray *attackDuration;
    
    Entity *target;
}

- (id) initWithHealth:(int)hp damageStrength:(float)theDamageStrength;

@end

NS_ASSUME_NONNULL_END
