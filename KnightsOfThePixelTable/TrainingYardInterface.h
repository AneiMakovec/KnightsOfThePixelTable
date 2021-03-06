//
//  TrainingYardInterface.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

#import "PixEngine.GUI.h"

NS_ASSUME_NONNULL_BEGIN

@interface TrainingYardInterface : GuiPanel {
    
    float showDepth, hideDepth;
    Color *showColor, *hideColor;
    
    Image *backImage;
    
//    RadioButtonGroup *tabs;
//    ImageLabelRadioButton *tabStats, *tabEquipment, *tabSkills;
    
    Rooster *rooster;
    Rooster *trainRooster;
    
    LabelButton *statButton, *skillButton;
    
    SkillsPanel *skillPanel;
    StatsPanel *statPanel;
//    EquipmentPanel *equipmentPanel;
    
    DoubleImageLabelButton *recruitButton;
    
    Label *unitName, *unitClassName;
    NSString *unitClassNames[KnightTypes];
    
    Color *classColors[DamageTypes];
}

- (id) initWithLayerDepth:(float)depth trainRooster:(Rooster *)theTrainRooster rooster:(Rooster *)theRooster;

- (void) update;

@end

NS_ASSUME_NONNULL_END
