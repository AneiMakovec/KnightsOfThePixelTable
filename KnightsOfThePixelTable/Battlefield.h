//
//  Battlefield.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 17/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PixEngine.Graphics.h"
#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface Battlefield : NSObject {
    // background scale
    TextureStretcher *stretcher;
    
    // level
    Level *level;
    
    // entity data
    NSMutableArray *allyEntities;
    NSMutableArray *enemyEntities;
    NSMutableArray *allyPositions;
    NSMutableArray *enemyPositions;
    
    // entity boxes
    NSMutableArray *enemyBounds;
    NSMutableArray *allyBounds;
    NSMutableArray *comboBounds;
}

@property (nonatomic, retain) NSMutableArray *allyEntities;
@property (nonatomic, retain) NSMutableArray *enemyEntities;
@property (nonatomic, retain) NSMutableArray *allyPositions;
@property (nonatomic, retain) NSMutableArray *enemyPositions;
@property (nonatomic, retain) NSMutableArray *enemyBounds;
@property (nonatomic, retain) NSMutableArray *allyBounds;
@property (nonatomic, retain) NSMutableArray *comboBounds;

- (id) initWithLevel:(Level *)theLevel width:(int)theWidth height:(int)theHeight;

- (Knight *) getAllyAtPosition:(CombatPosition)thePosition;

- (BOOL) containsAlly:(Knight *)theAlly;

- (Knight *) getEnemyAtPosition:(CombatPosition)thePosition;

- (BOOL) containsEnemy:(Knight *)theEnemy;

- (Vector2 *) getPositionOfAlly:(CombatPosition)theAlly;

- (Vector2 *) getPositionOfEnemy:(CombatPosition)theEnemy;

- (Rectangle *) getBoundsOfEnemy:(CombatPosition)theEnemy;

- (Rectangle *) getBoundsOfAlly:(CombatPosition)theAlly;

- (Rectangle *) getComboBoundsOfAlly:(CombatPosition)theAlly;

@end

NS_ASSUME_NONNULL_END
