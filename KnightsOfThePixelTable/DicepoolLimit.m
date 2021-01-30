//
//  DicepoolLimit.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "DicepoolLimit.h"

@implementation DicepoolLimit

- (id) initWithLimit:(AAHalfPlane *)theLimit {
    self = [super init];
    if (self != nil) {
        aaHalfPlane = [theLimit retain];
    }
    return self;
}

@synthesize aaHalfPlane;

- (void) dealloc {
    [aaHalfPlane release];
    
    [super dealloc];
}

@end
