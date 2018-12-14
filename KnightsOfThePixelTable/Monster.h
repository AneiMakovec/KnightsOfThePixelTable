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

NS_ASSUME_NONNULL_BEGIN

@interface Monster : DamageDealer<IExperienceGiver, ICombatEntity>

@end

NS_ASSUME_NONNULL_END
