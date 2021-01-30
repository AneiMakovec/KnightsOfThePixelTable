//
//  XpPopUp.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 26/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.GUI.h"

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface XpPopUp : GuiPanel {
    float curDepth;
    
    Image *background;
    
    Label *curXp, *maxXp;
}


- (id) initWithDepth:(float)depth;

- (void) updateToKnightData:(KnightData *)data;

- (void) updateDepth:(float)depth;

@end

NS_ASSUME_NONNULL_END
