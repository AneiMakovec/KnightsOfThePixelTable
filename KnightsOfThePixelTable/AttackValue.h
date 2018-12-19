//
//  AttackValue.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatValue.h"

NS_ASSUME_NONNULL_BEGIN

@interface AttackValue : StatValue {
    StatType statUsed;
}

@property (nonatomic, readonly) StatType statUsed;

- (id) initWithValue:(int)theValue statUsed:(StatType)theStat gainRate:(StatGainRate)theGainRate upgradeMargin:(int)theMargin;

@end

NS_ASSUME_NONNULL_END
