//
//  SkillsPanel.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 01/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.GUI.h"

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface SkillsPanel : GuiPanel<ICustomUpdate> {
    BOOL displayUpgradeButtons;
    
    Image *skillPane;
    
    Image *skills[SkillTypes];
    
    Image *firstSkillCombo[2];
    Image *secondSkillCombo[3];
    Image *thirdSkillCombo[4];
    
    DoubleImageLabelButton *upgradeButtons[SkillTypes];
    
    Label *comboLabels[SkillTypes];
    Label *upgradeLabels[SkillTypes];
    Label *lvlLabels[SkillTypes];
}

- (id) initWithKnightData:(KnightData *)data layerDepth:(float)layerDepth displayUpgradeButtons:(BOOL)display;

- (void) updateToKnightData:(KnightData *)data;

- (void) updateDepth:(float)depth;

- (void) updateColor:(Color *)color;

@end

NS_ASSUME_NONNULL_END
