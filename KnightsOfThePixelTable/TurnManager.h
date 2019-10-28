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
    ResetableLifetime *turnDelay;
    
    HumanPlayer *player;
    AIPlayer *aiPlayer;
    
    BOOL paused;
    
    BOOL playersTurn;
}

@property (nonatomic, readonly) BOOL playersTurn;

+ (void) initializeWithGame:(Game *)game humanPlayer:(HumanPlayer *)player aiPlayer:(AIPlayer *)aiPlayer;

+ (void) activate;

+ (void) deactivate;




- (id) initWithGame:(Game *)theGame humanPlayer:(HumanPlayer *)hPlayer aiPlayer:(AIPlayer *)theAiPlayer;

@end

NS_ASSUME_NONNULL_END
