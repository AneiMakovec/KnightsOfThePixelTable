//
//  BlacksmithInterface.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

#import "PixEngine.GUI.h"

NS_ASSUME_NONNULL_BEGIN

@interface BlacksmithInterface : GuiPanel {
    Rooster *rooster;
    
    RadioButtonGroup *equipmentBtnGroup;
    RadioButtonGroup *statsBtnGroup;
    
    ImageRadioButton *weaponBorder, *armorBorder;
    Image *weapon[KnightTypes], *armor[KnightTypes];
    
    DoubleImageLabelRadioButton *statButtons[StatTypes];
    
    DoubleImageLabelButton *upgrade;
}

- (id) initWithLayerDepth:(float)depth rooster:(Rooster *)theRooster;

@end

NS_ASSUME_NONNULL_END
