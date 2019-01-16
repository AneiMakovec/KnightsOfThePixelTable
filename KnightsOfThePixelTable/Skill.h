//
//  Skill.h
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
    float upgradeMargin;
    float damage;
    
    SkillRange range;
    ResetableLifetime *duration;
    NSMutableArray *statEffects;
}

@property (nonatomic, readonly) float damage;
@property (nonatomic, readonly) SkillRange range;
@property (nonatomic, retain) ResetableLifetime *duration;
@property (nonatomic, retain) NSMutableArray *statEffects;


- (id) initWithDamage:(float)dmg range:(SkillRange)theRange duration:(NSTimeInterval)theDuration upgradeMargin:(float)theMargin;

- (void) addStatEffect:(StatEffect*)statEffect;

@end

NS_ASSUME_NONNULL_END
