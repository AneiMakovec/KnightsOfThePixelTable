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
        
        // init touch panel helper
        [self.components addComponent:[[[TouchPanelHelper alloc] initWithGame:self] autorelease]];
        
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
