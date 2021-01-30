//
//  StatEffectFactory.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 15/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface StatEffectFactory : NSObject

+ (StatEffect*) createStatEffect:(StatEffect*)statEffect;

@end

NS_ASSUME_NONNULL_END
