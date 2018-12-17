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
    
    // entity data
    NSMutableArray *allyEntities;
    NSMutableArray *enemyEntities;
    NSMutableArray *allyPositions;
    NSMutableArray *enemyPositions;
}

@property (nonatomic, retain) NSMutableArray *allyEntities;
@property (nonatomic, retain) NSMutableArray *enemyEntities;
@property (nonatomic, retain) NSMutableArray *allyPositions;
@property (nonatomic, retain) NSMutableArray *enemyPositions;

- (id) initWithWidth:(int)theWidth height:(int)theHeight firstAlly:(KnightType)theFirstAlly secondAlly:(KnightType)theSecondAlly thirdAlly:(KnightType)theThirdAlly fourthAlly:(KnightType)theFourthAlly firstEnemy:(MonsterType)theFirstEnemy secondEnemy:(MonsterType)theSecondEnemy thirdEnemy:(MonsterType)theThirdEnemy fourthEnemy:(MonsterType)theFourthEnemy;

- (Knight *) getAllyAtPosition:(CombatPosition)thePosition;

- (BOOL) containsAlly:(Knight *)theAlly;

- (Knight *) getEnemyAtPosition:(CombatPosition)thePosition;

- (BOOL) containsEnemy:(Knight *)theEnemy;

- (Vector2 *) getPositionOfAlly:(CombatPosition)theAlly;

- (Vector2 *) getPositionOfEnemy:(CombatPosition)theEnemy;

@end

NS_ASSUME_NONNULL_END
