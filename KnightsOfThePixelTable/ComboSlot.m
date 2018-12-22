//
//  ComboSlot.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 22/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "ComboSlot.h"

#import "Pixlron.Knights.h"

@implementation ComboSlot

- (id) init {
    self = [super init];
    if (self != nil) {
        area = nil;
        item = nil;
    }
    return self;
}

@synthesize area, item;


- (void) addItem:(Dice *)theItem {
    item = theItem;
    [item retain];
}

- (Dice *) removeItem {
    Dice *dice = item;
    [dice retain];
    
    [item release];
    item = nil;
    
    return dice;
}

@end
