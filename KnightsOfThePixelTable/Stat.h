//
//  Stat.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IUpgradable.h"

NS_ASSUME_NONNULL_BEGIN

@interface Stat : NSObject<IUpgradable> {
    int defaultValue;
    int statValue;
    int upgradeMargin;
}

@property (nonatomic, readonly) int statValue;

- (id) initWithValue:(int)theValue upgradeMargin:(int)theMargin;

- (void) increaseByPercentage:(float)amount;
- (void) decreaseByPercentage:(float)amount;

- (void) reset;

@end

NS_ASSUME_NONNULL_END
