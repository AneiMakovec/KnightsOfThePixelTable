//
//  OptionsMenu.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 07/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "OptionsMenu.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Pixlron.Knights.h"

@implementation OptionsMenu

- (void) initialize {
    [super initialize];
    
    // Text
    title = [[Label alloc] initWithFont:retrotype text:@"Options" position:[Vector2 vectorWithX:[Constants backgroundWidth] / 2 y:100]];
    title.horizontalAlign = HorizontalAlignCenter;
    title.verticalAlign = VerticalAlignMiddle;
    [scene addItem:title];
    
    // Buttons
    reset = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth]/2 - 100 y:[Constants battlefieldHeight] width:200 height:50]
                                  background:buttonBackground font:retrotype text:@"Reset progress"];
    [scene addItem:reset];
    
    [scene addItem:back];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    if (reset.wasReleased) {
        // reset game progress
    }
}

- (void) dealloc {
    [title release];
    
    [reset release];
    
    [super dealloc];
}

@end
