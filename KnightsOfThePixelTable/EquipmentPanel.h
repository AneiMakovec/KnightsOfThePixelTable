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
    
    Image *weaponBorder, *weapon;
    Label *weaponLvlLabel, *weaponLvlValueLabel;
    
    Image *armorBorder, *armor;
    Label *armorLvlLabel, *armorLvlValueLabel;
}

- (id) initWithArea:(Rectangle *)area layerDepth:(float)layerDepth font:(SpriteFont *)font;

@end

NS_ASSUME_NONNULL_END