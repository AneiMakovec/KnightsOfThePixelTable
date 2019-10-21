//
//  GUIRenderer.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "GUIRenderer.h"

#import "PixEngine.GUI.h"

#import "Pixlron.Knights.h"

@implementation GUIRenderer

- (id) initWithGame:(Game*)theGame scene:(id<IScene>)theScene
{
    self = [super initWithGame:theGame];
    if (self != nil) {
        scene = theScene;
    }
    return self;
}

@synthesize camera;

- (void) initialize {
//    float scaleX = (float)self.game.gameWindow.clientBounds.width / [Constants backgroundWidth];
//    float scaleY = (float)self.game.gameWindow.clientBounds.height / ([Constants battlefieldHeight] + [Constants hudHeight]);
//    camera = [[Matrix createScale:[Vector3 vectorWithX:scaleX y:scaleY z:1]] retain];
    
    camera = [[ScreenComponent getCamera] retain];
    
    [super initialize];
}

- (void) loadContent {
    spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
    [spriteBatch beginWithSortMode:SpriteSortModeBackToFront
                        BlendState:nil
                      SamplerState:[SamplerState pointClamp]
                 DepthStencilState:nil
                   RasterizerState:nil
                            Effect:nil
                   TransformMatrix:camera];
    
    for (id item in scene) {
        Label *label = [item isKindOfClass:[Label class]] ? item : nil;
        Image *image = [item isKindOfClass:[Image class]] ? item : nil;
        AnimatedImage *animation = [item isKindOfClass:[AnimatedImage class]] ? item : nil;
        
        // draw image
        if (image) {
            if (image.drawToRectangle) {
                [spriteBatch draw:image.texture toRectangle:image.drawRectangle fromRectangle:image.sourceRectangle tintWithColor:image.color rotation:image.rotation origin:image.origin effects:SpriteEffectsNone layerDepth:image.layerDepth];
            } else {
                [spriteBatch draw:image.texture to:image.position fromRectangle:image.sourceRectangle tintWithColor:image.color
                         rotation:image.rotation origin:image.origin scale:image.scale effects:SpriteEffectsNone layerDepth:image.layerDepth];
            }
        }
        
        // draw text
        if (label) {
            [spriteBatch drawStringWithSpriteFont:label.font text:label.text to:label.position tintWithColor:label.color
                                         rotation:label.rotation origin:label.origin scale:label.scale effects:SpriteEffectsNone layerDepth:label.layerDepth];
        }
        
        // draw animation
        if (animation) {
            Image *frame = [animation imageWithElapsedTime:gameTime.elapsedGameTime];
            
            // draw only if animation is not finished
            if (frame) {
                [spriteBatch draw:frame.texture to:frame.position fromRectangle:frame.sourceRectangle tintWithColor:frame.color
                         rotation:frame.rotation origin:frame.origin scale:frame.scale effects:SpriteEffectsNone layerDepth:frame.layerDepth];
            }
        }
    }
    
    [spriteBatch end];
}

- (void) unloadContent {
    [spriteBatch release];
    [camera release];
}

@end
