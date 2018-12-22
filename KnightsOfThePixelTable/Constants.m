//
//  Constants.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Constants.h"

@implementation Constants


/*
    ALLY ENTITY POSITIONS
*/
+ (int) positionXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 77;
        case SecondCombatPosition:
            return 64;
        case ThirdCombatPosition:
            return 38;
        case FourthCombatPosition:
            return 26;
        default:
            return -1;
    }
}

+ (int) positionYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 46;
        case SecondCombatPosition:
            return 62;
        case ThirdCombatPosition:
            return 46;
        case FourthCombatPosition:
            return 62;
        default:
            return -1;
    }
}


/*
    ALLY ENTITIES TOUCH AREAS
*/
+ (int) areaXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 81;
        case SecondCombatPosition:
            return 81;
        case ThirdCombatPosition:
            return 3;
        case FourthCombatPosition:
            return 3;
        default:
            return -1;
    }
}

+ (int) areaYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 3;
        case SecondCombatPosition:
            return 25;
        case ThirdCombatPosition:
            return 3;
        case FourthCombatPosition:
            return 25;
        default:
            return -1;
    }
}

+ (int) allyAreaWidth {
    return 75;
}

+ (int) allyAreaHeight {
    return 19;
}


/*
    ALLY ENTITY COMBO TOUCH AREAS
*/
+ (int) comboAreaXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 104;
        case SecondCombatPosition:
            return 104;
        case ThirdCombatPosition:
            return 26;
        case FourthCombatPosition:
            return 26;
        default:
            return -1;
    }
}

+ (int) comboAreaYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 9;
        case SecondCombatPosition:
            return 31;
        case ThirdCombatPosition:
            return 9;
        case FourthCombatPosition:
            return 31;
        default:
            return -1;
    }
}

+ (int) comboAreaWidth {
    return 38;
}

+ (int) comboAreaHeight {
    return 8;
}


/*
    SEPARATE COMBO AREAS
*/
+ (int) comboAreaXOfAlly:(CombatPosition)theAlly atPosition:(ComboItem)theItem {
    switch (theAlly) {
        case FirstCombatPosition:
            switch (theItem) {
                case FirstComboItem:
                    return 105;
                case SecondComboItem:
                    return 115;
                case ThirdComboItem:
                    return 125;
                case FourthComboItem:
                    return 135;
                default:
                    return -1;
            }
        case SecondCombatPosition:
            switch (theItem) {
                case FirstComboItem:
                    return 105;
                case SecondComboItem:
                    return 115;
                case ThirdComboItem:
                    return 125;
                case FourthComboItem:
                    return 135;
                default:
                    return -1;
            }
        case ThirdCombatPosition:
            switch (theItem) {
                case FirstComboItem:
                    return 27;
                case SecondComboItem:
                    return 37;
                case ThirdComboItem:
                    return 47;
                case FourthComboItem:
                    return 57;
                default:
                    return -1;
            }
        case FourthCombatPosition:
            switch (theItem) {
                case FirstComboItem:
                    return 27;
                case SecondComboItem:
                    return 37;
                case ThirdComboItem:
                    return 47;
                case FourthComboItem:
                    return 57;
                default:
                    return -1;
            }
        default:
            return -1;
    }
}

+ (int) comboAreaYOfAlly:(CombatPosition)theAlly atPosition:(ComboItem)theItem {
    switch (theAlly) {
        case FirstCombatPosition:
            return 10;
        case SecondCombatPosition:
            return 32;
        case ThirdCombatPosition:
            return 10;
        case FourthCombatPosition:
            return 32;
        default:
            return -1;
    }
}

+ (int) separateComboAreaSize {
    return 8;
}


/*
    ALLY ENTITY PORTRAIT AREAS
*/
+ (int) portraitXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 85;
        case SecondCombatPosition:
            return 85;
        case ThirdCombatPosition:
            return 7;
        case FourthCombatPosition:
            return 7;
        default:
            return -1;
    }
}

+ (int) portraitYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 6;
        case SecondCombatPosition:
            return 28;
        case ThirdCombatPosition:
            return 6;
        case FourthCombatPosition:
            return 28;
        default:
            return -1;
    }
}

+ (int) portraitSize {
    return 14;
}


/*
    ALLY ENTITY SKILL AREAS
*/
+ (int) skillXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 146;
        case SecondCombatPosition:
            return 146;
        case ThirdCombatPosition:
            return 68;
        case FourthCombatPosition:
            return 68;
        default:
            return -1;
    }
}

+ (int) skillYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 9;
        case SecondCombatPosition:
            return 31;
        case ThirdCombatPosition:
            return 9;
        case FourthCombatPosition:
            return 31;
        default:
            return -1;
    }
}

+ (int) skillSize {
    return 8;
}








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
            return StatGainRateFast;
        case Agility:
            return StatGainRateFast;
        case Intelligence:
            return StatGainRateFast;
        case Insight:
            return StatGainRateFast;
        case Cunning:
            return StatGainRateFast;
        case Sturdiness:
            return StatGainRateFast;
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
            return StatGainRateMedium;
        case FirstCombo:
            return StatGainRateMedium;
        case SecondCombo:
            return StatGainRateMedium;
        case ThirdCombo:
            return StatGainRateMedium;
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
