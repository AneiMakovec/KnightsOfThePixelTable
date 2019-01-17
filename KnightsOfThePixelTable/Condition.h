//
//  Condition.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 16/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"
#import "StatEffect.h"

NS_ASSUME_NONNULL_BEGIN

@interface Condition : StatEffect {
    ConditionType type;
    int dmg;
}

@property (nonatomic, readonly) ConditionType type;
@property (nonatomic, readonly) int dmg;

- (id) initWithConditionType:(ConditionType)theType damage:(int)damage duration:(int)duration;

@end

NS_ASSUME_NONNULL_END