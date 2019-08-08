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
    
    Image *firstSkill, *secondSkill, *thirdSkill;
    
    Image *firstSkillCombo1, *firstSkillCombo2;
    Image *secondSkillCombo1, *secondSkillCombo2, *secondSkillCombo3;
    Image *thirdSkillCombo1, *thirdSkillCombo2, *thirdSkillCombo3, *thirdSkillCombo4;
    
    DoubleImageLabelButton *upgradeFirstSkill, *upgradeSecondSkill, *upgradeThirdSkill;
}

- (id) initWithKnightData:(KnightData *)data area:(Rectangle *)area layerDepth:(float)layerDepth displayUpgradeButtons:(BOOL)display;

@end

NS_ASSUME_NONNULL_END
