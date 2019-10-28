//
//  Gameplay.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 12/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Gameplay.h"
#import "Pixlron.Knights.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Media.h"

@implementation Gameplay

- (id) initWithGame:(Game *)theGame {
    self = [super initWithGame:theGame];
    if (self != nil) {
        
        // init textures
        [GameplaySpriteComponent activateWithGame:self.game];
        
        // init level
        [Level initializeWithGame:self.game];
        
        // init game hud
        [GameHud initializeWithGame:self.game];
        
        // init other components
        humanPlayer = [[HumanPlayer alloc] initWithGame:self.game];
        aiPlayer = [[AIPlayer alloc] initWithGame:self.game];
        physics = [[PhysicsEngine alloc] initWithGame:self.game];
        renderer = [[GameRenderer alloc] initWithGame:self.game];
        
        // init turn manager
        [TurnManager initializeWithGame:self.game humanPlayer:humanPlayer aiPlayer:aiPlayer];
        
        // set correct update order
        humanPlayer.updateOrder = 1;
        aiPlayer.updateOrder = 2;
        physics.updateOrder = 4;
        self.updateOrder = 9;
    }
    return self;
}

- (void) activate {
    [Level activate];
    [GameHud activate];
    [TurnManager activate];
    [self.game.components addComponent:humanPlayer];
    [self.game.components addComponent:aiPlayer];
    [self.game.components addComponent:physics];
    [self.game.components addComponent:renderer];
}

- (void) deactivate {
    [Level deactivate];
    [GameHud deactivate];
    [TurnManager deactivate];
    [self.game.components removeComponent:humanPlayer];
    [self.game.components removeComponent:aiPlayer];
    [self.game.components removeComponent:physics];
    [self.game.components removeComponent:renderer];
}


- (void) initialize {
    [super initialize];
//    [humanPlayer setCamera:renderer.camera];
    
    // play music
//    Song *song = [self.game.content load:@"music_battle"];
//    [MediaPlayer playSong:song];
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    if (gameHud.endDungeon) {
        [GameProgress setFinishedDungeon:YES];
        
        // return to town
        [knightsGame popState];
        [knightsGame popState];
    }
    
    
}



- (void) dealloc {
    [humanPlayer release];
    [aiPlayer release];
    [physics release];
    [renderer release];
    [super dealloc];
}

@end
