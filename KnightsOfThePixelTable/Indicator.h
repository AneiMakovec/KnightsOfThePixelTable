//
//  Indicator.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 16/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Scene.Objects.h"
#import "PixEngine.GUI.h"

NS_ASSUME_NONNULL_BEGIN

@interface Indicator : NSObject<ISceneUser, ICustomUpdate> {
    id<IScene> scene;
    Label *indicator;
    Lifetime *duration;
    
    float scale;
    float opacity;
}

- (id) initWithText:(NSString*)text position:(Vector2*)position font:(SpriteFont*)font color:(Color*)color duration:(float)theDuration;

@end

NS_ASSUME_NONNULL_END
