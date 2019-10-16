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
    // Buttons
    back = [[GraphicsComponent getDoubleImageButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_RETURN atPosition:[Vector2 vectorWithX:[Constants backgroundWidth] - 50 y:10]] retain];
    [back setScaleUniform:1.5];
    
    [super initialize];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // Update all buttons and upadables.
    Matrix *inverseView = [Matrix invert:renderer.camera];
    for (id item in scene) {
        id<ITouchUpdate> touchUpdatable = [item conformsToProtocol:@protocol(ITouchUpdate)] ? item : nil;
        if (touchUpdatable) {
            [touchUpdatable updateWithInverseView:inverseView];
        }
        
        id<ICustomUpdate> updatable = [item conformsToProtocol:@protocol(ICustomUpdate)] ? item : nil;
        if (updatable) {
            [updatable updateWithGameTime:gameTime];
        }
    }
    
    if (back.wasReleased) {
        [SoundEngine play:SoundEffectTypeClick];
        [knightsGame popState];
    }
}

- (void) dealloc
{
    [back release];
    [scene release];
    [renderer release];
    [super dealloc];
}

@end
