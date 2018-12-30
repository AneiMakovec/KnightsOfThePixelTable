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
        renderer = [[GameRenderer alloc] initWithGame:self.game gameplay:self];
        //guiRenderer = [[GUIRenderer alloc] initWithGame:self.game scene:gameHud.scene];
        gameHud = [[GameHud alloc] initWithGame:self.game level:currentLevel];
        turnManager = [[TurnManager alloc] initWithGame:self.game level:currentLevel gameHud:gameHud humanPlayer:humanPlayer aiPlayer:aiPlayer];
        
        
        humanPlayer.updateOrder = 1;
        aiPlayer.updateOrder = 2;
        turnManager.updateOrder = 3;
        physics.updateOrder = 4;
        currentLevel.updateOrder = 5;
        currentLevel.scene.updateOrder = 6;
        self.updateOrder = 7;
        
        //guiRenderer.drawOrder = 1;
        
        [self.game.components addComponent:humanPlayer];
        [self.game.components addComponent:aiPlayer];
        [self.game.components addComponent:physics];
        [self.game.components addComponent:currentLevel];
        [self.game.components addComponent:gameHud];
        [self.game.components addComponent:turnManager];
        [self.game.components addComponent:renderer];
        //[self.game.components addComponent:guiRenderer];
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
    [self.game.components removeComponent:gameHud];
    [self.game.components removeComponent:renderer];
    //[self.game.components removeComponent:guiRenderer];
    [self.game.components removeComponent:turnManager];
    
    [humanPlayer release];
    [aiPlayer release];
    [physics release];
    [currentLevel release];
    [gameHud release];
    [renderer release];
    //[guiRenderer release];
    [turnManager release];
    [super dealloc];
}

@end
