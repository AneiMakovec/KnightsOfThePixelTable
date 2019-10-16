//
//  CastleInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "CastleInterface.h"

#import "Pixlron.Knights.h"

@implementation CastleInterface

- (id) initWithArea:(Rectangle *)area layerDepth:(float)depth {
    self = [super init];
    if (self != nil) {
        // init upgrade dices button
        upgradeDices = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 622 y:area.y + 300 width:95 height:32] notPressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonPressed] font:[TownSpriteComponent getFont] text:@"Upgrade"];
        upgradeDices.notPressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeDices.pressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeDices.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [upgradeDices.label setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        [items addObject:upgradeDices];
    }
    return self;
}


- (void) dealloc {
    [upgradeDices release];
    
    [super dealloc];
}

@end
