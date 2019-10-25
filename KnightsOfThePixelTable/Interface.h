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
    TownMenu *menu;
    
    DoubleImageButton *closeButton;
    Image *background;
    Image *sidePane;
    Image *sidePaneBorder;
    
    Rooster *rooster;
    Rooster *trainRooster;
    
    BuildingType interfaceType;
    
    // interface switching buttons
    RadioButtonGroup *switchButtonGroup;
    DoubleImageLabelRadioButton *switchButtons[BuildingTypeGatehouse];
    NSString *buttonKeys[BuildingTypeGatehouse];
    
    // interface content
    GuiPanel *interfaceContent[BuildingTypeGatehouse];
    
    Label *goldCount;
    Image *goldStack;
    
    // DEBUG
    RoosterEntry *firstLine, *secondLine, *thirdLine;
    RoosterEntry *firstTrainLine, *secondTrainLine, *thirdTrainLine;
}

- (id) initWithMenu:(TownMenu *)theMenu layerDepth:(float)layerDepth;

- (void) updateContent:(BuildingType)type;

@end

NS_ASSUME_NONNULL_END
