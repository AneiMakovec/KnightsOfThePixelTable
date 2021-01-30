//
//  Monster.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Scene.Objects.h"
#import "Pixlron.Knights.classes.h"
#import "CombatEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface Monster : CombatEntity {
    int dicesComming;
    
//    int maxHpWidth;
//
//    MonsterType type;
//
//    ExpType expType;
//
//    Rectangle *hpPoolArea;
//    Rectangle *hpArea;
}

//@property (nonatomic) MonsterType type;
//@property (nonatomic, retain) Rectangle *hpPoolArea;
//@property (nonatomic, retain) Rectangle *hpArea;

- (id) initWithData:(MonsterData *)data cobatPosition:(CombatPosition)combPos;

//- (void) setCombatPosition:(CombatPosition)theCombatPosition;

- (BOOL) areDicesComming;

- (void) newDiceComming;

@end

NS_ASSUME_NONNULL_END
