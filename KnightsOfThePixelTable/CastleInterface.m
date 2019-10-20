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

- (id) initWithLayerDepth:(float)depth {
    self = [super init];
    if (self != nil) {
        // init scroll background
        scrollBackground = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_SCROLL atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_CASTLE_SCROLL]];
        scrollBackground.layerDepth = depth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        [scrollBackground setScaleUniform:2.0f];
        [items addObject:scrollBackground];
        
        // init upgrade dices button
        upgradeDices = [GraphicsComponent getDoubleImageLabelButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_DEFAULT atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_CASTLE_BUTTON_UPGRADE] text:[Constants getTextForKey:TEXT_INTERFACE_BUTTON_UPGRADE]];
        upgradeDices.notPressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeDices.pressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeDices.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [upgradeDices.label setScaleUniform:FONT_SCALE_MEDIUM];
        [items addObject:upgradeDices];
    }
    return self;
}


- (void) dealloc {
    [upgradeDices release];
    
    [super dealloc];
}

@end
