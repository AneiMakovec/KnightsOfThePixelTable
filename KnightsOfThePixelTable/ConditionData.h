//
//  ConditionData.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 27/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

#import "IUpgradable.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConditionData : NSObject<IUpgradable> {
    ConditionType type;
//    StatType statType;
    Target target;
    float chance;
    int duration;
}

@property (nonatomic, readonly) ConditionType type;
//@property (nonatomic, readonly) StatType statType;
@property (nonatomic, readonly) Target target;
@property (nonatomic, readonly) float chance;
@property (nonatomic, readonly) int duration;

- (id) initWithType:(ConditionType)cType target:(Target)tTarget chance:(float)cChance duration:(int)dDuration;

@end

NS_ASSUME_NONNULL_END
