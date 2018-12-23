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

- (id) initWithLevel:(Level *)theLevel {
    
    self = [super init];
    if (self != nil) {
        level = theLevel;
        
        allyEntities = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        enemyEntities = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        
//        allyPositions = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
//        enemyPositions = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        
//        enemyAreas = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
//        allyAreas = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
//        comboAreas = [[NSMutableArray alloc] initWithCapacity:CombatPositions];
        
//        // create scale
//        int hudOffset = level.bounds.height * 0.625;
//        battleStretcher = [[TextureStretcher alloc] initFromWidth:256.0f fromHeight:80.0f toWidth:(float)level.bounds.width toHeight:(float)hudOffset xOffset:0 yOffset:0];
//        hudStretcher = [[TextureStretcher alloc] initFromWidth:256.0f fromHeight:48.0f toWidth:(float)level.bounds.width toHeight:(float)level.bounds.height - (float)hudOffset xOffset:0 yOffset:hudOffset];
        
        
//        for (int i = 0; i < CombatPositions; i++) {
//            allyPositions[i] = [[Vector2 alloc] init];
//            enemyPositions[i] = [[Vector2 alloc] init];
//            enemyAreas[i] = [[Rectangle alloc] init];
//            allyAreas[i] = [[Rectangle alloc] init];
//            comboAreas[i] = [[Rectangle alloc] init];
//        }
        
        
        // add the entities
        KnightLancelot *lancelot = [[KnightLancelot alloc] init];
        [lancelot setCombatPosition:FirstCombatPosition];
        [allyEntities insertObject:lancelot atIndex:FirstCombatPosition];
        [level.scene addItem:lancelot];
        [level.scene addItem:lancelot.origin];
        
        
        KnightLancelot *secondLancelot = [[KnightLancelot alloc] init];
        [secondLancelot setCombatPosition:SecondCombatPosition];
        [allyEntities insertObject:secondLancelot atIndex:SecondCombatPosition];
        [level.scene addItem:secondLancelot];
        [level.scene addItem:secondLancelot.origin];
        
        
        Monster *monster = [[Monster alloc] initMonster:MonsterTypeWarrior health:100 damageStrength:0.5 maxRadius:60];
        [monster setCombatPosition:FirstCombatPosition];
        [enemyEntities insertObject:monster atIndex:FirstCombatPosition];
        [level.scene addItem:monster];
        [level.scene addItem:monster.origin];
        
        
//        // calculate positions and touch areas
//        for (int i = 0; i < CombatPositions; i++) {
//            // ally positions
//            allyPositions[i] = [[Vector2 alloc] initWithX:[Constants positionXOfAlly:i] y:[Constants positionYOfAlly:i]];
//            Vector2 *temp = [allyPositions objectAtIndex:i];
//            [[TextureStretcher getScaleMappedTo:@"battlefield"] scalePosition:temp];

//            // enemy positions
//            Vector2 *pos = [allyPositions objectAtIndex:i];
//            enemyPositions[i] = [[Vector2 alloc] initWithX:[TextureStretcher getScreenBounds].width - pos.x y:pos.y];

//            // enemy touch areas
//            pos = [enemyPositions objectAtIndex:i];
//            enemyAreas[i] = [[Rectangle alloc] initWithX:pos.x - 56 y:pos.y - 56 width:112 height:112];

//            // ally touch areas
//            allyAreas[i] = [[Rectangle alloc] initWithX:[Constants areaXOfAlly:i] y:[Constants areaYOfAlly:i] width:[Constants allyAreaWidth] height:[Constants allyAreaHeight]];
//            Rectangle *tempRect = [allyAreas objectAtIndex:i];
//            [[TextureStretcher getScaleMappedTo:@"hud"] scaleRectangle:tempRect];

//            // ally combo touch areas
//            comboAreas[i] = [[Rectangle alloc] initWithX:[Constants comboAreaXOfAlly:i] y:[Constants comboAreaYOfAlly:i] width:[Constants comboAreaWidth] height:[Constants comboAreaHeight]];
//            tempRect = [comboAreas objectAtIndex:i];
//            [[TextureStretcher getScaleMappedTo:@"hud"] scaleRectangle:tempRect];
            
//            // separate combo touch areas
//            for (int j = 0; j < ComboItems; j++) {
//                separateComboAreas[i][j] = [[Rectangle alloc] initWithX:[Constants comboAreaXOfAlly:i atPosition:j] y:[Constants comboAreaYOfAlly:i atPosition:j] width:[Constants separateComboAreaSize] height:[Constants separateComboAreaSize]];
//                [[TextureStretcher getScaleMappedTo:@"hud"] scaleRectangle:separateComboAreas[i][j]];
//            }
//        }
        
        
//        // calculate positions for ally entities
//        Vector2 *pos;
//        for (int i = 0; i < CombatPositions; i++) {
//            pos = [allyPositions objectAtIndex:i];
//            pos.x = [Constants positionXOfAlly:i];
//            pos.y = [Constants positionYOfAlly:i];
//            [battleStretcher scalePosition:pos];
//        }
//
//        // calculate positions for enemy entities and their touch areas
//        Vector2 *posAlly;
//        Rectangle *rect;
//        for (int i = 0; i < CombatPositions; i++) {
//            // calculate position
//            pos = [enemyPositions objectAtIndex:i];
//            posAlly = [allyPositions objectAtIndex:i];
//            pos.x = level.bounds.width - posAlly.x;
//            pos.y = posAlly.y;
//
//            // calculate area position
//            rect = [enemyAreas objectAtIndex:i];
//            rect.x = pos.x - 56;
//            rect.y = pos.y - 56;
//            rect.width = 112;
//            rect.height = 112;
//        }
//
//
//        // calculate touch areas for allies
//
//        // scale size of area
//        Vector2 *rectSize = [[Vector2 alloc] initWithX:75 y:19];
//        [hudStretcher scaleSize:rectSize];
//        pos = [[Vector2 alloc] init];
//        for (int i = 0; i < CombatPositions; i++) {
//            // scale position of area
//            pos.x = [Constants areaXOfAlly:i];
//            pos.y = [Constants areaYOfAlly:i];
//            [hudStretcher scalePosition:pos];
//
//            // set area
//            rect = [allyAreas objectAtIndex:i];
//            rect.x = pos.x;
//            rect.y = pos.y;
//            rect.width = rectSize.x;
//            rect.height = rectSize.y;
//        }
//
//
//        // calculate touch areas for ally combos
//
//        // scale size of area
//        rectSize.x = 38;
//        rectSize.y = 8;
//        [hudStretcher scaleSize:rectSize];
//        for (int i = 0; i < CombatPositions; i++) {
//            // scale position of area
//            pos.x = [Constants comboAreaXOfAlly:i];
//            pos.y = [Constants comboAreaYOfAlly:i];
//            [hudStretcher scalePosition:pos];
//
//            // set area
//            rect = [comboAreas objectAtIndex:i];
//            rect.x = pos.x;
//            rect.y = pos.y;
//            rect.width = rectSize.x;
//            rect.height = rectSize.y;
//        }
        
        

        
//        // add the entities
//        KnightLancelot *lancelot = [[KnightLancelot alloc] initWithPosition:[allyPositions objectAtIndex:FirstCombatPosition]];
//        [allyEntities insertObject:lancelot atIndex:FirstCombatPosition];
//        [level.scene addItem:lancelot];
//        [level.scene addItem:lancelot.origin];
//
//
//        KnightLancelot *enemyLancelot = [[KnightLancelot alloc] initWithPosition:[enemyPositions objectAtIndex:FirstCombatPosition]];
//        [enemyEntities insertObject:enemyLancelot atIndex:FirstCombatPosition];
//        [level.scene addItem:enemyLancelot];
//        [level.scene addItem:enemyLancelot.origin];
        
//        // release the scale
//        [battleStretcher release];
//        [hudStretcher release];
    }
    return self;
}

@synthesize allyEntities, enemyEntities;


- (Knight *) getAllyAtPosition:(CombatPosition)thePosition {
    if ([allyEntities count] > thePosition) {
        return [allyEntities objectAtIndex:thePosition];
    } else {
        return nil;
    }
}

- (BOOL) containsAlly:(Knight *)theAlly {
    return [allyEntities containsObject:theAlly];
}

- (Knight *) getEnemyAtPosition:(CombatPosition)thePosition {
    if ([enemyEntities count] > thePosition) {
        return [enemyEntities objectAtIndex:thePosition];
    } else {
        return nil;
    }
}

- (BOOL) containsEnemy:(Knight *)theEnemy {
    return [enemyEntities containsObject:theEnemy];
}


- (BOOL) addCombo:(Dice *)theCombo toAlly:(CombatPosition)theAlly {
    Knight *ally = [allyEntities objectAtIndex:theAlly];
    if (ally) {
        return [ally addComboItem:theCombo];
    } else {
        return NO;
    }
}

- (Dice *) removeComboAtTouchLocation:(Vector2 *)theLocation fromAlly:(CombatPosition)theAlly {
    Knight *ally = [allyEntities objectAtIndex:theAlly];
    if (ally) {
        for (int i = 0; i < [ally.combo count]; i++) {
            ComboSlot *slot = [ally.combo objectAtIndex:i];
            if ([slot.area containsX:theLocation.x y:theLocation.y]) {
                return [ally removeCombo:i];
            }
        }
    }
    
    return nil;
}



//- (Vector2 *) getPositionOfAlly:(CombatPosition)theAlly {
//    if ([allyPositions count] > theAlly) {
//        return [allyPositions objectAtIndex:theAlly];
//    } else {
//        return nil;
//    }
//}
//
//- (Vector2 *) getPositionOfEnemy:(CombatPosition)theEnemy {
//    if ([enemyPositions count] > theEnemy) {
//        return [enemyPositions objectAtIndex:theEnemy];
//    } else {
//        return nil;
//    }
//}
//
//- (Rectangle *) getAreaOfEnemy:(CombatPosition)theEnemy {
//    if ([enemyAreas count] > theEnemy) {
//        return [enemyAreas objectAtIndex:theEnemy];
//    } else {
//        return nil;
//    }
//}
//
//- (Rectangle *) getAreaOfAlly:(CombatPosition)theAlly {
//    if ([allyAreas count] > theAlly) {
//        return [allyAreas objectAtIndex:theAlly];
//    } else {
//        return nil;
//    }
//}
//
//- (Rectangle *) getComboAreaOfAlly:(CombatPosition)theAlly {
//    if ([comboAreas count] > theAlly) {
//        return [comboAreas objectAtIndex:theAlly];
//    } else {
//        return nil;
//    }
//}
//
//- (Rectangle *) getComboAreaOfAlly:(CombatPosition)theAlly forCombo:(ComboItem)theCombo {
//    return separateComboAreas[theAlly][theCombo];
//}


- (void) dealloc {
    for (int i = 0; i < CombatPositions; i++) {
        [allyEntities[i] release];
        [enemyEntities[i] release];
    }
    
    [super dealloc];
}

@end
