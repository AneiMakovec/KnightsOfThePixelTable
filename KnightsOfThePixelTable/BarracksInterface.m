//
//  BarracksInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "BarracksInterface.h"

#import "Pixlron.Knights.h"

@implementation BarracksInterface

- (id) initWithArea:(Rectangle *)theArea layerDepth:(float)depth {
    self = [super init];
    if (self != nil) {
        area = [theArea retain];
        
        // init rooster
        rooster = [[ScrollPanel alloc] initWithArea:[Rectangle rectangleWithX:area.x + 587 y:area.y + 44 width:164 height:323] itemSize:32];
        Image *firstLine = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropPaneScrollLine] position:[Vector2 vectorWithX:area.x + 587 y:area.y + 44]];
        firstLine.layerDepth = depth + INTERFACE_LAYER_DEPTH_BEFOREGROUND;
        Image *secondLine = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropPaneScrollLine] position:[Vector2 vectorWithX:area.x + 587 y:area.y + 44 + 34]];
        secondLine.layerDepth = depth + INTERFACE_LAYER_DEPTH_BEFOREGROUND;
        Image *thirdLine = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropPaneScrollLine] position:[Vector2 vectorWithX:area.x + 587 y:area.y + 44 + 34 + 34]];
        thirdLine.layerDepth = depth + INTERFACE_LAYER_DEPTH_BEFOREGROUND;
        
        [rooster addItem:firstLine];
        [firstLine release];
        [rooster addItem:secondLine];
        [secondLine release];
        [rooster addItem:thirdLine];
        [thirdLine release];
        
        [items addObject:rooster];
    }
    return self;
}




- (void) dealloc {
    [rooster release];
    [area release];
    
    [super dealloc];
}

@end
