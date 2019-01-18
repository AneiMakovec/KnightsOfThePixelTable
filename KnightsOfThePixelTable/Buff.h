//
//  Buff.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 16/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"
#import "StatEffect.h"

NS_ASSUME_NONNULL_BEGIN

@interface Buff : StatEffect {
    StatType type;
    float buff;
}

@property (nonatomic, readonly) StatType type;
@property (nonatomic, readonly) float buff;

- (id) initWithStatType:(StatType)theType buff:(float)theBuff duration:(int)duration chance:(int)chance;

@end

NS_ASSUME_NONNULL_END
