//
//  StatsPanel.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 01/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.GUI.h"

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface StatsPanel : GuiPanel {
    float curDepth;
    
    Image *statPane;
    
    Label *statLabels[StatTypes];
    Label *stats[StatTypes];
    
    Label *unitTypeLabel;
    Image *unitType[DamageTypes];
    DamageType currentDmgType;
    
    Label *character, *characterLabel;
    
    Label *lvl, *lvlLabel;

    Label *hp, *hpLabel;
    Label *xpLabel;
    Image *xpBar;
    
    Label *weaponLvl, *weaponLvlLabel;
    Label *armorLvl, *armorLvlLabel;
    
    Image *weapon[KnightTypes], *armor[KnightTypes];
    KnightType currentType;
    Label *weaponName, *armorName;
    Label *weaponBonusText, *armorBonusText;
    
    Label *weaponBonus[StatTypes];
    Label *weaponBonusLabel[StatTypes];
    
    Label *armorBonus[StatTypes];
    Label *armorBonusLabel[StatTypes];
    
    AnimatedImage *knightAnimations[KnightTypes];
    
//    Button *xpPool;
//    XpPopUp *xpPopUp;
//    BOOL xpPopUpVisible;
}

- (id) initWithKnightData:(KnightData *)data layerDepth:(float)layerDepth;

- (void) updateToKnightData:(KnightData *)data;

- (void) updateDepth:(float)depth;

- (void) updateColor:(Color *)color;

@end

NS_ASSUME_NONNULL_END
