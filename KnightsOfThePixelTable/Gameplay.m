//
//  Gameplay.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 12/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Gameplay.h"
#import "Pixlron.Knights.h"

@implementation Gameplay

- (id) initWithGame:(Game *)theGame {
    self = [super initWithGame:theGame];
    if (self != nil) {
        currentLevel = [[Level alloc] initWithGame:self.game numDices:8];
        humanPlayer = [[HumanPlayer alloc] initWithGame:self.game level:currentLevel];
        aiPlayer = [[AIPlayer alloc] initWithGame:self.game level:currentLevel];
        physics = [[PhysicsEngine alloc] initWithGame:self.game level:currentLevel];
        renderer = [[Renderer alloc] initWithGame:self.game gameplay:self battlefield:currentLevel.battlefield];
        
        
        humanPlayer.updateOrder = 0;
        aiPlayer.updateOrder = 1;
        physics.updateOrder = 2;
        currentLevel.updateOrder = 3;
        renderer.updateOrder = 5;
        self.updateOrder = 6;
        
        [self.game.components addComponent:humanPlayer];
        [self.game.components addComponent:aiPlayer];
        [self.game.components addComponent:physics];
        [self.game.components addComponent:currentLevel];
        [self.game.components addComponent:renderer];
    }
    return self;
}

@synthesize currentLevel;

- (void) initialize {
    [humanPlayer setCamera:renderer.camera];
    
    //[self reset];
    [super initialize];
}

- (void) reset {
    
}

- (void) dealloc {
    [self.game.components removeComponent:humanPlayer];
    [self.game.components removeComponent:aiPlayer];
    [self.game.components removeComponent:physics];
    [self.game.components removeComponent:currentLevel];
    [self.game.components removeComponent:renderer];
    
    [humanPlayer release];
    [aiPlayer release];
    [physics release];
    [currentLevel release];
    [renderer release];
    [super dealloc];
}

@end
