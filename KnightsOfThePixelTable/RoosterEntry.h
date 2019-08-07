//
//  RoosterEntry.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 08/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.GUI.h"

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface RoosterEntry : GuiPanel<IPosition> {
    Vector2 *position;
    
    KnightData *data;
    
    TouchImage *roosterLine;
}

@property (nonatomic, retain) KnightData *data;
@property (nonatomic, retain) Vector2 *position;

- (id) initWithKnightData:(KnightData *)knightData toRectangle:(Rectangle *)rectangle layerDepth:(float)depth;

@end

NS_ASSUME_NONNULL_END
