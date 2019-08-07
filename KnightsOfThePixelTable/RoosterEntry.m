//
//  RoosterEntry.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 08/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "RoosterEntry.h"

#import "Pixlron.Knights.h"

@implementation RoosterEntry

- (id) initWithKnightData:(KnightData *)knightData toRectangle:(Rectangle *)rectangle layerDepth:(float)depth {
    self = [super init];
    if (self != nil) {
        // store knight data
        data = [knightData retain];
        
        // init a new position
        position = [[Vector2 alloc] initWithX:rectangle.x y:rectangle.y];
        
        // init the image that will be displayed by the rooster
        roosterLine = [[TouchImage alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropPaneScrollLine] toRectangle:rectangle];
        roosterLine.position = position;
        roosterLine.layerDepth = depth + INTERFACE_LAYER_DEPTH_BEFOREGROUND;
    }
    return self;
}

@synthesize data, position;

- (void) dealloc {
    [data release];
    
    [super dealloc];
}

@end
