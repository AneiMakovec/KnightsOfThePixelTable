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
    Image *skillPane;
    
    Image *firstSkill, *secondSkill, *thirdSkill;
    
    Image *firstSkillCombo1, *firstSkillCombo2;
    Image *secondSkillCombo1, *secondSkillCombo2, *secondSkillCombo3;
    Image *thirdSkillCombo1, *thirdSkillCombo2, *thirdSkillCombo3, *thirdSkillCombo4;
    
    DoubleImageLabelButton *upgradeFirstSkill, *upgradeSecondSkill, *upgradeThirdSkill;
}

- (id) initWithArea:(Rectangle *)area layerDepth:(float)layerDepth font:(SpriteFont *)font;

@end

NS_ASSUME_NONNULL_END
