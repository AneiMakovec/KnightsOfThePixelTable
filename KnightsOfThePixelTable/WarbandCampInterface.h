//
//  WarbandCampInterface.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

#import "PixEngine.GUI.h"

NS_ASSUME_NONNULL_BEGIN

@interface WarbandCampInterface : GuiPanel {
    Rooster *rooster;
    
    DropInImage *firstSlot, *secondSlot, *thirdSlot, *fourthSlot;
}

- (id) initWithArea:(Rectangle *)area layerDepth:(float)depth rooster:(Rooster *)theRooster;

@end

NS_ASSUME_NONNULL_END
