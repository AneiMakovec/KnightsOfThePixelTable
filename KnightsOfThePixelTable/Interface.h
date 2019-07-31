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
    
    BuildingType interfaceType;
    
    // interface switching buttons
    DoubleImageLabelRadioButton *switchButtons[BuildingTypes];
    
    // interface content
    GuiPanel *interfaceContent[BuildingTypes];
}

- (id) initToRectangle:(Rectangle *)rect font:(SpriteFont *)font layerDepth:(float)layerDepth type:(BuildingType)type;

@end

NS_ASSUME_NONNULL_END
