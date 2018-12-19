//
//  Constants.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Constants.h"

@implementation Constants

+ (int) lancelotValueOfStat:(StatType)theStat {
    switch (theStat) {
        case Strength:
            return 30;
        case Agility:
            return 30;
        case Intelligence:
            return 30;
        case Insight:
            return 30;
        case Cunning:
            return 30;
        case Sturdiness:
            return 30;
        default:
            return -1;
    }
}

+ (StatGainRate) lancelotGainOfStat:(StatType)theStat {
    switch (theStat) {
        case Strength:
            return StateGainRateFast;
        case Agility:
            return StateGainRateFast;
        case Intelligence:
            return StateGainRateFast;
        case Insight:
            return StateGainRateFast;
        case Cunning:
            return StateGainRateFast;
        case Sturdiness:
            return StateGainRateFast;
        default:
            return -1;
    }
}

+ (int) lancelotGainMarginOfStat:(StatType)theStat {
    switch (theStat) {
        case Strength:
            return 4;
        case Agility:
            return 4;
        case Intelligence:
            return 4;
        case Insight:
            return 4;
        case Cunning:
            return 4;
        case Sturdiness:
            return 4;
        default:
            return -1;
    }
}

+ (int) lancelotPowerOfAttack:(AttackType)theAttack {
    switch (theAttack) {
        case BasicAttack:
            return 30;
        case FirstCombo:
            return 30;
        case SecondCombo:
            return 30;
        case ThirdCombo:
            return 30;
        default:
            return -1;
    }
}

+ (StatType) lancelotStatUsedForAttack:(AttackType)theAttack {
    switch (theAttack) {
        case BasicAttack:
            return Strength;
        case FirstCombo:
            return Strength;
        case SecondCombo:
            return Strength;
        case ThirdCombo:
            return Strength;
        default:
            return -1;
    }
}

+ (StatGainRate) lancelotGainOfAttack:(AttackType)theAttack {
    switch (theAttack) {
        case BasicAttack:
            return StateGainRateMedium;
        case FirstCombo:
            return StateGainRateMedium;
        case SecondCombo:
            return StateGainRateMedium;
        case ThirdCombo:
            return StateGainRateMedium;
        default:
            return -1;
    }
}

+ (int) lancelotGainMarginOfAttack:(AttackType)theAttack {
    switch (theAttack) {
        case BasicAttack:
            return 10;
        case FirstCombo:
            return 10;
        case SecondCombo:
            return 10;
        case ThirdCombo:
            return 10;
        default:
            return -1;
    }
}

+ (NSTimeInterval) lancelotDurationOfAttack:(AttackType)theAttack {
    switch (theAttack) {
        case BasicAttack:
            return 1;
        case FirstCombo:
            return 1;
        case SecondCombo:
            return 1;
        case ThirdCombo:
            return 1;
        default:
            return -1;
    }
}

@end
