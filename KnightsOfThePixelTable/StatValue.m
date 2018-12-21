//
//  StatValue.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "StatValue.h"

@implementation StatValue

- (id) initWithValue:(int)theValue gainRate:(StatGainRate)theGainRate upgradeMargin:(int)theMargin {
    self = [super init];
    if (self != nil) {
        value = theValue;
        gainRate = theGainRate;
        
        currentUpgradeLevel = 0;
        maxUpgradeLevel = 10;
        upgradeMargin = theMargin;
    }
    return self;
}

@synthesize value, maxUpgradeLevel, currentUpgradeLevel, upgradeMargin;

- (void) upgrade {
    if (currentUpgradeLevel < maxUpgradeLevel) {
        switch (gainRate) {
            case StatGainRateSlow:
                value += upgradeMargin;
                break;
            case StatGainRateMedium:
                value += upgradeMargin + (upgradeMargin / 2);
                break;
            case StatGainRateFast:
                value += upgradeMargin * 2;
                break;
            default:
                break;
        }
        
        currentUpgradeLevel++;
    }
}

@end
