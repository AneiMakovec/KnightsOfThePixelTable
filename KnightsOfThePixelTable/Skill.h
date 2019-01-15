//
//  AttackValue.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Scene.Objects.h"

#import "Pixlron.Knights.classes.h"
#import "IUpgradable.h"

NS_ASSUME_NONNULL_BEGIN

@interface Skill : NSObject<IUpgradable> {
    int upgradeMargin;
    
    SkillRange range;
    ResetableLifetime *duration;
    NSMutableArray *statEffects;
    NSMutableArray *conditions;
}

@property (nonatomic, readonly) SkillRange range;
@property (nonatomic, retain) ResetableLifetime *duration;
@property (nonatomic, retain) NSMutableArray *statEffects;
@property (nonatomic, retain) NSMutableArray *conditions;


- (id) initWithValue:(int)theValue range:(SkillRange)theRange duration:(NSTimeInterval)theDuration upgradeMargin:(int)theMargin;

- (void) addStatEffect:(StatEffect*)statEffect;
- (void) addCondition:(Condition*)condition;

@end

NS_ASSUME_NONNULL_END
