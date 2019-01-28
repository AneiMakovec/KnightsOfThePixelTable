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
    background = [[Image alloc] initWithTexture:[self.game.content load:BACKGROUND_MAIN_MENU] position:[Vector2 vectorWithX:0 y:0]];
    [scene addItem:background];
    
    // Buttons
    play = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth]/2 - 50 y:[Constants battlefieldHeight] width:100 height:50]
                                     background:buttonBackground font:retrotype text:@"Play"];
    [scene addItem:play];
    
    options = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth]/2 - 50 y:[Constants battlefieldHeight] + 70 width:100 height:50]
                                     background:buttonBackground font:retrotype text:@"Options"];
    [scene addItem:options];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    GameState *newState = nil;
    
    if (play.wasReleased) {
        newState = [[[CamelotMenu alloc] initWithGame:self.game] autorelease];
    } else if (options.wasReleased) {
        newState = [[[OptionsMenu alloc] initWithGame:self.game] autorelease];
    }
    
    if (newState) {
        [knightsGame pushState:newState];
    }
}

- (void) dealloc {
    [play release];
    
    [super dealloc];
}


@end
