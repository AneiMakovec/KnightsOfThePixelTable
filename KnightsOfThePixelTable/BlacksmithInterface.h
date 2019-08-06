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
    ScrollPanel *rooster;
    
    Image *weaponBorder, *weapon;
    Image *armorBorder, *armor;
    
    DoubleImageLabelButton *upgradeWeapon, *upgradeArmor;
}

- (id) initWithArea:(Rectangle *)area layerDepth:(float)depth scrollPanel:(ScrollPanel *)scrollPanel;

@end

NS_ASSUME_NONNULL_END
