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
    SimpleScene *scene;
    Battlefield *battlefield;
    
    Rectangle *bounds;
    Rectangle *dicePool;
    
    BOOL music_played;
    
    int num_of_dices;
}

@property (nonatomic, readonly) SimpleScene *scene;

@property (nonatomic, readonly) Battlefield *battlefield;

@property (nonatomic, readonly) Rectangle *bounds;

@property (nonatomic, readonly) Rectangle *dicePool;

@property (nonatomic, readonly) int num_of_dices;


- (id) initWithGame:(Game *)theGame numDices:(int) numDices;

- (void) reset;

@end

NS_ASSUME_NONNULL_END
