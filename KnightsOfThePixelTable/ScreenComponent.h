//
//  ScreenComponent.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 23/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PixEngine.Graphics.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScreenComponent : GameComponent {
    int screenWidth;
    int screenHeight;
    
    NSMutableDictionary *scales;
    Matrix *camera;
    Rectangle *screenBounds;
}

+ (void) initializeWithGame:(Game *)game screenWidth:(int)width screenHeight:(int)height;

+ (TextureStretcher *) getScale:(NSString *)scale;

+ (Rectangle *) getScreenBounds;

+ (Matrix *) getCamera;

@end

NS_ASSUME_NONNULL_END
