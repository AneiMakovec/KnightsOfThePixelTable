//
//  GUIRenderer.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Scene.h"

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface GUIRenderer : DrawableGameComponent {
    SpriteBatch *spriteBatch;
    
    id<IScene> scene;
    
    // Camera
    Matrix *camera;
}

@property (nonatomic, readonly) Matrix *camera;

- (id) initWithGame:(Game*)theGame scene:(id<IScene>)theScene;

@end

NS_ASSUME_NONNULL_END
