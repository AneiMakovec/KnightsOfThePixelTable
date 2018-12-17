//
//  Knight.h
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

@interface Knight : CombatEntity<IExperienceGainer> {
    int currentLevel;
    int maxLevel;
    int exp;
    
    KnightType type;
}

- (id) initWithKnightType: (KnightType)theType health:(int)hp damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius;

@end

NS_ASSUME_NONNULL_END
