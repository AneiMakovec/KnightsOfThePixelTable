//
//  Knight.h
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

@interface Knight : CombatEntity<IExperienceGainer> {
    int currentLevel;
    int maxLevel;
    int exp;
    int currentExp;
    
    int maxHpWidth;
    
    KnightType type;
    
    Rectangle *portraitArea;
    Rectangle *comboArea;
    Rectangle *skillArea;
    Rectangle *hpPoolArea;
}

@property (nonatomic) KnightType type;

@property (nonatomic, retain) Rectangle *portraitArea;
@property (nonatomic, retain) Rectangle *comboArea;
@property (nonatomic, retain) Rectangle *skillArea;
@property (nonatomic, retain) Rectangle *hpPoolArea;

- (id) initKnight:(KnightType)theKnight battlefield:(Battlefield*)theBattlefield gameHud:(GameHud*)theHud entityType:(StatType)theType health:(int)hp damageType:(DamageType)theDamageType damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius;

- (void) setCombatPosition:(CombatPosition)theCombatPosition;

- (Dice *) removeComboAtTouchLocation:(Vector2 *)touchLocation;

@end

NS_ASSUME_NONNULL_END
