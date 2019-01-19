//
//  AnimatedIndicator.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 18/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Scene.Objects.h"
#import "PixEngine.GUI.h"

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface AnimatedIndicator : NSObject<ISceneUser, ICustomUpdate> {
    id<IScene> scene;
    
    NSTimeInterval duration;
    Vector2 *position;
    
    Texture2D *texture;
    AnimatedImage *animation;
    
    CombatEntity *target;
}

- (id) initWithTexture:(Texture2D*)theTexture position:(Vector2*)thePosition duration:(NSTimeInterval)theDuration;

- (void) loadHitAnimation;
- (void) loadHealAnimation;
- (void) loadStunAnimationWithTarget:(CombatEntity*)target;
- (void) loadBleedAnimation;
- (void) loadPoisonAnimation;
- (void) loadBurnAnimation;
- (void) loadFrostbiteAnimation;
- (void) loadAnimationOfBuff:(StatType)stat;
- (void) loadAnimationOfDebuff:(StatType)stat;

@end

NS_ASSUME_NONNULL_END
