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
        
        // init constants data
        [Constants initializeWithGame:self];
        
        // load graphics
        [GraphicsComponent initializeWithGame:self];
        
        // init sound engine
        [SoundEngine initializeWithGame:self];
        
        // init camera
        [ScreenComponent initializeWithGame:self screenWidth:[Constants backgroundWidth] screenHeight:[Constants battlefieldHeight] + [Constants hudHeight]];
        
        // init touch panel helper
        [self.components addComponent:[[[TouchPanelHelper alloc] initWithGame:self] autorelease]];
        
        // init state stack
        stateStack = [[NSMutableArray alloc] init];
        
        // load game progress
        progress = [[GameProgress loadProgress] retain];
    }
    return self;
}

@synthesize progress;

- (void) initialize {
    // start in main menu
    MainMenu *mainMenu = [[[MainMenu alloc] initWithGame:self] autorelease];
    [self pushState:mainMenu];
    
    // debug - start in gameplay
//    Gameplay *gameplay = [[[Gameplay alloc] initWithGame:self] autorelease];
//    [self pushState:gameplay];
    
    // initializa all components
    [super initialize];
}

- (void) pushState:(GameState *)gameState {
    GameState *currentActiveState = [stateStack lastObject];
    [currentActiveState deactivate];
    [self.components removeComponent:currentActiveState];
    
    [stateStack addObject:gameState];
    [self.components addComponent:gameState];
    [gameState activate];
}

- (void) popState {
    GameState *currentActiveState = [stateStack lastObject];
    [stateStack removeLastObject];
    [currentActiveState deactivate];
    [self.components removeComponent:currentActiveState];
    
    currentActiveState = [stateStack lastObject];
    [self.components addComponent:currentActiveState];
    [currentActiveState activate];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
    [self.graphicsDevice clearWithColor:[Color gray]];
    [super drawWithGameTime:gameTime];
}

- (void) dealloc {
    [graphics release];
    [super dealloc];
}

@end
