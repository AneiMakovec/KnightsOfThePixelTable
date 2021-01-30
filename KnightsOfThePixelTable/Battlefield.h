//
//  Battlefield.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 17/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PixEngine.Graphics.h"
#import "PixEngine.Scene.Objects.h"
#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface Battlefield : NSObject<ICustomUpdate> {
    // entity data
    NSMutableArray *allyEntities;
    NSMutableArray *enemyEntities;
    
    BattlePosition *enemyFrontRow;
    BattlePosition *enemyBackRow;
    BattlePosition *allyFrontRow;
    BattlePosition *allyBackRow;
}

@property (nonatomic, retain) NSMutableArray *allyEntities;
@property (nonatomic, retain) NSMutableArray *enemyEntities;
@property (nonatomic, retain) BattlePosition *enemyFrontRow;
@property (nonatomic, retain) BattlePosition *enemyBackRow;
@property (nonatomic, retain) BattlePosition *allyFrontRow;
@property (nonatomic, retain) BattlePosition *allyBackRow;


- (void) initialize;

- (Knight *) getAllyAtPosition:(CombatPosition)thePosition;

- (BOOL) containsAlly:(CombatEntity *)theAlly;

- (CombatPosition) getCombatPositionOfAlly:(Knight *)theAlly;

- (void) removeAlly:(Knight *)theAlly;

- (Monster *) getEnemyAtPosition:(CombatPosition)thePosition;

- (BOOL) containsEnemy:(CombatEntity *)theEnemy;

- (CombatPosition) getCombatPositionOfEnemy:(Monster *)theEnemy;

- (void) removeEnemy:(Monster *)theEnemy;

- (void) newWave;

- (BOOL) hasAnyEnemyForAlly:(BOOL)isAlly;

- (BOOL) hasAnyEnemyInFrontRowForAlly:(BOOL)isAlly;

- (BOOL) hasAnyEnemyInBackRowForAlly:(BOOL)isAlly;

- (BOOL) addDice:(Dice *)dice toPosition:(CombatPosition)pos;

@end

NS_ASSUME_NONNULL_END
