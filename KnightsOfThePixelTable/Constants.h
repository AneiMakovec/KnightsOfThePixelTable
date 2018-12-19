//
//  Constants.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KOTPTEnums.h"

NS_ASSUME_NONNULL_BEGIN

@interface Constants : NSObject

+ (int) lancelotValueOfStat:(StatType)theStat;
+ (StatGainRate) lancelotGainOfStat:(StatType)theStat;
+ (int) lancelotGainMarginOfStat:(StatType)theStat;
+ (int) lancelotPowerOfAttack:(AttackType)theAttack;
+ (StatType) lancelotStatUsedForAttack:(AttackType)theAttack;
+ (StatGainRate) lancelotGainOfAttack:(AttackType)theAttack;
+ (int) lancelotGainMarginOfAttack:(AttackType)theAttack;
+ (NSTimeInterval) lancelotDurationOfAttack:(AttackType)theAttack;

@end

NS_ASSUME_NONNULL_END
