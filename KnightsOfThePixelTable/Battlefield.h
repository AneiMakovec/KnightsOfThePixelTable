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
    // level
    Level *level;
    
    // Game hud
    GameHud *hud;
    
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


- (id) initWithLevel:(Level *)theLevel;

- (void) initialize;

- (void) setGameHud:(GameHud*)theHud;

- (Knight *) getAllyAtPosition:(CombatPosition)thePosition;

- (BOOL) containsAlly:(CombatEntity *)theAlly;

- (int) getCombatPositionOfAlly:(Knight *)theAlly;

- (void) removeAlly:(Knight *)theAlly;

- (Monster *) getEnemyAtPosition:(CombatPosition)thePosition;

- (BOOL) containsEnemy:(CombatEntity *)theEnemy;

- (int) getCombatPositionOfEnemy:(Monster *)theEnemy;

- (void) removeEnemy:(Monster *)theEnemy;

- (void) newWave;

- (BOOL) hasAnyEnemyForAlly:(BOOL)isAlly;

@end

NS_ASSUME_NONNULL_END
