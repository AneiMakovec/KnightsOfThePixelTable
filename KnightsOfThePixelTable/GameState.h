//
//  GameState.h
//  KnightsOfThePixelTable
//
//  Created by Matej Jan on 22.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameState : GameComponent {
    KOTPT *knightsGame;
}

- (void) activate;
- (void) deactivate;

@end

NS_ASSUME_NONNULL_END
