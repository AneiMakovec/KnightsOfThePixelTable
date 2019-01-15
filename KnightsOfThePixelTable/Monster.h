//
//  Monster.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Scene.Objects.h"
#import "Pixlron.Knights.classes.h"
#import "CombatEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface Monster : CombatEntity<IExperienceGiver> {
    BOOL isTargeted;
    
    int dicesComming;
    
    MonsterType type;
    
    ExpType expType;
}

@property (nonatomic) MonsterType type;
@property (nonatomic) BOOL isTargeted;

- (id) initMonster:(MonsterType)theMonster expType:(ExpType)theExpType entityType:(StatType)theType health:(int)hp damageType:(DamageType)theDamageType damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius;

- (void) setCombatPosition:(CombatPosition)theCombatPosition;

- (BOOL) areDicesComming;

- (void) newDiceComming;

@end

NS_ASSUME_NONNULL_END
