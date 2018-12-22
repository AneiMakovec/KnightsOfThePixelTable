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

- (id) initWithArea:(Rectangle *)theArea {
    self = [super init];
    if (self != nil) {
        area = theArea;
        item = nil;
    }
    return self;
}

@synthesize area, item;

@end
