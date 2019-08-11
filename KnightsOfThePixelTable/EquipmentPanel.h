//
//  EquipmentPanel.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 01/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.GUI.h"

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface EquipmentPanel : GuiPanel<ICustomUpdate> {
    Image *equipmentPane;
    
    Label *weaponLabel;
    Image *weaponBorder, *weapon;
    Label *weaponNameLabel, *weaponLvlLabel, *weaponLvlValueLabel;
    
    Label *armorLabel;
    Image *armorBorder, *armor;
    Label *armorNameLabel, *armorLvlLabel, *armorLvlValueLabel;
}

- (id) initWithKnightData:(KnightData *)data area:(Rectangle *)area layerDepth:(float)layerDepth;

- (void) updateToKnightData:(KnightData *)data;

@end

NS_ASSUME_NONNULL_END
