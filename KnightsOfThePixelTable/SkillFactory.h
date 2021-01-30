//
//  SkillFactory.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface SkillFactory : NSObject

+ (Skill *) createSkill:(SkillType)type forAlly:(KnightType)ally;
+ (Skill *) createSkill:(SkillType)type forEnemy:(MonsterType)enemy;

@end

NS_ASSUME_NONNULL_END
