//
//  KOTPT.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 26/10/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

#import "PixEngine.Control.h"


NS_ASSUME_NONNULL_BEGIN

@interface KOTPT : Game {
    // Graphics device
    GraphicsDeviceManager *graphics;
    
    // Game states
    NSMutableArray *stateStack;
}

- (void) pushState:(GameState*)gameState;
- (void) popState;

@end

NS_ASSUME_NONNULL_END
