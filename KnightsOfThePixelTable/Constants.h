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

+ (int) positionXOfAlly:(CombatPosition)theAlly;
+ (int) positionYOfAlly:(CombatPosition)theAlly;

+ (int) areaXOfAlly:(CombatPosition)theAlly;
+ (int) areaYOfAlly:(CombatPosition)theAlly;
+ (int) allyAreaWidth;
+ (int) allyAreaHeight;

+ (int) comboAreaXOfAlly:(CombatPosition)theAlly;
+ (int) comboAreaYOfAlly:(CombatPosition)theAlly;
+ (int) comboAreaWidth;
+ (int) comboAreaHeight;

+ (int) comboAreaXOfAlly:(CombatPosition)theAlly atPosition:(ComboItem)theItem;
+ (int) comboAreaYOfAlly:(CombatPosition)theAlly atPosition:(ComboItem)theItem;
+ (int) separateComboAreaSize;

+ (int) portraitXOfAlly:(CombatPosition)theAlly;
+ (int) portraitYOfAlly:(CombatPosition)theAlly;
+ (int) portraitSize;

+ (int) skillXOfAlly:(CombatPosition)theAlly;
+ (int) skillYOfAlly:(CombatPosition)theAlly;
+ (int) skillSize;

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
