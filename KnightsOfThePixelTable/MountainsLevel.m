//
//  MountainsLevel.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "MountainsLevel.h"

@implementation MountainsLevel

- (id) initWithGame:(Game *)theGame numDices:(int)numDices {
    self = [super initWithGame:theGame numDices:numDices];
    if (self != nil) {
        levelType = LevelTypeMountains;
    }
    return self;
}

@end
