//
//  Interface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "Interface.h"

#import "Pixlron.Knights.h"

@implementation Interface

- (id) initToRectangle:(Rectangle *)rect camera:(Matrix *)camera {
    self = [super initWithCamera:camera];
    if (self != nil) {
        background = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceBackground] toRectangle:rect];
        [items addObject:background];
        
        closeButton = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:rect.x - 50 y:rect.y + 10 width:40 height:40] background:[CamelotTextureComponent getCloseButtonBackground]];
        [items addObject:closeButton];
    }
    return self;
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    if ([closeButton wasReleased]) {
        [scene removeItem:self];
    }
}

- (void) dealloc {
    [background release];
    [closeButton release];
    
    [super dealloc];
}

@end
