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
        roosterLine.layerDepth = depth;
        [items addObject:roosterLine];
    }
    return self;
}

@synthesize data, position;



- (BOOL) wasSelected {
    return roosterLine.wasReleased;
}



- (void) moveY:(float)distance {
    // move all items
    for (id item in items) {
        id<ICustomMovable> moveItem = [item conformsToProtocol:@protocol(ICustomMovable)] ? item : nil;
        if (moveItem) {
            [moveItem moveY:distance];
            // skip checking for protocol IPosition to avoid double movements
            continue;
        }
        
        id<IPosition> posItem = [item conformsToProtocol:@protocol(IPosition)] ? item : nil;
        if (posItem) {
            posItem.position.y += distance;
        }
    }
}

- (void) moveX:(float)distance {
    // do nothing
}

- (void) dealloc {
    [data release];
    
    [super dealloc];
}

@end
