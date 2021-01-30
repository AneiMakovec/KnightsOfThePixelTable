//
//  TownMenu.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 07/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Menu.h"

#define OPTION_PANELS 4

NS_ASSUME_NONNULL_BEGIN

@interface TownMenu : Menu {
    Image *background;
    Image *optionPanel[OPTION_PANELS];
    Label *weekCounterLabel;
    Label *weekCounter;
    
    CompositeImage *window;

    DoubleImageButton *soundButtonOn, *soundButtonOff;
    
    ImageButton *buildings[BuildingTypes];
    
    Interface *interface;
}

- (void) enableBuildings;

@end

NS_ASSUME_NONNULL_END
