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

NS_ASSUME_NONNULL_BEGIN

@interface StatEffect : NSObject {
    int duration;
    
    BOOL active;
    
    CombatEntity *target;
}

@property (nonatomic, readonly) int duration;
@property (nonatomic, readonly) BOOL active;

- (id) initWithDuration:(int)theDuration;

- (void) activateWithTarget:(CombatEntity*)theTarget;
- (void) deactivate;

- (void) update;

@end

NS_ASSUME_NONNULL_END
