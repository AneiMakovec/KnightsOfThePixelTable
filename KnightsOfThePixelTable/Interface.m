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
        
        // init rooster
        rooster = [[Rooster alloc] initWithArea:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 width:164 height:323] itemSize:33];
        
        // TODO: implement real rooster entries
        KnightData *firstData = [[KnightData alloc] initWithID:@"Knight1" type:KnightTypeBrawler name:@"Sir Lancelot" level:3 currentExp:0 weaponLvl:2 armorLvl:4];
        firstLine = [[RoosterEntry alloc] initWithKnightData:firstData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        [firstData release];
        
        KnightData *secondData = [[KnightData alloc] initWithID:@"Knight2" type:KnightTypePaladin name:@"Sir Reginald" level:10 currentExp:150 weaponLvl:3 armorLvl:6];
        secondLine = [[RoosterEntry alloc] initWithKnightData:secondData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 + 34 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        [secondData release];
        
        KnightData *thirdData = [[KnightData alloc] initWithID:@"Knight3" type:KnightTypeBowman name:@"Sir Ian" level:5 currentExp:1135 weaponLvl:5 armorLvl:6];
        thirdLine = [[RoosterEntry alloc] initWithKnightData:thirdData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 + 34 + 35 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        [thirdData release];
        
        [rooster addItem:firstLine];
        [rooster addItem:secondLine];
        [rooster addItem:thirdLine];
        
        [items addObject:rooster];
        
        // init rooster for trained units
        trainRooster = [[Rooster alloc] initWithArea:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 width:164 height:323] itemSize:33];
        
        KnightData *firstTrainData = [[KnightData alloc] initWithID:@"Knight4" type:KnightTypeBowman name:@"Sir Bowen" level:3 currentExp:0 weaponLvl:2 armorLvl:4];
        firstTrainLine = [[RoosterEntry alloc] initWithKnightData:firstTrainData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        [firstTrainData release];
        
        KnightData *secondTrainData = [[KnightData alloc] initWithID:@"Knight5" type:KnightTypeFireEnchantress name:@"Sir Fritz" level:10 currentExp:150 weaponLvl:3 armorLvl:6];
        secondTrainLine = [[RoosterEntry alloc] initWithKnightData:secondTrainData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 + 34 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        [secondTrainData release];
        
        [trainRooster addItem:firstTrainLine];
        [trainRooster addItem:secondTrainLine];
        
        
        
        // init interface content
        interfaceContent[BuildingTypeCastle] = [[CastleInterface alloc] initWithArea:rect layerDepth:layerDepth];
        interfaceContent[BuildingTypeBarracks] = [[BarracksInterface alloc] initWithArea:rect layerDepth:layerDepth rooster:rooster];
        interfaceContent[BuildingTypeWarbandCamp] = [[WarbandCampInterface alloc] initWithArea:rect layerDepth:layerDepth rooster:rooster];
        interfaceContent[BuildingTypeTrainingYard] = [[TrainingYardInterface alloc] initWithArea:rect layerDepth:layerDepth rooster:trainRooster];
        interfaceContent[BuildingTypeBlacksmith] = [[BlacksmithInterface alloc] initWithArea:rect layerDepth:layerDepth rooster:rooster];
        
        [items addObject:interfaceContent[interfaceType]];
    }
    return self;
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    // check if pressed close button
    if ([closeButton wasReleased]) {
        [scene removeItem:self];
    }
    
    // check if different switch button was pressed
    if (switchButtonGroup.pressedButtonChanged) {
        [switchButtonGroup reset];
        
        for (int i = 0; i < BuildingTypes; i++) {
            if ([switchButtonGroup.pressedButtonKey isEqualToString:buttonKeys[i]] && i != interfaceType) {
                // remove current interface content from scene
                [self removeItemFromScene:interfaceContent[interfaceType]];
                
                // if switching to castle
                if (i == BuildingTypeCastle) {
                    // remove training rooster if switching from training yard or remove normal rooster if swithcing from other
                    if (interfaceType == BuildingTypeTrainingYard)
                        [self removeItemFromScene:trainRooster];
                    else
                        [self removeItemFromScene:rooster];
                // if switching from castle
                } else if (interfaceType == BuildingTypeCastle) {
                    // add training rooster if switching to training yard or add normal rooster if swithcing to other
                    if (i == BuildingTypeTrainingYard)
                        [self addItemToScene:trainRooster];
                    else
                        [self addItemToScene:rooster];
                // if switching to training yard
                } else if (i == BuildingTypeTrainingYard) {
                    // if switching from other than castle remove normal rooster and add train rooster
                    if (interfaceType != BuildingTypeCastle)
                        [self removeItemFromScene:rooster];
                    
                    [self addItemToScene:trainRooster];
                // if switching from training yard
                } else if (interfaceType == BuildingTypeTrainingYard) {
                    [self removeItemFromScene:trainRooster];
                    
                    // if switching to other than castle add normal rooster
                    if (i != BuildingTypeCastle)
                        [self addItemToScene:rooster];
                }
                
                interfaceType = i;
                
                // add new interface content to scene
                [self addItemToScene:interfaceContent[interfaceType]];
            }
        }
    }
    
    // check which item is pressed in the rooster
    if (rooster.selectionChanged) {
        NSLog([rooster getSelectedEntry].name);
    }
    
    // check which item is pressed in the training rooster
    if (trainRooster.selectionChanged) {
        NSLog([trainRooster getSelectedEntry].name);
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
