//
//  DamageIndicator.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 16/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Scene.Objects.h"
#import "PixEngine.GUI.h"

NS_ASSUME_NONNULL_BEGIN

@interface DamageIndicator : NSObject<ISceneUser, ICustomUpdate> {
    id<IScene> scene;
    Label *indicator;
    Lifetime *duration;
}

- (id) initWithAmount:(int)amount position:(Vector2*)position font:(SpriteFont*)font isCrit:(BOOL)isCrit;
- (id) initMissAtPosition:(Vector2*)position font:(SpriteFont*)font;

@end

NS_ASSUME_NONNULL_END
