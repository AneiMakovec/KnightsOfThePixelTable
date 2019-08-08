//
//  Rooster.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 08/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "Rooster.h"

#import "Pixlron.Knights.h"

@implementation Rooster

- (id) initWithArea:(Rectangle *)theArea itemSize:(int)size {
    self = [super initWithArea:theArea itemSize:size];
    if (self != nil) {
        selectionChanged = NO;
        selectedEntry = nil;
    }
    return self;
}

- (RoosterEntry *) getFirstEntry {
    RoosterEntry *entry = [firstItem isKindOfClass:[RoosterEntry class]] ? (RoosterEntry *) firstItem : nil;
    return entry;
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    selectionChanged = NO;
    
    // check if an entry was selected
    for (RoosterEntry *entry in items) {
        if ([entry wasSelected]) {
            if (selectedEntry == nil || selectedEntry.keyID != entry.data.keyID) {
                selectedEntry = entry.data;
                selectionChanged = YES;
                NSLog(@"Selection changed");
                break;
            }
        }
    }
}

@end
