//
//  Interface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "Interface.h"

#import "Pixlron.Knights.h"

#define KEY_CASTLE @"castle"
#define KEY_BARRACKS @"barracks"
#define KEY_WARBAND_CAMP @"warband_camp"
#define KEY_TRAINING_YARD @"training_yard"
#define KEY_BLACKSMITH @"blacksmith"

@implementation Interface

- (id) initToRectangle:(Rectangle *)rect layerDepth:(float)layerDepth type:(BuildingType)type {
    self = [super init];
    if (self != nil) {
        interfaceType = type;
        
        // init interface background
        background = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropBackground] toRectangle:rect];
        background.layerDepth = layerDepth;
        [items addObject:background];
        
        // init close button
        closeButton = [[DoubleImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:rect.x + 734 y:rect.y + 14 width:20 height:20] notPressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonCloseNotPressed] pressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonClosePressed]];
        closeButton.notPressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        closeButton.pressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:closeButton];
        
        // init interface switching buttons
        
        // init radio button group
        switchButtonGroup = [[RadioButtonGroup alloc] init];
        
        // init button keys
        buttonKeys[BuildingTypeCastle] = KEY_CASTLE;
        buttonKeys[BuildingTypeBarracks] = KEY_BARRACKS;
        buttonKeys[BuildingTypeWarbandCamp] = KEY_WARBAND_CAMP;
        buttonKeys[BuildingTypeTrainingYard] = KEY_TRAINING_YARD;
        buttonKeys[BuildingTypeBlacksmith] = KEY_BLACKSMITH;
        
        // init buttons
        int y = 41;
        BOOL down = NO;
        for (int i = 0; i < BuildingTypes; i++) {
            if (i == interfaceType)
                down = YES;
            
            // init button
            switchButtons[i] = [[DoubleImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:rect.x + 31 y:rect.y + y width:135 height:32] notPressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonPressed] font:[CamelotTextureComponent getFont] text:[Constants getSwitchButtonText:i] isDown:down];
            
            // disable button release
            switchButtons[i].enabled = NO;
            
            // set layer depth for drawing
            switchButtons[i].notPressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
            switchButtons[i].pressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
            switchButtons[i].label.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            
            // set font size scale
            [switchButtons[i].label setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
            
            // add button to scene and to button group
            [items addObject:switchButtons[i]];
            [switchButtonGroup registerRadioButton:switchButtons[i] forKey:buttonKeys[i]];
            
            y += 67;
            down = NO;
        }
        
        [items addObject:switchButtonGroup];
        
        // init side pane
        sidePane = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropPaneScroll] position:[Vector2 vectorWithX:rect.x + 587 y:rect.y + 44]];
        sidePane.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_GROUNDZERO;
        [items addObject:sidePane];
        
        sidePaneBorder = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropPaneScrollBorder] position:[Vector2 vectorWithX:rect.x + 585 y:rect.y + 42]];
        sidePaneBorder.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        [items addObject:sidePaneBorder];
        
        // init interface content
        interfaceContent[BuildingTypeCastle] = [[CastleInterface alloc] init];
        interfaceContent[BuildingTypeBarracks] = [[BarracksInterface alloc] initWithArea:rect layerDepth:layerDepth];
        interfaceContent[BuildingTypeWarbandCamp] = [[WarbandCampInterface alloc] init];
        interfaceContent[BuildingTypeTrainingYard] = [[TrainingYardInterface alloc] initWithArea:rect layerDepth:layerDepth];
        interfaceContent[BuildingTypeBlacksmith] = [[BlacksmithInterface alloc] init];
        
        [items addObject:interfaceContent[interfaceType]];
    }
    return self;
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    // check if pressed close button
    if ([closeButton wasReleased]) {
        [scene removeItem:self];
    }
    
    // check if a different switch button was pressed
//    for (int i = 0; i < BuildingTypes; i++) {
//        if (switchButtons[i].isDown && i != interfaceType) {
//            // set new interface type and reset all other buttons
//            interfaceType = i;
//
//            for (int j = 0; j < BuildingTypes; j++) {
//                if (j != interfaceType)
//                    [switchButtons[j] reset];
//            }
//
//            break;
//        }
//    }
    
    if (switchButtonGroup.pressedButtonChanged) {
        [switchButtonGroup reset];
        
        for (int i = 0; i < BuildingTypes; i++) {
            if ([switchButtonGroup.pressedButtonKey isEqualToString:buttonKeys[i]] && i != interfaceType) {
                // remove current interface content from scene
                [scene removeItem:interfaceContent[interfaceType]];
                [items removeObject:interfaceContent[interfaceType]];
                
                interfaceType = i;
                
                // add new interface content to scene
                [scene addItem:interfaceContent[interfaceType]];
                [items addObject:interfaceContent[interfaceType]];
            }
        }
    }
}

- (void) dealloc {
    [background release];
    [closeButton release];
    [sidePane release];
    [switchButtonGroup release];
    
    for (int i = 0; i < BuildingTypes; i++) {
        [switchButtons[i] release];
        [buttonKeys[i] release];
    }
    
    [super dealloc];
}

@end
