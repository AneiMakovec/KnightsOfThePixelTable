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

+ (NSString*) progressFilePath;

+ (int) backgroundWidth;
+ (int) battlefieldHeight;
+ (int) hudHeight;

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

+ (int) hpPoolXOfAlly:(CombatPosition)theAlly;
+ (int) hpPoolYOfAlly:(CombatPosition)theAlly;
+ (int) hpPoolWidth;
+ (int) hpPoolHeight;

+ (int) portraitXOfAlly:(CombatPosition)theAlly;
+ (int) portraitYOfAlly:(CombatPosition)theAlly;
+ (int) portraitSize;

+ (int) skillXOfAlly:(CombatPosition)theAlly;
+ (int) skillYOfAlly:(CombatPosition)theAlly;
+ (int) skillSize;

+ (int) dicepoolLeftWall;
+ (int) dicepoolRightWall;
+ (int) dicepoolUpWall;
+ (int) dicepoolDownWall;

+ (DamageType) advantageOfDamageType:(DamageType)type;
+ (DamageType) disadvantageOfDamageType:(DamageType)type;

+ (int) requiredExpToLvlUp;
+ (int) expGainNormal;
+ (int) expGainElite;
+ (int) expGainBoss;

+ (int) lancelotHealthPoints;
+ (int) lancelotValueOfStat:(StatType)stat;
+ (int) lancelotGainMarginOfStat:(StatType)stat;
+ (SkillFunction) lancelotFunctionOfSkill:(SkillType)skill;
+ (SkillRange) lancelotRangeOfSkill:(SkillType)skill;
+ (SkillTarget) lancelotTargetOfSkill:(SkillType)skill;
+ (SkillUseOn) lancelotUseOnSkill:(SkillType)skill;
+ (float) lancelotDamageOfSkill:(SkillType)skill;
+ (NSTimeInterval) lancelotDurationOfSkill:(SkillType)skill;
+ (float) lancelotGainMarginOfSkill:(SkillType)skill;

@end

NS_ASSUME_NONNULL_END
