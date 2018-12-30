//
//  GUIRenderer.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "GUIRenderer.h"

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
    float scaleX = (float)self.game.gameWindow.clientBounds.width / [Constants backgroundWidth];
    float scaleY = (float)self.game.gameWindow.clientBounds.height / ([Constants battlefieldHeight] + [Constants hudHeight]);
    camera = [[Matrix createScale:[Vector3 vectorWithX:scaleX y:scaleY z:1]] retain];
    
    [super initialize];
}

- (void) loadContent {
    spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
    [spriteBatch beginWithSortMode:SpriteSortModeDeffered
                        BlendState:nil
                      SamplerState:[SamplerState pointClamp]
                 DepthStencilState:nil
                   RasterizerState:nil
                            Effect:nil
                   TransformMatrix:camera];
    
    for (id item in scene) {
        Label *label = [item isKindOfClass:[Label class]] ? item : nil;
        Image *image = [item isKindOfClass:[Image class]] ? item : nil;
        
        if (label) {
            [spriteBatch drawStringWithSpriteFont:label.font text:label.text to:label.position tintWithColor:label.color
                                         rotation:label.rotation origin:label.origin scale:label.scale effects:SpriteEffectsNone layerDepth:label.layerDepth];
        }
        
        if (image) {
            [spriteBatch draw:image.texture to:image.position fromRectangle:image.sourceRectangle tintWithColor:image.color
                     rotation:image.rotation origin:image.origin scale:image.scale effects:SpriteEffectsNone layerDepth:image.layerDepth];
        }
    }
    
    [spriteBatch end];
}

- (void) unloadContent {
    [spriteBatch release];
}

@end
