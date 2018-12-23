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
 MARK: BACKGROUND SIZE
*/
+ (float) backgroundWidth {
    return 256.0f;
}

+ (float) battlefieldHeight {
    return 80.0f;
}

+ (float) hudHeight {
    return 48.0f;
}


/*
 MARK: ALLY ENTITY POSITIONS
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
 MARK: ALLY ENTITIES TOUCH AREAS
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
 MARK: ALLY ENTITY COMBO TOUCH AREAS
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
 MARK: SEPARATE COMBO AREAS
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
    return 6;
}


/*
 MARK: ALLY ENTITY PORTRAIT AREAS
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
 MARK: ALLY ENTITY SKILL AREAS
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





/*
 MARK: KNIGHTS STAT VALUES
*/

/*
 MARK: LANCELOT STATS
*/
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
        case FirstComboAttack:
            return 30;
        case SecondComboAttack:
            return 30;
        case ThirdComboAttack:
            return 30;
        default:
            return -1;
    }
}

+ (StatType) lancelotStatUsedForAttack:(AttackType)theAttack {
    switch (theAttack) {
        case BasicAttack:
            return Strength;
        case FirstComboAttack:
            return Strength;
        case SecondComboAttack:
            return Strength;
        case ThirdComboAttack:
            return Strength;
        default:
            return -1;
    }
}

+ (StatGainRate) lancelotGainOfAttack:(AttackType)theAttack {
    switch (theAttack) {
        case BasicAttack:
            return StatGainRateMedium;
        case FirstComboAttack:
            return StatGainRateMedium;
        case SecondComboAttack:
            return StatGainRateMedium;
        case ThirdComboAttack:
            return StatGainRateMedium;
        default:
            return -1;
    }
}

+ (int) lancelotGainMarginOfAttack:(AttackType)theAttack {
    switch (theAttack) {
        case BasicAttack:
            return 10;
        case FirstComboAttack:
            return 10;
        case SecondComboAttack:
            return 10;
        case ThirdComboAttack:
            return 10;
        default:
            return -1;
    }
}

+ (NSTimeInterval) lancelotDurationOfAttack:(AttackType)theAttack {
    switch (theAttack) {
        case BasicAttack:
            return 1;
        case FirstComboAttack:
            return 1;
        case SecondComboAttack:
            return 1;
        case ThirdComboAttack:
            return 1;
        default:
            return -1;
    }
}

@end
