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
    Lvl lvl;
    
    float damage;
    Function function;
    Target target;
    Range range;
    DamageType damageType;
    
    NSMutableArray *conditions;
}

@property (nonatomic, readonly) Lvl lvl;

@property (nonatomic, readonly) float damage;
@property (nonatomic, readonly) Function function;
@property (nonatomic, readonly) Range range;
@property (nonatomic, readonly) Target target;
@property (nonatomic, readonly) DamageType damageType;
@property (nonatomic, retain) NSMutableArray *conditions;


- (id) initWithFunction:(Function)theFunction range:(Range)theRange target:(Target)theTarget damage:(float)dmg damageType:(DamageType)dType;

- (void) addCondition:(ConditionData *)condition;

@end

NS_ASSUME_NONNULL_END
