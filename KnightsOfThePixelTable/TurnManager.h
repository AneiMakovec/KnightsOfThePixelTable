//
//  TurnManager.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 26/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pixlron.Knights.classes.h"
#import "PixEngine.Scene.Objects.h"

NS_ASSUME_NONNULL_BEGIN

@interface TurnManager : GameComponent {
    Level *level;
    ResetableLifetime *turnDelay;
    
    HumanPlayer *player;
    AIPlayer *aiPlayer;
    
    BOOL playersTurn;
}

@property (nonatomic, readonly) BOOL playersTurn;

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel humanPlayer:(HumanPlayer *)hPlayer aiPlayer:(AIPlayer *)theAiPlayer;

@end

NS_ASSUME_NONNULL_END
