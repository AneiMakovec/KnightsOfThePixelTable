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
    
    Rectangle *bounds;
    Rectangle *dicePool;
    
    BOOL music_played;
    
    int num_of_dices;
    
    NSArray *allies;
    NSArray *enemies;
    Vector2 *allyPositions[CombatPositions];
    Vector2 *enemyPositions[CombatPositions];
}

@property (nonatomic, readonly) SimpleScene *scene;

@property (nonatomic, readonly) Rectangle *bounds;

@property (nonatomic, readonly) Rectangle *dicePool;

@property (nonatomic, readonly) int num_of_dices;


- (id) initWithGame:(Game *)theGame numDices:(int) numDices;

- (void) reset;

- (void) setAllyPosition:(CombatPosition)theAllyPosition toPosition:(Vector2 *)thePosition;

- (void) setEnemyPosition:(CombatPosition)theEnemyPosition toPosition:(Vector2 *)thePosition;

@end

NS_ASSUME_NONNULL_END
