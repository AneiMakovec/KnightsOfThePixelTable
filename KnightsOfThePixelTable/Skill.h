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
    int maxSkillLevel;
    int currentSkillLevel;
    
    float upgradeMargin;
    float damage;
    
    SkillUseOn useOn;
    BOOL additionalEffects[SkillEffects];
    SkillFunction function;
    SkillTarget target;
    SkillRange range;
    ResetableLifetime *duration;
    NSMutableArray *statEffects;
}

@property (nonatomic, readonly) float damage;
@property (nonatomic, readonly) SkillUseOn useOn;
@property (nonatomic, readonly) SkillFunction function;
@property (nonatomic, readonly) SkillRange range;
@property (nonatomic, readonly) SkillTarget target;
@property (nonatomic, retain) ResetableLifetime *duration;
@property (nonatomic, retain) NSMutableArray *statEffects;


- (id) initWithFunction:(SkillFunction)theFunction range:(SkillRange)theRange target:(SkillTarget)theTarget useOn:(SkillUseOn)theUseOn damage:(float)dmg duration:(NSTimeInterval)theDuration upgradeMargin:(float)theMargin;

- (void) addStatEffect:(StatEffect*)statEffect;

- (void) setEffect:(SkillEffect)effect;
- (BOOL) hasEffect:(SkillEffect)effect;

- (BOOL) isMaxLevel;

@end

NS_ASSUME_NONNULL_END
