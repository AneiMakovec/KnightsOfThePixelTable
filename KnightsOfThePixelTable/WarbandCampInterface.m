//
//  WarbandCampInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "WarbandCampInterface.h"

#import "Pixlron.Knights.h"

@implementation WarbandCampInterface

- (id) initWithArea:(Rectangle *)area layerDepth:(float)depth scrollPanel:(ScrollPanel *)scrollPanel {
    self = [super init];
    if (self != nil) {
        // retain rooster
        rooster = [scrollPanel retain];
        
        // init warband slots
        firstSlot = [[DropInImage alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotGreen] toRectangle:[Rectangle rectangleWithX:area.x + 455 y:area.y + 150 width:42 height:42]];
        firstSlot.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:firstSlot];
        
        secondSlot = [[DropInImage alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotGreen] toRectangle:[Rectangle rectangleWithX:area.x + 415 y:area.y + 300 width:42 height:42]];
        secondSlot.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:secondSlot];
        
        thirdSlot = [[DropInImage alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotGreen] toRectangle:[Rectangle rectangleWithX:area.x + 305 y:area.y + 150 width:42 height:42]];
        thirdSlot.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:thirdSlot];
        
        fourthSlot = [[DropInImage alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotGreen] toRectangle:[Rectangle rectangleWithX:area.x + 265 y:area.y + 300 width:42 height:42]];
        fourthSlot.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:fourthSlot];
    }
    return self;
}

- (void) dealloc {
    [rooster release];
    
    [firstSlot release];
    [secondSlot release];
    [thirdSlot release];
    [fourthSlot release];
    
    [super dealloc];
}

@end
