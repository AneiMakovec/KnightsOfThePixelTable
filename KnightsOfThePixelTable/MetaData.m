//
//  MetaData.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "MetaData.h"

@implementation MetaData

- (id) initWithWidth:(int)theWidth height:(int)theHeight {
    self = [super init];
    if (self != nil) {
        width = theWidth;
        height = theHeight;
    }
    return self;
}

- (id) initWithStep:(int)theStep {
    self = [super init];
    if (self != nil) {
        step = theStep;
    }
    return self;
}

- (id) initWithStep:(int)theStep max:(int)theMax {
    self = [super init];
    if (self != nil) {
        step = theStep;
        max = theMax;
    }
    return self;
}

- (id) initWithStep:(int)theStep width:(int)theWidth height:(int)theHeight {
    self = [super init];
    if (self != nil) {
        step = theStep;
        width = theWidth;
        height = theHeight;
    }
    return self;
}

@synthesize width, height, step, max;

@end
