//
//  MainMenu.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 07/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Menu.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainMenu : Menu {
    Image *background;
    
    ImageLabelButton *play, *options;
}

@end

NS_ASSUME_NONNULL_END
