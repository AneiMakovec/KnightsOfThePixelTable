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

    // Text
    title = [[Label alloc] initWithFont:retrotype text:@"Knights of the Pixel Table" position:[Vector2 vectorWithX:[Constants backgroundWidth] / 2 y:100]];
    title.horizontalAlign = HorizontalAlignCenter;
    title.verticalAlign = VerticalAlignMiddle;
    [scene addItem:title];
    
    // Buttons
    play = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth]/2 - 50 y:[Constants battlefieldHeight] width:100 height:50]
                                     background:buttonBackground font:retrotype text:@"Play"];
    [scene addItem:play];
    
    options = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth]/2 - 50 y:[Constants battlefieldHeight] + 70 width:100 height:50]
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
    [title release];
    
    [play release];
    
    [super dealloc];
}


@end
