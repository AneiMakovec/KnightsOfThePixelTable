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

NS_ASSUME_NONNULL_BEGIN

@interface Knight : DamageDealer<IExperienceGainer, ICustomUpdate> {
    int currentLevel;
    int maxLevel;
    int exp;
}

- (id) initWithHealth:(int)hp damageStrength:(float)theDamageStrength currentLevel:(int)theCurrentLevel;

@end

NS_ASSUME_NONNULL_END
