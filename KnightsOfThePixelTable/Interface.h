//
//  Interface.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"
#import "PixEngine.GUI.h"

NS_ASSUME_NONNULL_BEGIN

@interface Interface : GuiPanel {
    DoubleImageButton *closeButton;
    Image *background;
    Image *sidePane;
    Image *sidePaneBorder;
    
    Rooster *rooster;
    Rooster *trainRooster;
    
    BuildingType interfaceType;
    
    // interface switching buttons
    RadioButtonGroup *switchButtonGroup;
    DoubleImageLabelRadioButton *switchButtons[BuildingTypes];
    NSString *buttonKeys[BuildingTypes];
    
    // interface content
    GuiPanel *interfaceContent[BuildingTypes];
    
    
    // DEBUG
    RoosterEntry *firstLine, *secondLine, *thirdLine;
    RoosterEntry *firstTrainLine, *secondTrainLine, *thirdTrainLine;
}

- (id) initToRectangle:(Rectangle *)rect layerDepth:(float)layerDepth type:(BuildingType)type;

@end

NS_ASSUME_NONNULL_END
