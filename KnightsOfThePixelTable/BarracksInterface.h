//
//  BarracksInterface.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

#import "PixEngine.GUI.h"

NS_ASSUME_NONNULL_BEGIN

@interface BarracksInterface : GuiPanel {
    Image *skillPane, *defaultPane;
    DoubleImageLabelRadioButton *tabStats, *tabEquipment, *tabSkills;
    Image *firstSkill, *secondSkill, *thirdSkill;
    Image *firstSkillCombo1, *firstSkillCombo2;
    Image *secondSkillCombo1, *secondSkillCombo2, *secondSkillCombo3;
    Image *thirdSkillCombo1, *thirdSkillCombo2, *thirdSkillCombo3, *thirdSkillCombo4;
    DoubleImageLabelButton *upgradeFirstSkill, *upgradeSecondSkill, *upgradeThirdSkill;
    
    ScrollPanel *rooster;
    
    Rectangle *area;
}

- (id) initWithArea:(Rectangle *)theArea layerDepth:(float)depth;

@end

NS_ASSUME_NONNULL_END
