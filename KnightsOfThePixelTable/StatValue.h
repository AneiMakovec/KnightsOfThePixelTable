//
//  StatValue.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KOTPTEnums.h"
#import "IUpgradable.h"

NS_ASSUME_NONNULL_BEGIN

@interface StatValue : NSObject<IUpgradable> {
    int maxUpgradeLevel;
    int currentUpgradeLevel;
    int upgradeMargin;
    
    int value;
    StatGainRate gainRate;
}

@property (nonatomic, readonly) int value;

- (id) initWithValue:(int)theValue gainRate:(StatGainRate)theGainRate upgradeMargin:(int)theMargin;

@end

NS_ASSUME_NONNULL_END
