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
    float showDepth, hideDepth;
    Color *showColor, *hideColor;
    
    Image *backImage;
    
    Rooster *rooster;
    
    SkillsPanel *skillPanel;
    StatsPanel *statPanel;
    
    LabelButton *statButton, *skillButton;
    
    Label *unitName, *unitClassName;
    NSString *unitClassNames[KnightTypes];
}

- (id) initWithLayerDepth:(float)depth rooster:(Rooster *)theRooster;

- (BOOL) wasSkillUpgradeButtonReleased:(SkillType)skill;

- (void) upgradeSkill:(SkillType)skill;

- (void) update;

@end

NS_ASSUME_NONNULL_END
