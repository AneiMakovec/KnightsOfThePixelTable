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
    int expWorth;
    
    MonsterType type;
}

@property (nonatomic) MonsterType type;

- (id) initMonster:(MonsterType)theMonster health:(int)hp damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius;

- (void) setCombatPosition:(CombatPosition)theCombatPosition;

@end

NS_ASSUME_NONNULL_END
