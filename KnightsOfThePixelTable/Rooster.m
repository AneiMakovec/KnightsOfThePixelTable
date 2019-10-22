//
//  Rooster.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 08/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "Rooster.h"

#import "Pixlron.Knights.h"

#define ENTRY_WIDTH 164
#define ENTRY_HEIGHT 34
#define ENTRY_SPACING 35

@implementation Rooster

- (id) initWithArea:(Rectangle *)theArea itemSize:(int)size layerDepth:(float)depth {
    self = [super initWithArea:theArea itemSize:size];
    if (self != nil) {
        selectionChanged = NO;
        selectedEntry = nil;
        dontReset = NO;
        
        layerDepth = depth;
    }
    return self;
}

@synthesize selectionChanged;

- (KnightData *) getFirstData {
    RoosterEntry *entry = [firstItem isKindOfClass:[RoosterEntry class]] ? (RoosterEntry *) firstItem : nil;
    
    if (entry)
        return entry.data;
    else
        return nil;
}

- (KnightData *) getSelectedData {
    if (selectedEntry)
        return selectedEntry.data;
    else
        return nil;
}

- (RoosterEntry *) getSelectedEntry {
    return selectedEntry;
}



- (void) addItem:(id)item {
    KnightData *data = [item isKindOfClass:[KnightData class]] ? item : nil;
    if (data) {
        // calculate entry position
        RoosterEntry *entry;
        if (firstItem == nil) {
            entry = [[RoosterEntry alloc] initWithKnightData:data toRectangle:[Rectangle rectangleWithX:area.x y:area.y width:ENTRY_WIDTH height:ENTRY_HEIGHT] layerDepth:layerDepth];
            selectedEntry = entry;
            [selectedEntry setSelectedColor];
        } else {
            entry = [[RoosterEntry alloc] initWithKnightData:data toRectangle:[Rectangle rectangleWithX:area.x y:lastItem.position.y + ENTRY_SPACING width:ENTRY_WIDTH height:ENTRY_HEIGHT] layerDepth:layerDepth];
        }
        
        // and add it to the scroll panel
        [super addItem:entry];
        [entry release];
    }
}

- (void) removeItem:(id)item {
    RoosterEntry *entryToRemove = [item isKindOfClass:[RoosterEntry class]] ? item : nil;
    if (entryToRemove) {
        // recalculate positions for lower entries
        for (RoosterEntry *entry in items) {
            if (entry.position.y > entryToRemove.position.y) {
                [entry moveY:-ENTRY_SPACING];
            }
        }
        
        for (RoosterEntry *entry in invisibleItems) {
            if (entry.position.y > entryToRemove.position.y)
                [entry moveY:-ENTRY_SPACING];
        }
    }
    
    // remove item
    [super removeItem:item];
    
    // set selected entry to first entry
    selectedEntry = (RoosterEntry *) firstItem;
    [selectedEntry setSelectedColor];
    selectionChanged = YES;
    dontReset = YES;
}



- (void) updateWithInverseView:(Matrix *)inverseView {
    if (dontReset) {
        dontReset = NO;
    } else {
        selectionChanged = NO;
    }
    
    // check if an entry was selected
    if (!scrolling) {
        for (RoosterEntry *entry in items) {
            if ([entry wasSelected]) {
                if (selectedEntry == nil || ![selectedEntry.data.keyID isEqualToString:entry.data.keyID]) {
                    [selectedEntry setNormalColor];
                    selectedEntry = entry;
                    [selectedEntry setSelectedColor];
                    selectionChanged = YES;
                    break;
                }
            }
        }
    }
    
    [super updateWithInverseView:inverseView];
}

@end
