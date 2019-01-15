//
//  StatEffect.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 15/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KOTPTEnums.h"

NS_ASSUME_NONNULL_BEGIN

@interface StatEffect : NSObject {
    StatType statAffected;
    StatEffectType effectType;
    int value;
    
    int duration;
}

@property (nonatomic, readonly) StatType statAffected;
@property (nonatomic, readonly) StatEffectType effectType;
@property (nonatomic, readonly) int value;

- (id) initWith;

@end

NS_ASSUME_NONNULL_END
