//
//  MainMenu.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 07/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "MainMenu.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Pixlron.Knights.h"

@implementation MainMenu

- (void) initialize {
    [super initialize];
    
    // Background
    background = [[GraphicsComponent getImageWithKey:MAIN_MENU_BACKGROUND atPosition:[Vector2 vectorWithX:0 y:0]] retain];
    background.layerDepth = 0.3;
    [scene addItem:background];
    
    // Buttons
    newGame = [[GraphicsComponent getDoubleImageLabelButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_DEFAULT atPosition:[Vector2 vectorWithX:[Constants backgroundWidth]/2 - 50 y:[Constants battlefieldHeight]] text:@"New game"] retain];
    newGame.label.layerDepth = 0.1;
    newGame.pressedImage.layerDepth = 0.2;
    newGame.notPressedImage.layerDepth = 0.2;
    [newGame setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
    [scene addItem:newGame];

    continueGame = [[GraphicsComponent getDoubleImageLabelButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_DEFAULT atPosition:[Vector2 vectorWithX:[Constants backgroundWidth]/2 - 50 y:[Constants battlefieldHeight] + 70] text:@"Continue"] retain];
    continueGame.label.layerDepth = 0.1;
    continueGame.pressedImage.layerDepth = 0.2;
    continueGame.notPressedImage.layerDepth = 0.2;
    [continueGame setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
    [scene addItem:continueGame];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    GameState *newState = nil;

    if (newGame.wasReleased) {
        [SoundEngine play:SoundEffectTypeClick];
    } else if (continueGame.wasReleased) {
        [SoundEngine play:SoundEffectTypeClick];
        newState = [[[TownMenu alloc] initWithGame:self.game] autorelease];
    }

    if (newState) {
        [knightsGame pushState:newState];
    }
}

- (void) dealloc {
    [newGame release];
    [continueGame release];
    
    [super dealloc];
}


@end
