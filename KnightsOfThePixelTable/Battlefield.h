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
    
    // entity data
    NSMutableArray *allyEntities;
    NSMutableArray *enemyEntities;
}

@property (nonatomic, retain) NSMutableArray *allyEntities;
@property (nonatomic, retain) NSMutableArray *enemyEntities;


- (id) initWithLevel:(Level *)theLevel;

- (Knight *) getAllyAtPosition:(CombatPosition)thePosition;

- (BOOL) containsAlly:(Knight *)theAlly;

- (Monster *) getEnemyAtPosition:(CombatPosition)thePosition;

- (BOOL) containsEnemy:(Monster *)theEnemy;

- (void) newWave;

@end

NS_ASSUME_NONNULL_END
