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

NS_ASSUME_NONNULL_BEGIN

@interface HumanPlayer : GameComponent {
    Matrix *inverseView;
    Level *level;
    
    Entity *target;
    
    Dice *selectedDice;
}

- (id) initWithGame:(Game*)theGame level:(Level*)theLevel;

- (void) setCamera:(Matrix *)camera;

- (void) updateWithGameTime:(GameTime*)gameTime;

//- (BOOL) checkIfCanAttack;

@end

NS_ASSUME_NONNULL_END
