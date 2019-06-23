//
//  DungeonEndInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "DungeonEndInterface.h"

#import "Pixlron.Knights.h"

@implementation DungeonEndInterface

- (id) initWithHud:(GameHud *)theHud contentManager:(ContentManager *)manager font:(SpriteFont *)font backgroundTextures:(NSMutableArray *)textures camera:(Matrix *)camera win:(BOOL)win {
    self = [super initWithCamera:camera];
    if (self != nil) {
        hud = theHud;
        
        // init background
        background = [[CompositeImage alloc] initWithImageTextures:textures color:[Color saddleBrown] x:370 y:150 width:300 height:100];
        [items addObject:background];
        
        // init message
        NSString *message;
        if (win)
            message = @"WIN";
        else
            message = @"DEFEAT";
        
        Label *text = [[Label alloc] initWithFont:font text:message position:[Vector2 vectorWithX:520 y:180]];
        text.color = [Color white];
        text.horizontalAlign = HorizontalAlignCenter;
        text.verticalAlign = VerticalAlignMiddle;
        [text setScaleUniform:1.0f];
        [text setLayerDepth:-0.1f];
        [items addObject:text];
        [text release];
        
        // init button
        confirmButton = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:465 y:210 width:30 height:30] background:[manager load:BUTTON_CONFIRM]];
        [items addObject:confirmButton];
    }
    return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // super call
    [super updateWithGameTime:gameTime];
    
    // check if buttons pressed
    if (confirmButton.wasReleased) {
        [hud finishDungeon];
        [scene removeItem:self];
    }
}

- (void) dealloc {
    [background release];
    [confirmButton release];
    
    [super dealloc];
}

@end
