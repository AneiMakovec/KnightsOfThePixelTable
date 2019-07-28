//
//  Interface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "Interface.h"

#import "Pixlron.Knights.h"

#define BACK_LAYER_DEPTH 0.1f
#define MIDDLE_LAYER_DEPTH 0.2f
#define UPPER_MIDDLE_LAYER_DEPTH 0.25f
#define FRONT_LAYER_DEPTH 0.3f

#define FONT_SIZE_SCALE 0.7f

@implementation Interface

- (id) initToRectangle:(Rectangle *)rect font:(SpriteFont *)font layerDepth:(float)layerDepth type:(BuildingType)type {
    self = [super init];
    if (self != nil) {
        interfaceType = type;
        
        // interface background
        background = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropBackground] toRectangle:rect];
        background.layerDepth = layerDepth;
        [items addObject:background];
        
        // close button
        closeButton = [[DoubleImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:rect.x + 734 y:rect.y + 14 width:20 height:20] notPressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonCloseNotPressed] pressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonClosePressed]];
        closeButton.notPressedImage.layerDepth = layerDepth - BACK_LAYER_DEPTH;
        closeButton.pressedImage.layerDepth = layerDepth - BACK_LAYER_DEPTH;
        [items addObject:closeButton];
        
        // interface switching buttons
        int y = 41;
        BOOL down = NO;
        for (int i = 0; i < BuildingTypes; i++) {
            if (i == interfaceType)
                down = YES;
            
            // init button
            switchButtons[i] = [[DoubleImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:rect.x + 31 y:rect.y + y width:135 height:32] notPressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonPressed] font:font text:[Constants getSwitchButtonText:i] isDown:down];
            
            // disable button release
            switchButtons[i].enabled = NO;
            
            // set layer depth for drawing
            switchButtons[i].notPressedImage.layerDepth = layerDepth - BACK_LAYER_DEPTH;
            switchButtons[i].pressedImage.layerDepth = layerDepth - BACK_LAYER_DEPTH;
            switchButtons[i].label.layerDepth = layerDepth - MIDDLE_LAYER_DEPTH;
            
            // set font size scale
            [switchButtons[i].label setScaleUniform:FONT_SIZE_SCALE];
            
            // add button to scene and button group
            [items addObject:switchButtons[i]];
            //[buttonGroup addRadioButton:switchButtons[i]];
            
            y += 67;
            down = NO;
        }
    }
    return self;
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    // check if pressed close button
    if ([closeButton wasReleased]) {
        [scene removeItem:self];
    }
    
    // check if a different switch button was pressed
    for (int i = 0; i < BuildingTypes; i++) {
        if (switchButtons[i].isDown && i != interfaceType) {
            // set new interface type and reset all other buttons
            interfaceType = i;
            
            for (int j = 0; j < BuildingTypes; j++) {
                if (j != interfaceType)
                    [switchButtons[j] reset];
            }
            
            break;
        }
    }
}

- (void) dealloc {
    [background release];
    [closeButton release];
    
    [buttonGroup release];
    
    for (int i = 0; i < BuildingTypes; i++) {
        [switchButtons[i] release];
    }
    
    [super dealloc];
}

@end
