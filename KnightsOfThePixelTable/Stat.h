//
//  Stat.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KOTPTEnums.h"
#import "IUpgradable.h"

NS_ASSUME_NONNULL_BEGIN

@interface Stat : NSObject<IUpgradable> {
    int maxValue;
    int defaultValue;
    int statValue;
    StatUpgrade upgradeMargin;
    
    NSMutableArray *changeStack;
}

@property (nonatomic, readonly) int statValue;

- (id) initWithValue:(int)theValue upgradeMargin:(StatUpgrade)theMargin;

- (void) increaseByPercentage:(float)amount;
- (void) decreaseByPercentage:(float)amount;

- (void) reset;
- (void) resetAll;

@end

NS_ASSUME_NONNULL_END
