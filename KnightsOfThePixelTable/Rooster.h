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

@interface Rooster : ScrollPanel {
    KnightData *selectedEntry;
    BOOL selectionChanged;
}

@property (nonatomic, readonly) BOOL selectionChanged;

- (RoosterEntry *) getFirstEntry;

@end

NS_ASSUME_NONNULL_END
