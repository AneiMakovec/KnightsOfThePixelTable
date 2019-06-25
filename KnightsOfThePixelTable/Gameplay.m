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

- (id) initWithGame:(Game *)theGame levelType:(LevelType)levelType {
    self = [super initWithGame:theGame];
    if (self != nil) {
        
        // init textures
        [TextureComponent activateWithGame:self.game];
        
        // init level
        switch (levelType) {
            case LevelTypeFarmlands:
                currentLevel = [[FarmlandsLevel alloc] initWithGame:self.game numDices:8];
                break;
                
            case LevelTypeMountains:
                currentLevel = [[MountainsLevel alloc] initWithGame:self.game numDices:8];
                break;
                
            case LevelTypeSeashore:
                currentLevel = [[SeashoreLevel alloc] initWithGame:self.game numDices:8];
                break;
                
            case LevelTypePinewoods:
                currentLevel = [[PinewoodsLevel alloc] initWithGame:self.game numDices:8];
                break;
                
            case LevelTypeFinal:
                currentLevel = [[FarmlandsLevel alloc] initWithGame:self.game numDices:8];
                break;
                
            default:
                currentLevel = [[FarmlandsLevel alloc] initWithGame:self.game numDices:8];
                break;
        }
        
        // init components
        humanPlayer = [[HumanPlayer alloc] initWithGame:self.game level:currentLevel];
        aiPlayer = [[AIPlayer alloc] initWithGame:self.game level:currentLevel];
        physics = [[PhysicsEngine alloc] initWithGame:self.game level:currentLevel playSounds:[knightsGame.progress isSettingEnabled:SettingTypeSound]];
        gameHud = [[GameHud alloc] initWithGame:self.game gameplay:self waves:1];
        turnManager = [[TurnManager alloc] initWithGame:self.game level:currentLevel gameHud:gameHud humanPlayer:humanPlayer aiPlayer:aiPlayer];
        renderer = [[GameRenderer alloc] initWithGame:self.game gameplay:self turnManager:turnManager];
        
        // set correct update order
        humanPlayer.updateOrder = 1;
        aiPlayer.updateOrder = 2;
        turnManager.updateOrder = 3;
        physics.updateOrder = 4;
        currentLevel.updateOrder = 5;
        currentLevel.scene.updateOrder = 6;
        self.updateOrder = 7;
    }
    return self;
}

@synthesize currentLevel;

- (void) activate {
    [self.game.components addComponent:humanPlayer];
    [self.game.components addComponent:aiPlayer];
    [self.game.components addComponent:physics];
    [self.game.components addComponent:gameHud];
    [self.game.components addComponent:currentLevel];
    [self.game.components addComponent:turnManager];
    [self.game.components addComponent:renderer];
}

- (void) deactivate {
    [self.game.components removeComponent:humanPlayer];
    [self.game.components removeComponent:aiPlayer];
    [self.game.components removeComponent:physics];
    [self.game.components removeComponent:currentLevel];
    [gameHud deactivate];
    [self.game.components removeComponent:gameHud];
    [self.game.components removeComponent:turnManager];
    [self.game.components removeComponent:renderer];
    
    [TextureComponent deactivate];
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
        [knightsGame popState];
        [knightsGame popState];
    }
    
    
}



- (void) dealloc {
    [humanPlayer release];
    [aiPlayer release];
    [physics release];
    [currentLevel release];
    [gameHud release];
    [renderer release];
    [turnManager release];
    [super dealloc];
}

@end
