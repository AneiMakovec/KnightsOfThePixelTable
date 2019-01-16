//
//  OptionsMenu.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 07/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Menu.h"

NS_ASSUME_NONNULL_BEGIN

@interface OptionsMenu : Menu {
    Label *title;
    
    ImageLabelButton *reset;
    ImageButton *sound, *music;
    
    Texture2D *enabledSoundButtonBackground;
    Texture2D *disabledSoundButtonBackground;
    Texture2D *enabledMusicButtonBackground;
    Texture2D *disabledMusicButtonBackground;
}

@end

NS_ASSUME_NONNULL_END
