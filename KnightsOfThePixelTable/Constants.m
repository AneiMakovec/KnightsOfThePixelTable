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
 MARK: PROGRESS FILE PATH
*/
+ (NSString*) progressFilePath {
    return @"KOTPTSave";
}

/*
 MARK: BACKGROUND SIZE
*/
+ (int) backgroundWidth {
    return 1024;
}

+ (int) battlefieldHeight {
    return 320;
}

+ (int) hudHeight {
    return 192;
}


/*
 MARK: ALLY ENTITY POSITIONS
*/
+ (int) positionXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 308;
        case SecondCombatPosition:
            return 256;
        case ThirdCombatPosition:
            return 152;
        case FourthCombatPosition:
            return 104;
        default:
            return -1;
    }
}

+ (int) positionYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 184;
        case SecondCombatPosition:
            return 248;
        case ThirdCombatPosition:
            return 184;
        case FourthCombatPosition:
            return 248;
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
            return 324;
        case SecondCombatPosition:
            return 324;
        case ThirdCombatPosition:
            return 12;
        case FourthCombatPosition:
            return 12;
        default:
            return -1;
    }
}

+ (int) areaYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 12 + [self battlefieldHeight];
        case SecondCombatPosition:
            return 100 + [self battlefieldHeight];
        case ThirdCombatPosition:
            return 12 + [self battlefieldHeight];
        case FourthCombatPosition:
            return 100 + [self battlefieldHeight];
        default:
            return -1;
    }
}

+ (int) allyAreaWidth {
    return 304;
}

+ (int) allyAreaHeight {
    return 80;
}


/*
 MARK: ALLY ENTITY COMBO TOUCH AREAS
*/
+ (int) comboAreaXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 416;
        case SecondCombatPosition:
            return 416;
        case ThirdCombatPosition:
            return 104;
        case FourthCombatPosition:
            return 104;
        default:
            return -1;
    }
}

+ (int) comboAreaYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 20 + [self battlefieldHeight];
        case SecondCombatPosition:
            return 108 + [self battlefieldHeight];
        case ThirdCombatPosition:
            return 20 + [self battlefieldHeight];
        case FourthCombatPosition:
            return 108 + [self battlefieldHeight];
        default:
            return -1;
    }
}

+ (int) comboAreaWidth {
    return 152;
}

+ (int) comboAreaHeight {
    return 32;
}


/*
 MARK: SEPARATE COMBO AREAS
*/
+ (int) comboAreaXOfAlly:(CombatPosition)theAlly atPosition:(ComboItem)theItem {
    switch (theAlly) {
        case FirstCombatPosition:
            switch (theItem) {
                case FirstComboItem:
                    return 420;
                case SecondComboItem:
                    return 460;
                case ThirdComboItem:
                    return 500;
                case FourthComboItem:
                    return 540;
                default:
                    return -1;
            }
        case SecondCombatPosition:
            switch (theItem) {
                case FirstComboItem:
                    return 420;
                case SecondComboItem:
                    return 460;
                case ThirdComboItem:
                    return 500;
                case FourthComboItem:
                    return 540;
                default:
                    return -1;
            }
        case ThirdCombatPosition:
            switch (theItem) {
                case FirstComboItem:
                    return 108;
                case SecondComboItem:
                    return 148;
                case ThirdComboItem:
                    return 188;
                case FourthComboItem:
                    return 228;
                default:
                    return -1;
            }
        case FourthCombatPosition:
            switch (theItem) {
                case FirstComboItem:
                    return 108;
                case SecondComboItem:
                    return 148;
                case ThirdComboItem:
                    return 188;
                case FourthComboItem:
                    return 228;
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
            return 24 + [self battlefieldHeight];
        case SecondCombatPosition:
            return 112 + [self battlefieldHeight];
        case ThirdCombatPosition:
            return 24 + [self battlefieldHeight];
        case FourthCombatPosition:
            return 112 + [self battlefieldHeight];
        default:
            return -1;
    }
}

+ (int) separateComboAreaSize {
    return 24;
}


/*
 MARK: ALLY HP POOL
*/
+ (int) hpPoolXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 456;
        case SecondCombatPosition:
            return 456;
        case ThirdCombatPosition:
            return 144;
        case FourthCombatPosition:
            return 144;
        default:
            return -1;
    }
}

+ (int) hpPoolYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 68 + [self battlefieldHeight];
        case SecondCombatPosition:
            return 156 + [self battlefieldHeight];
        case ThirdCombatPosition:
            return 68 + [self battlefieldHeight];
        case FourthCombatPosition:
            return 156 + [self battlefieldHeight];
        default:
            return -1;
    }
}

+ (int) hpPoolWidth {
    return 108;
}

+ (int) hpPoolHeight {
    return 12;
}


/*
 MARK: ALLY ENTITY PORTRAIT AREAS
*/
+ (int) portraitXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 340;
        case SecondCombatPosition:
            return 340;
        case ThirdCombatPosition:
            return 28;
        case FourthCombatPosition:
            return 28;
        default:
            return -1;
    }
}

+ (int) portraitYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 24 + [self battlefieldHeight];
        case SecondCombatPosition:
            return 112 + [self battlefieldHeight];
        case ThirdCombatPosition:
            return 24 + [self battlefieldHeight];
        case FourthCombatPosition:
            return 112 + [self battlefieldHeight];
        default:
            return -1;
    }
}

+ (int) portraitSize {
    return 56;
}


/*
 MARK: ALLY ENTITY SKILL AREAS
*/
+ (int) skillXOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 584;
        case SecondCombatPosition:
            return 584;
        case ThirdCombatPosition:
            return 272;
        case FourthCombatPosition:
            return 272;
        default:
            return -1;
    }
}

+ (int) skillYOfAlly:(CombatPosition)theAlly {
    switch (theAlly) {
        case FirstCombatPosition:
            return 36 + [self battlefieldHeight];
        case SecondCombatPosition:
            return 124 + [self battlefieldHeight];
        case ThirdCombatPosition:
            return 36 + [self battlefieldHeight];
        case FourthCombatPosition:
            return 124 + [self battlefieldHeight];
        default:
            return -1;
    }
}

+ (int) skillSize {
    return 32;
}

/*
 MARK: DICEPOOL BOUNDS
*/
+ (int) dicepoolLeftWall {
    return 647;
}

+ (int) dicepoolRightWall {
    return 1004;
}

+ (int) dicepoolUpWall {
    return 19 + [self battlefieldHeight];
}

+ (int) dicepoolDownWall {
    return 172 + [self battlefieldHeight];
}


/*
 MARK: DAMAGE TYPE TYPING
*/
+ (DamageType) advantageOfDamageType:(DamageType)type {
    switch (type) {
        case DamageTypeMelee:
            return DamageTypeRanged;
        case DamageTypeRanged:
            return DamageTypeMagic;
        case DamageTypeMagic:
            return DamageTypeMelee;
            
        default:
            break;
    }
    
    return NoDamageType;
}

+ (DamageType) disadvantageOfDamageType:(DamageType)type {
    switch (type) {
        case DamageTypeMelee:
            return DamageTypeMagic;
        case DamageTypeRanged:
            return DamageTypeMelee;
        case DamageTypeMagic:
            return DamageTypeRanged;
            
        default:
            break;
    }
    
    return NoDamageType;
}


/*
 MARK: EXPERIENCE
*/
+ (int) requiredExpToLvlUp {
    return 500;
}

+ (int) expGainNormal {
    return 100;
}

+ (int) expGainElite {
    return 500;
}

+ (int) expGainBoss {
    return 1000;
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
