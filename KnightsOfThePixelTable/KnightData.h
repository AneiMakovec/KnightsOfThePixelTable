//
//  KnightData.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 06/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface KnightData : NSObject {
    KnightType *type;
    NSString *name;
    int lvl;
    int currentExp;
    int skillLvl[SkillTypes];
}

@end

NS_ASSUME_NONNULL_END
