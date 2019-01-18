//
//  AnimatedIndicator.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 18/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Graphics.h"
#import "PixEngine.Scene.Objects.h"
#import "PixEngine.GUI.h"

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface AnimatedIndicator : NSObject<ISceneUser, ICustomUpdate> {
    id<IScene> scene;
    
    NSTimeInterval duration;
    
    Texture2D *texture;
    AnimatedSprite *animation;
    
    Image *image;
    
    CombatEntity *target;
}

- (id) initWithTexture:(Texture2D*)theTexture position:(Vector2*)position duration:(NSTimeInterval)theDuration;

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
