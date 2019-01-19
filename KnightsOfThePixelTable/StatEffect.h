//
//  StatEffect.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 15/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Scene.Objects.h"

#import "Pixlron.Knights.classes.h"

#import "KOTPTEnums.h"
#import "IUpgradable.h"

NS_ASSUME_NONNULL_BEGIN

@interface StatEffect : NSObject<IUpgradable> {
    int duration;
    
    BOOL active;
    
    int chance;
    
    int chanceUpgradeMargin;
    
    CombatEntity *target;
}

@property (nonatomic, readonly) int duration;
@property (nonatomic, readonly) BOOL active;
@property (nonatomic, readonly) int chance;

- (id) initWithDuration:(int)theDuration chance:(int)theChance chanceUpgradeMargin:(int)theChanceMargin;

- (void) activateWithTarget:(CombatEntity*)theTarget;
- (void) deactivate;

- (void) increaseDuration;
- (void) decreaseDuration;

- (void) update;

@end

NS_ASSUME_NONNULL_END
