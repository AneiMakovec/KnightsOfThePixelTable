//
//  Level.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PixEngine.Scene.Objects.h"
#import "PixEngine.Scene.h"
#import "PixEngine.Math.h"
#import "PixEngine.Utilities.h"
#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface Level : GameComponent {
    LevelType levelType;
    
    SimpleScene *scene;
    Battlefield *battlefield;
    Dicepool *dicepool;
    
    int num_of_dices;
}

@property (nonatomic, readonly) SimpleScene *scene;

@property (nonatomic, retain) Battlefield *battlefield;

@property (nonatomic, retain) Dicepool *dicepool;

@property (nonatomic, readonly) int num_of_dices;

@property (nonatomic, readonly) LevelType levelType;


- (id) initWithGame:(Game *)theGame numDices:(int) numDices;

- (void) reset;

@end

NS_ASSUME_NONNULL_END
