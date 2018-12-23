//
//  KOTPT.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 26/10/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "KOTPT.h"

#import "Pixlron.Knights.h"

@implementation KOTPT

- (id) init {
    self = [super init];
    if (self) {
        // init graphics device
        graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
        
        // init sound engine
        [SoundEngine initializeWithGame:self];
        
        // init screen scale
        [ScreenComponent initializeWithGame:self screenWidth:1000 screenHeight:1000];
        
        // create gameplay and add it to components
        [self.components addComponent:[[[Gameplay alloc] initWithGame:self] autorelease]];
    }
    return self;
}

- (void) dealloc {
    [graphics release];
    [super dealloc];
}

@end
