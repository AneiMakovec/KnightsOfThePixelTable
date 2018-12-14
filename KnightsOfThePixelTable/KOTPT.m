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
        graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
        
        [self.components addComponent:[[[Gameplay alloc] initWithGame:self] autorelease]];
        
        [SoundEngine initializeWithGame:self];
    }
    return self;
}

- (void) dealloc {
    [graphics release];
    [super dealloc];
}

@end
