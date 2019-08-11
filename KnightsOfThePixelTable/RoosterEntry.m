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
        
        // init line background
        roosterLine = [[TouchImage alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropPaneScrollLine] toRectangle:rectangle];
        roosterLine.position.x = position.x;
        roosterLine.position.y = position.y;
        roosterLine.layerDepth = depth;
        [items addObject:roosterLine];
        
        // init unit portrait
        portrait = [[Image alloc] initWithTexture:[CamelotTextureComponent getPortraitForUnitType:data.type] toRectangle:[Rectangle rectangleWithX:rectangle.x + 3 y:rectangle.y + 3 width:27 height:27]];
        portrait.layerDepth = depth - INTERFACE_LAYER_DEPTH_ALMOSTGROUND;
        [items addObject:portrait];
        
        // init unit name
        name = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:data.name position:[Vector2 vectorWithX:rectangle.x + 35 y:rectangle.y + 16]];
        name.verticalAlign = VerticalAlignMiddle;
        name.horizontalAlign = HorizontalAlignLeft;
        name.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [name setScaleUniform:INTERFACE_SCALE_FONT_SMALL];
        [items addObject:name];
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
        
        // TODO: find better solution!!!
        if ([item isEqual:portrait]) {
            if (portrait.drawToRectangle) {
                portrait.drawRectangle.y += distance;
                NSLog(@"Moved portrait bu: %f", distance);
            }
            
            continue;
        }
        
        id<IPosition> posItem = [item conformsToProtocol:@protocol(IPosition)] ? item : nil;
        if (posItem) {
            posItem.position.y += distance;
            NSLog(@"Moved Position item by: %f.", distance);
        }
    }
}

- (void) moveX:(float)distance {
    // do nothing
}

- (void) dealloc {
    [data release];
    [position release];
    [roosterLine release];
    [portrait release];
    [name release];
    
    [super dealloc];
}

@end
