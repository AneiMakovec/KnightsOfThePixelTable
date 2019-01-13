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
    castle = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:200 y:50 width:200 height:50]
                                   background:buttonBackground font:retrotype text:@"Castle"];
    [scene addItem:castle];
    
    commandersPost = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:400 y:150 width:200 height:50]
                                      background:buttonBackground font:retrotype text:@"Commander's post"];
    [scene addItem:commandersPost];
    
    barracks = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:650 y:200 width:200 height:50]
                                            background:buttonBackground font:retrotype text:@"Barracks"];
    [scene addItem:barracks];
    
    gatehouse = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:400 y:150 width:200 height:50]
                                            background:buttonBackground font:retrotype text:@"Gatehouse"];
    [scene addItem:gatehouse];
    
    
    
    [scene addItem:back];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    GameState *newState = nil;
    
    // check for actions
    
    if (newState) {
        [knightsGame pushState:newState];
    }
}

- (void) dealloc {
    [title release];
    
    [castle release];
    [commandersPost release];
    
    [super dealloc];
}

@end
