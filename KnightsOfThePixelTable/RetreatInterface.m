//
//  RetreatInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "RetreatInterface.h"

#import "Pixlron.Knights.h"

@implementation RetreatInterface

- (id) initWithHud:(GameHud *)theHud contentManager:(ContentManager *)manager font:(SpriteFont *)font backgroundTextures:(NSMutableArray *)textures camera:(Matrix *)camera {
    self = [super initWithCamera:camera];
    if (self != nil) {
        hud = theHud;
        
        // init background
//        background = [[CompositeImage alloc] initWithImageTextures:textures color:[Color saddleBrown] x:370 y:150 width:300 height:100];
//        [items addObject:background];
        
        // init message
        Label *text = [[Label alloc] initWithFont:font text:@"Retreat from battle?" position:[Vector2 vectorWithX:520 y:180]];
        text.color = [Color white];
        text.horizontalAlign = HorizontalAlignCenter;
        text.verticalAlign = VerticalAlignMiddle;
        [text setScaleUniform:1.0f];
        [items addObject:text];
        [text release];
        
        // init buttons
        confirmButton = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:465 y:210 width:30 height:30] background:[manager load:BUTTON_CONFIRM]];
        [items addObject:confirmButton];
        
        denyButton = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:545 y:210 width:30 height:30] background:[manager load:BUTTON_DENY]];
        [items addObject:denyButton];
    }
    return self;
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    // super call
    [super updateWithGameTime:gameTime];
    
    // check if buttons pressed
    if (confirmButton.wasReleased) {
        [hud endGameplay];
        [scene removeItem:self];
    } else if (denyButton.wasReleased) {
        [hud resumeGame];
        [scene removeItem:self];
    }
}



- (void) dealloc {
//    [background release];
    [confirmButton release];
    [denyButton release];
    
    [super dealloc];
}

@end
