//
//  Debuff.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 16/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"
#import "StatEffect.h"

NS_ASSUME_NONNULL_BEGIN

@interface Debuff : StatEffect {
    StatType type;
    float debuff;
}

@property (nonatomic, readonly) StatType type;
@property (nonatomic, readonly) float debuff;

- (id) initWithStatType:(StatType)theType debuff:(float)theDebuff duration:(int)duration chance:(int)chance chanceUpgradeMargin:(int)theChanceMargin;

@end

NS_ASSUME_NONNULL_END
