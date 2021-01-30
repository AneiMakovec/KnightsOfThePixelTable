//
//  Rooster.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 08/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.GUI.h"

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface Rooster : ScrollPanel {
    RoosterEntry *selectedEntry;
    BOOL selectionChanged;
    BOOL dontReset;
    
    float layerDepth;
}

@property (nonatomic, readonly) BOOL selectionChanged;

- (id) initWithArea:(Rectangle *)theArea itemSize:(int)size layerDepth:(float)depth;

- (KnightData *) getFirstData;
- (KnightData *) getSelectedData;

- (RoosterEntry *) getSelectedEntry;

- (void) setSelectedEntry:(NSString *)knightID;

- (void) deselect;

- (void) reselect;

@end

NS_ASSUME_NONNULL_END
