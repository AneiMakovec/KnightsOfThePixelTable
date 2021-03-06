//
//  HumanPlayer.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Input.Touch.h"
#import "PixEngine.Scene.Objects.h"
#import "Pixlron.Knights.classes.h"
#import "IPlayer.h"

#import "PixEngine.GUI.h"

NS_ASSUME_NONNULL_BEGIN

@interface HumanPlayer : GameComponent<IPlayer> {
    Matrix *inverseView;
    
    CombatEntity *target;
    
    Dice *selectedDice;
    
    BOOL myTurn;
    
    ReleaseArea *comboAreas[CombatPositions];
}

- (id) initWithGame:(Game*)theGame;

- (void) setCamera:(Matrix *)camera;

- (void) updateWithGameTime:(GameTime*)gameTime;

- (void) pause;

- (void) resume;

@end

NS_ASSUME_NONNULL_END
