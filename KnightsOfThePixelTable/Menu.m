//
//  Menu.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 07/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "Menu.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

#import "Pixlron.Knights.h"

@implementation Menu

- (id) initWithGame:(Game *)theGame
{
    self = [super initWithGame:theGame];
    if (self != nil) {
        scene = [[SimpleScene alloc] initWithGame:self.game];
        renderer = [[GUIRenderer alloc] initWithGame:self.game scene:scene];
    }
    return self;
}

- (void) activate {
    [self.game.components addComponent:scene];
    [self.game.components addComponent:renderer];
}

- (void) deactivate {
    [self.game.components removeComponent:scene];
    [self.game.components removeComponent:renderer];
}

- (void) initialize {
    // Fonts
    FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
    retrotype = [self.game.content load:FONT processor:fontProcessor];
    
    // Buttons
    buttonBackground = [self.game.content load:BUTTON_BACKGROUND];
    
    Texture2D *backButtonTexture = [self.game.content load:BUTTON_BACK];
    back = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth] - 50 y:10 width:40 height:40]
                                  background:backButtonTexture];
    
    [super initialize];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // Update all buttons.
    Matrix *inverseView = [Matrix invert:renderer.camera];
    for (id item in scene) {
        Button *button = [item isKindOfClass:[Button class]] ? item : nil;
        if (button) {
            [button updateWithInverseView:inverseView];
        }
    }
    
    if (back.wasReleased) {
        [knightsGame popState];
    }
}

- (void) dealloc
{
    [back release];
    [buttonBackground release];
    [retrotype release];
    [scene release];
    [renderer release];
    [super dealloc];
}

@end
