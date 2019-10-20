//
//  CastleInterface.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

#import "PixEngine.GUI.h"

NS_ASSUME_NONNULL_BEGIN

@interface CastleInterface : GuiPanel {
    Image *scrollBackground;
    
    DoubleImageLabelButton *upgradeDices;
}

- (id) initWithLayerDepth:(float)depth;

@end

NS_ASSUME_NONNULL_END
