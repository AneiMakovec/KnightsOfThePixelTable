//
//  WorldMenu.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.GUI.h"

#import "Pixlron.Knights.classes.h"

#import "Menu.h"

NS_ASSUME_NONNULL_BEGIN

@interface WorldMenu : Menu {
    Image *background;
    
    DoubleImageButton *dungeonsUnlocked[LevelTypes];
    DoubleImageButton *dungeonsLocked[LevelTypes];
    
    BOOL isPanelVisible;
    LevelType curLevel;
    Image *panel;
    Label *panelText;
    ImageButton *panelClose;
    
    NSString *dungeonNames[LevelTypes];
    
    Image *stagesLocked[StageTypes];
    DoubleImageLabelButton *stagesUnlocked[StageTypes];
    
    Image *paths[LevelTypes];
}

@end

NS_ASSUME_NONNULL_END
