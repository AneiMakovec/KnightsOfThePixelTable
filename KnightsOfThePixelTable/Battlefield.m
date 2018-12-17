//
//  Battlefield.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 17/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Battlefield.h"
#import "Pixlron.Knights.h"

@implementation Battlefield

- (id) initWithWidth:(int)theWidth height:(int)theHeight firstAlly:(KnightType)theFirstAlly secondAlly:(KnightType)theSecondAlly thirdAlly:(KnightType)theThirdAlly fourthAlly:(KnightType)theFourthAlly firstEnemy:(MonsterType)theFirstEnemy secondEnemy:(MonsterType)theSecondEnemy thirdEnemy:(MonsterType)theThirdEnemy fourthEnemy:(MonsterType)theFourthEnemy {
    
    self = [super init];
    if (self != nil) {
        allyEntities = [NSMutableArray arrayWithCapacity:CombatPositions];
        enemyEntities = [NSMutableArray arrayWithCapacity:CombatPositions];
        
        allyPositions = [NSMutableArray arrayWithCapacity:CombatPositions];
        enemyPositions = [NSMutableArray arrayWithCapacity:CombatPositions];
        
        for (int i = 0; i < CombatPositions; i++) {
            allyPositions[i] = [[Vector2 alloc] init];
            enemyPositions[i] = [[Vector2 alloc] init];
        }
        
        // create scale
        int hudOffset = theHeight * 0.625;
        stretcher = [[TextureStretcher alloc] initFromWidth:256.0f fromHeight:80.0f toWidth:(float)theWidth toHeight:(float)hudOffset xOffset:0 yOffset:0];
        
        Vector2 *tempV;
        // calculate positions for ally and enemy entities
        // 1. ally
        tempV = (Vector2 *)allyPositions[FirstCombatPosition];
        tempV.x = 77;
        tempV.y = 46;
        [stretcher scalePosition:tempV];
        
        // 2. ally
        tempV = (Vector2 *)allyPositions[SecondCombatPosition];
        tempV.x = 64;
        tempV.y = 62;
        [stretcher scalePosition:tempV];
        
        // 3. ally
        tempV = (Vector2 *)allyPositions[ThirdCombatPosition];
        tempV.x = 38;
        tempV.y = 46;
        [stretcher scalePosition:tempV];
        
        // 4. ally
        tempV = (Vector2 *)allyPositions[FourthCombatPosition];
        tempV.x = 26;
        tempV.y = 62;
        [stretcher scalePosition:tempV];
        
        
        // 1. enemy
        tempV = (Vector2 *)enemyPositions[FirstCombatPosition];
        Vector2 *tempVV = (Vector2 *)allyPositions[FirstCombatPosition];
        tempV.x = theWidth - tempVV.x;
        tempV.y = tempVV.y;
         
        /*
        
        // 2. enemy
        tempV = (Vector2 *)enemyPositions[SecondCombatPosition];
        enemyPositions[FirstCombatPosition].x = gameplay.currentLevel.bounds.width - allyPositions[FirstCombatPosition].x;
        enemyPositions[FirstCombatPosition].y = allyPositions[FirstCombatPosition].y;
        
        // 3. enemy
        tempV = (Vector2 *)enemyPositions[ThirdCombatPosition];
        enemyPositions[FirstCombatPosition].x = gameplay.currentLevel.bounds.width - allyPositions[FirstCombatPosition].x;
        enemyPositions[FirstCombatPosition].y = allyPositions[FirstCombatPosition].y;
        
        // 4. enemy
        tempV = (Vector2 *)enemyPositions[FourthCombatPosition];
        enemyPositions[FirstCombatPosition].x = gameplay.currentLevel.bounds.width - allyPositions[FirstCombatPosition].x;
        enemyPositions[FirstCombatPosition].y = allyPositions[FirstCombatPosition].y;
         */
        
        
        // add the entities
        Knight *lancelot = [[Knight alloc] initWithKnightType:KnightTypeLancelot health:100 damageStrength:0.85 maxRadius:60];
        [lancelot.stats insertObject:[NSNumber numberWithInteger:30] atIndex:Strength];
        [lancelot.attackDamage insertObject:[NSNumber numberWithInt:30] atIndex:BasicAttack];
        ResetableLifetime *time1 = [[ResetableLifetime alloc] initWithStart:0 duration:0.2];
        [lancelot.attackDuration insertObject:time1 atIndex:BasicAttack];
        lancelot.origin = [[BattlePosition alloc] initWithRadius:5];
        lancelot.position = allyPositions[FirstCombatPosition];
        lancelot.origin.position.x = lancelot.position.x;
        lancelot.origin.position.y = lancelot.position.y;
        
        [allyEntities insertObject:lancelot atIndex:FirstCombatPosition];
        
        
        Knight *enemy = [[Knight alloc] initWithKnightType:KnightTypeEnemy health:100 damageStrength:0.85 maxRadius:60];
        [enemy.stats insertObject:[NSNumber numberWithInteger:30] atIndex:Strength];
        [enemy.attackDamage insertObject:[NSNumber numberWithInt:30] atIndex:BasicAttack];
        ResetableLifetime *time2 = [[ResetableLifetime alloc] initWithStart:0 duration:0.2];
        [enemy.attackDuration insertObject:time2 atIndex:BasicAttack];
        enemy.origin = [[BattlePosition alloc] initWithRadius:5];
        enemy.position = enemyPositions[FirstCombatPosition];
        enemy.origin.position.x = enemy.position.x;
        enemy.origin.position.y = enemy.position.y;
        
        [enemyEntities insertObject:enemy atIndex:FirstCombatPosition];
        
        // release the scale
        [stretcher release];
    }
    return self;
}

@synthesize allyEntities, enemyEntities, allyPositions, enemyPositions;


- (Knight *) getAllyAtPosition:(CombatPosition)thePosition {
    if ([allyEntities count] > thePosition) {
        return (Knight *)allyEntities[thePosition];
    } else {
        return nil;
    }
}

- (BOOL) containsAlly:(Knight *)theAlly {
    return [allyEntities containsObject:theAlly];
}

- (Knight *) getEnemyAtPosition:(CombatPosition)thePosition {
    if ([enemyEntities count] > thePosition) {
        return (Knight *)enemyEntities[thePosition];
    } else {
        return nil;
    }
}

- (BOOL) containsEnemy:(Knight *)theEnemy {
    return [enemyEntities containsObject:theEnemy];
}

- (Vector2 *) getPositionOfAlly:(CombatPosition)theAlly {
    if ([allyPositions count] > theAlly) {
        return (Vector2 *)allyPositions[theAlly];
    } else {
        return nil;
    }
}

- (Vector2 *) getPositionOfEnemy:(CombatPosition)theEnemy {
    if ([enemyPositions count] > theEnemy) {
        return (Vector2 *)enemyPositions[theEnemy];
    } else {
        return nil;
    }
}


- (void) dealloc {
    for (int i = 0; i < CombatPositions; i++) {
        [allyEntities[i] release];
        [enemyEntities[i] release];
        [allyPositions[i] release];
        [enemyPositions[i] release];
    }
    
    [super dealloc];
}

@end
