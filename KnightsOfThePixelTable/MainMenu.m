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
    background = [GraphicsComponent getImageWithKey:MAIN_MENU_BACKGROUND atPosition:[Vector2 vectorWithX:0 y:0]];
    background.layerDepth = 0.3;
    [scene addItem:background];
    
    // Buttons
    newGame = [GraphicsComponent getDoubleImageLabelButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_DEFAULT atPosition:[Constants getPositionDataForKey:POSITION_MAIN_MENU_NEW_GAME] text:[Constants getTextForKey:TEXT_MAIN_MENU_NEW_GAME]];
    newGame.label.layerDepth = 0.1;
    newGame.pressedImage.layerDepth = 0.2;
    newGame.notPressedImage.layerDepth = 0.2;
    [newGame setScaleUniform:FONT_SCALE_MAIN_MENU];
    [scene addItem:newGame];

    continueGame = [GraphicsComponent getDoubleImageLabelButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_DEFAULT atPosition:[Constants getPositionDataForKey:POSITION_MAIN_MENU_CONTINUE] text:[Constants getTextForKey:TEXT_MAIN_MENU_CONTINUE]];
    continueGame.label.layerDepth = 0.1;
    continueGame.pressedImage.layerDepth = 0.2;
    continueGame.notPressedImage.layerDepth = 0.2;
    [continueGame setScaleUniform:FONT_SCALE_MAIN_MENU];
    [scene addItem:continueGame];
    
    [SoundEngine playSong:SongTypeMainMenu];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    GameState *newState = nil;

    if (newGame.wasReleased) {
        [SoundEngine play:SoundEffectTypeClick];
        newState = [[[InterfaceMenu alloc] initWithGame:self.game] autorelease];
    } else if (continueGame.wasReleased) {
        [SoundEngine play:SoundEffectTypeClick];
        newState = [[[TownMenu alloc] initWithGame:self.game] autorelease];
//        newState = [[[WorldMenu alloc] initWithGame:self.game] autorelease];
        [GameProgress setFinishedDungeon:YES];
    }

    if (newState) {
        [knightsGame pushState:newState];
    }
}

- (void) dealloc {
    [background release];
    [newGame release];
    [continueGame release];
    
    [super dealloc];
}


@end
