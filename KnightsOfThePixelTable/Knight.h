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

- (id) initKnight:(KnightType)theKnight health:(int)hp damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius;

- (void) setCombatPosition:(CombatPosition)theCombatPosition;

@end

NS_ASSUME_NONNULL_END
