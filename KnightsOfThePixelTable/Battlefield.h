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
    TextureStretcher *battleStretcher;
    
    // hud scale
    TextureStretcher *hudStretcher;
    
    // level
    Level *level;
    
    // entity data
    NSMutableArray *allyEntities;
    NSMutableArray *enemyEntities;
    NSMutableArray *allyPositions;
    NSMutableArray *enemyPositions;
    
    // entity areas
    NSMutableArray *enemyAreas;
    NSMutableArray *allyAreas;
    NSMutableArray *comboAreas;
}

@property (nonatomic, retain) NSMutableArray *allyEntities;
@property (nonatomic, retain) NSMutableArray *enemyEntities;
@property (nonatomic, retain) NSMutableArray *allyPositions;
@property (nonatomic, retain) NSMutableArray *enemyPositions;
@property (nonatomic, retain) NSMutableArray *enemyAreas;
@property (nonatomic, retain) NSMutableArray *allyAreas;
@property (nonatomic, retain) NSMutableArray *comboAreas;

- (id) initWithLevel:(Level *)theLevel;

- (Knight *) getAllyAtPosition:(CombatPosition)thePosition;

- (BOOL) containsAlly:(Knight *)theAlly;

- (Knight *) getEnemyAtPosition:(CombatPosition)thePosition;

- (BOOL) containsEnemy:(Knight *)theEnemy;

- (Vector2 *) getPositionOfAlly:(CombatPosition)theAlly;

- (Vector2 *) getPositionOfEnemy:(CombatPosition)theEnemy;

- (Rectangle *) getAreaOfEnemy:(CombatPosition)theEnemy;

- (Rectangle *) getAreaOfAlly:(CombatPosition)theAlly;

- (Rectangle *) getComboAreaOfAlly:(CombatPosition)theAlly;

@end

NS_ASSUME_NONNULL_END
