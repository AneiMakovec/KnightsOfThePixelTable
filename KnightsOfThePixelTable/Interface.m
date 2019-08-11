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
        rooster = [[Rooster alloc] initWithArea:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 width:164 height:323] itemSize:33 layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        // TODO: implement real rooster entries
        KnightData *firstData = [[KnightData alloc] initWithID:@"Knight1" type:KnightTypeBrawler name:@"Sir Lancelot" level:3 currentExp:0 weaponLvl:2 armorLvl:4];
//        firstLine = [[RoosterEntry alloc] initWithKnightData:firstData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        KnightData *secondData = [[KnightData alloc] initWithID:@"Knight2" type:KnightTypePaladin name:@"Sir Reginald" level:10 currentExp:150 weaponLvl:3 armorLvl:6];
//        secondLine = [[RoosterEntry alloc] initWithKnightData:secondData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 + 34 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        KnightData *thirdData = [[KnightData alloc] initWithID:@"Knight3" type:KnightTypeBowman name:@"Sir Ian" level:5 currentExp:1135 weaponLvl:5 armorLvl:6];
//        thirdLine = [[RoosterEntry alloc] initWithKnightData:thirdData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 + 34 + 35 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        [rooster addItem:firstData];
        [rooster addItem:secondData];
        [rooster addItem:thirdData];
        
        [firstData release];
        [secondData release];
        [thirdData release];
        
        // init rooster for trained units
        trainRooster = [[Rooster alloc] initWithArea:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 width:164 height:323] itemSize:33 layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        KnightData *firstTrainData = [[KnightData alloc] initWithID:@"Knight4" type:KnightTypeBowman name:@"Sir Bowen" level:3 currentExp:0 weaponLvl:2 armorLvl:4];
//        firstTrainLine = [[RoosterEntry alloc] initWithKnightData:firstTrainData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        KnightData *secondTrainData = [[KnightData alloc] initWithID:@"Knight5" type:KnightTypeFireEnchantress name:@"Sir Fritz" level:10 currentExp:150 weaponLvl:3 armorLvl:6];
//        secondTrainLine = [[RoosterEntry alloc] initWithKnightData:secondTrainData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 + 34 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        [trainRooster addItem:firstTrainData];
        [trainRooster addItem:secondTrainData];
        
        [firstTrainData release];
        [secondTrainData release];
        
        if (type != BuildingTypeCastle) {
            if (type == BuildingTypeTrainingYard)
                [items addObject:trainRooster];
            else
                [items addObject:rooster];
        }
            
        
        
        
        // init interface content
        interfaceContent[BuildingTypeCastle] = [[CastleInterface alloc] initWithArea:rect layerDepth:layerDepth];
        interfaceContent[BuildingTypeBarracks] = [[BarracksInterface alloc] initWithArea:rect layerDepth:layerDepth rooster:rooster];
        interfaceContent[BuildingTypeWarbandCamp] = [[WarbandCampInterface alloc] initWithArea:rect layerDepth:layerDepth rooster:rooster];
        interfaceContent[BuildingTypeTrainingYard] = [[TrainingYardInterface alloc] initWithArea:rect layerDepth:layerDepth trainRooster:trainRooster rooster:rooster];
        interfaceContent[BuildingTypeBlacksmith] = [[BlacksmithInterface alloc] initWithArea:rect layerDepth:layerDepth rooster:rooster];
        
        [items addObject:interfaceContent[interfaceType]];
        
        
        // init unit info
        unitTypes[KnightTypeBrawler] = @"Brawler";
        unitTypes[KnightTypeBowman] = @"Bowman";
        unitTypes[KnightTypePaladin] = @"Paladin";
        unitTypes[KnightTypeFireEnchantress] = @"Fire enchantress";
        
        unitName = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:[rooster getFirstData].name position:[Vector2 vectorWithX:rect.x + 385 y:rect.y + 15]];
        unitName.verticalAlign = VerticalAlignTop;
        unitName.horizontalAlign = HorizontalAlignCenter;
        unitName.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [unitName setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        
        unitType = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:unitTypes[[rooster getFirstData].type] position:[Vector2 vectorWithX:rect.x + 385 y:rect.y + 30]];
        unitType.verticalAlign = VerticalAlignTop;
        unitType.horizontalAlign = HorizontalAlignCenter;
        unitType.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [unitType setScaleUniform:INTERFACE_SCALE_FONT_SMALL];
        
        if (type == BuildingTypeBarracks || type == BuildingTypeBlacksmith) {
            [items addObject:unitName];
            [items addObject:unitType];
        }
        
        // init train unit info
        unitNameTrain = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:[trainRooster getFirstData].name position:[Vector2 vectorWithX:rect.x + 385 y:rect.y + 15]];
        unitNameTrain.verticalAlign = VerticalAlignTop;
        unitNameTrain.horizontalAlign = HorizontalAlignCenter;
        unitNameTrain.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [unitNameTrain setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        
        unitTypeTrain = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:unitTypes[[trainRooster getFirstData].type] position:[Vector2 vectorWithX:rect.x + 385 y:rect.y + 30]];
        unitTypeTrain.verticalAlign = VerticalAlignTop;
        unitTypeTrain.horizontalAlign = HorizontalAlignCenter;
        unitTypeTrain.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [unitTypeTrain setScaleUniform:INTERFACE_SCALE_FONT_SMALL];
        
        if (type == BuildingTypeTrainingYard) {
            [items addObject:unitNameTrain];
            [items addObject:unitTypeTrain];
        }
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
                
                // check switching TO FROM interface content
                switch (i) {
                    case BuildingTypeCastle:
                        // remove training rooster and unit info if switching from training yard or remove normal rooster if swithcing from other
                        if (interfaceType == BuildingTypeTrainingYard) {
                            [self removeItemFromScene:trainRooster];
                            [self removeItemFromScene:unitNameTrain];
                            [self removeItemFromScene:unitTypeTrain];
                        } else {
                            [self removeItemFromScene:rooster];
                            
                            // also remove rooster unit info
                            if (interfaceType == BuildingTypeBarracks || interfaceType == BuildingTypeBlacksmith) {
                                [self removeItemFromScene:unitName];
                                [self removeItemFromScene:unitType];
                            }
                        }
                        break;
                        
                    case BuildingTypeBarracks:
                        if (interfaceType != BuildingTypeBlacksmith) {
                            // add rooster unit info
                            [self addItemToScene:unitName];
                            [self addItemToScene:unitType];
                            
                            if (interfaceType != BuildingTypeWarbandCamp) {
                                // add rooster
                                [self addItemToScene:rooster];
                                
                                if (interfaceType == BuildingTypeTrainingYard) {
                                    // remove train rooster and unit info
                                    [self removeItemFromScene:trainRooster];
                                    [self removeItemFromScene:unitNameTrain];
                                    [self removeItemFromScene:unitTypeTrain];
                                }
                            }
                        }
                        break;
                        
                    case BuildingTypeWarbandCamp:
                        if (interfaceType == BuildingTypeBarracks || interfaceType == BuildingTypeBlacksmith) {
                            // remove rooster unit info
                            [self removeItemFromScene:unitName];
                            [self removeItemFromScene:unitType];
                        } else {
                            // add rooster
                            [self addItemToScene:rooster];
                            
                            if (interfaceType == BuildingTypeTrainingYard) {
                                // remove train rooster and unit info
                                [self removeItemFromScene:trainRooster];
                                [self removeItemFromScene:unitNameTrain];
                                [self removeItemFromScene:unitTypeTrain];
                            }
                        }
                        break;
                        
                    case BuildingTypeTrainingYard:
                        // add train rooster and unit info
                        [self addItemToScene:trainRooster];
                        [self addItemToScene:unitNameTrain];
                        [self addItemToScene:unitTypeTrain];
                        
                        if (interfaceType != BuildingTypeCastle) {
                            // remove rooster
                            [self removeItemFromScene:rooster];
                            
                            if (interfaceType != BuildingTypeWarbandCamp) {
                                // remove rooster unit info
                                [self removeItemFromScene:unitName];
                                [self removeItemFromScene:unitType];
                            }
                        }
                        break;
                        
                    case BuildingTypeBlacksmith:
                        if (interfaceType != BuildingTypeBarracks) {
                            // add rooster unit info
                            [self addItemToScene:unitName];
                            [self addItemToScene:unitType];
                            
                            if (interfaceType != BuildingTypeWarbandCamp) {
                                // add rooster
                                [self addItemToScene:rooster];
                                
                                if (interfaceType == BuildingTypeTrainingYard) {
                                    // remove train rooster and unit info
                                    [self removeItemFromScene:trainRooster];
                                    [self removeItemFromScene:unitNameTrain];
                                    [self removeItemFromScene:unitTypeTrain];
                                }
                            }
                        }
                        break;
                        
                    default:
                        break;
                }
                
                interfaceType = i;
                
                // add new interface content to scene
                [self addItemToScene:interfaceContent[interfaceType]];
            }
        }
    }
    
    // check if selection changed in the rooster
    if (rooster.selectionChanged) {
        // change rooster unit info
        KnightData *selectedData = [rooster getSelectedData];
        if (selectedData) {
            unitName.text = selectedData.name;
            unitType.text = unitTypes[selectedData.type];
        } else {
            unitName.text = @"";
            unitType.text = @"";
        }
    }
    
    // check if selection changed in the training rooster
    if (trainRooster.selectionChanged) {
        // change train rooster unit info
        KnightData *selectedData = [trainRooster getSelectedData];
        if (selectedData) {
            unitNameTrain.text = selectedData.name;
            unitTypeTrain.text = unitTypes[selectedData.type];
        } else {
            unitNameTrain.text = @"";
            unitTypeTrain.text = @"";
        }
    }
}

- (void) dealloc {
    [background release];
    [closeButton release];
    [sidePane release];
    [sidePaneBorder release];
    [switchButtonGroup release];
    [rooster release];
    [trainRooster release];
    
    for (int i = 0; i < BuildingTypes; i++) {
        [switchButtons[i] release];
        [buttonKeys[i] release];
        [interfaceContent[i] release];
    }
    
    [unitName release];
    [unitType release];
    [unitNameTrain release];
    [unitTypeTrain release];
    
    for (int i = 0; i < KnightTypes; i++) {
        [unitTypes[i] release];
    }
    
    [super dealloc];
}

@end
