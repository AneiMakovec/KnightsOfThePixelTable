//
//  CamelotMenu.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 07/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "CamelotMenu.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Pixlron.Knights.h"

@implementation CamelotMenu

- (void) initialize {
    [super initialize];
    
    // Text
    title = [[Label alloc] initWithFont:retrotype text:@"Cemelot" position:[Vector2 vectorWithX:[Constants backgroundWidth] / 2 y:20]];
    title.horizontalAlign = HorizontalAlignCenter;
    title.verticalAlign = VerticalAlignMiddle;
    [scene addItem:title];
    
    // Buttons
    toBattle = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth] - 250 y:150 width:200 height:50]
                                   background:buttonBackground font:retrotype text:@"To Battle"];
    [scene addItem:toBattle];
    
    seeStats = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:100 y:100 width:200 height:50]
                                      background:buttonBackground font:retrotype text:@"See Stats"];
    [scene addItem:seeStats];
    
    upgradeKnights = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth]/2 - 100 y:50 width:250 height:50]
                                      background:buttonBackground font:retrotype text:@"Upgrade Knights"];
    [scene addItem:upgradeKnights];
    
    assembleParty = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth]/2 - 400 y:[Constants battlefieldHeight] width:250 height:50]
                                      background:buttonBackground font:retrotype text:@"Assemble Party"];
    [scene addItem:assembleParty];
    
    [scene addItem:back];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    GameState *newState = nil;
    
    if (toBattle.wasReleased) {
        newState = [[[Gameplay alloc] initWithGame:self.game] autorelease];
    }
    
    if (newState) {
        [knightsGame pushState:newState];
    }
}

- (void) dealloc {
    [title release];
    
    [toBattle release];
    [seeStats release];
    [upgradeKnights release];
    [assembleParty release];
    
    [super dealloc];
}

@end
