//
//  Menu.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 07/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Scene.h"
#import "PixEngine.GUI.h"

#import "Pixlron.Knights.classes.h"

#import "GameState.h"

NS_ASSUME_NONNULL_BEGIN

@interface Menu : GameState {
    SimpleScene *scene;
    GUIRenderer *renderer;
    
    DoubleImageButton *back;
}

@end

NS_ASSUME_NONNULL_END
