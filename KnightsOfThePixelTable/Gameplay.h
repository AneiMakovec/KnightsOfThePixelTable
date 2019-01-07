//
//  Gameplay.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 12/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pixlron.Knights.classes.h"
#import "GameState.h"

NS_ASSUME_NONNULL_BEGIN

@interface Gameplay : GameState {
    //Level *levels[LevelTypes];
    
    Level *currentLevel;
    GameHud *gameHud;
    HumanPlayer *humanPlayer;
    AIPlayer *aiPlayer;
    PhysicsEngine *physics;
    GameRenderer *renderer;
    TurnManager *turnManager;
}

@property (nonatomic, readonly) Level *currentLevel;

@end

NS_ASSUME_NONNULL_END
