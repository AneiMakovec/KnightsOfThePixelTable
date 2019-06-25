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
    ImageButton *closeButton;
    
    Image *background;
}

- (id) initToRectangle:(Rectangle *)rect camera:(Matrix *)camera;

@end

NS_ASSUME_NONNULL_END
