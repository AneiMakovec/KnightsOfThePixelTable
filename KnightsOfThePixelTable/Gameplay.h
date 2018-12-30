//
//  Gameplay.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 12/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface Gameplay : GameComponent {
    //Level *levels[LevelTypes];
    Level *currentLevel;
    GameHud *gameHud;
    HumanPlayer *humanPlayer;
    AIPlayer *aiPlayer;
    PhysicsEngine *physics;
    GameRenderer *renderer;
    //GUIRenderer *guiRenderer;
    TurnManager *turnManager;
    
    //int num_of_dices;
}

@property (nonatomic, readonly) Level *currentLevel;

- (void) reset;

@end

NS_ASSUME_NONNULL_END
