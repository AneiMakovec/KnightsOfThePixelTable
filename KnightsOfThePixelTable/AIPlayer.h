//
//  AIPlayer.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PixEngine.Scene.Objects.h"
#import "Pixlron.Knights.classes.h"
#import "IPlayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIPlayer : GameComponent<IPlayer> {
    Level *level;
    
    CombatEntity *target;
    
    // delay for assigning dices
    ResetableLifetime *diceAssignDelay;
    
    // delay for attacking
    ResetableLifetime *attackPhaseDelay;
    
    // delay for attacks
    ResetableLifetime *attackDelay;
    CombatPosition attackPosition;
    
    BOOL myTurn;
    BOOL turnEnded;
    
    // AI state
    AIState state;
    
    // data
    int countDices[StatTypes];
    DamageType ownEntityDamageTypes[CombatPositions];
    DamageType opponentEntityDamageTypes[CombatPositions];
    
    // already assigned dices to entities
    BOOL dicesAssigned[CombatPositions];
    
    // assigned dices
    NSMutableArray *assignedDices;
}

@property (nonatomic, readonly) BOOL turnEnded;

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel;

- (void) startTurnWithNewEntities:(BOOL)newWave;

- (void) pause;

- (void) resume;

@end

NS_ASSUME_NONNULL_END
