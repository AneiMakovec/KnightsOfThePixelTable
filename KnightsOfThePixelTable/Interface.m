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

- (id) initWithMenu:(TownMenu *)theMenu layerDepth:(float)layerDepth {
    self = [super init];
    if (self != nil) {
        menu = theMenu;
        
        interfaceType = NoBuilding;
        
        // init interface background
        background = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_BACKGROUND atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BACKGROUND]];
        background.layerDepth = layerDepth;
        [items addObject:background];
        
        // init close button
        closeButton = [GraphicsComponent getDoubleImageButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_CLOSE atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_CLOSE_BUTTON]];
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
        NSString *buttonPosKey = POSITION_INTERFACE_SWITCHING_BUTTONS;
        NSString *buttonTextKey = TEXT_INTERFACE_SWITCHING_BUTTONS;
        for (int i = 0; i < BuildingTypeGatehouse; i++) {
            // init button
            switchButtons[i] = [GraphicsComponent getDoubleImageLabelRadioButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_DEFAULT atPosition:[Constants getPositionDataForKey:[buttonPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] text:[Constants getTextForKey:[buttonTextKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] isDown:NO];
            
            // disable button release
            switchButtons[i].enabled = NO;
            
            // set layer depth for drawing
            switchButtons[i].notPressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
            switchButtons[i].pressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
            switchButtons[i].label.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            
            // set font size scale
            [switchButtons[i].label setScaleUniform:FONT_SCALE_MEDIUM];
            
            // add button to scene and to button group
            [items addObject:switchButtons[i]];
            [switchButtonGroup registerRadioButton:switchButtons[i] forKey:buttonKeys[i]];
        }
        
        [items addObject:switchButtonGroup];
        
        // init side pane
        sidePane = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_PANE_SCROLL atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_SCROLL_BACKGOUND]];
        sidePane.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_GROUNDZERO;
        [items addObject:sidePane];
        
        sidePaneBorder = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_PANE_SCROLL_BORDER atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_SCROLL_BORDER]];
        sidePaneBorder.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        [items addObject:sidePaneBorder];
        
        // init rooster
        rooster = [[Rooster alloc] initWithArea:[Constants getInterfaceScrollRect] itemSize:[Constants getMetaDataForKey:META_INTERFACE_SCROLL].step layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        // TODO: implement real rooster entries
        KnightData *firstData = [[KnightData alloc] initWithID:@"Knight1" type:KnightTypeBrawler name:@"Sir Lancelot" level:3 currentExp:0 weaponLvl:2 armorLvl:4];
//        firstLine = [[RoosterEntry alloc] initWithKnightData:firstData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        KnightData *secondData = [[KnightData alloc] initWithID:@"Knight2" type:KnightTypePaladin name:@"Sir Reginald" level:10 currentExp:150 weaponLvl:3 armorLvl:6];
//        secondLine = [[RoosterEntry alloc] initWithKnightData:secondData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 + 34 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        KnightData *thirdData = [[KnightData alloc] initWithID:@"Knight3" type:KnightTypeLongbowman name:@"Sir Ian" level:5 currentExp:1135 weaponLvl:5 armorLvl:6];
//        thirdLine = [[RoosterEntry alloc] initWithKnightData:thirdData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 + 34 + 35 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        [rooster addItem:firstData];
        [rooster addItem:secondData];
        [rooster addItem:thirdData];
        
        [firstData release];
        [secondData release];
        [thirdData release];
        
        // init rooster for trained units
        trainRooster = [[Rooster alloc] initWithArea:[Constants getInterfaceScrollRect] itemSize:[Constants getMetaDataForKey:META_INTERFACE_SCROLL].step layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        KnightData *firstTrainData = [[KnightData alloc] initWithID:@"Knight4" type:KnightTypeLongbowman name:@"Sir Bowen" level:3 currentExp:0 weaponLvl:2 armorLvl:4];
//        firstTrainLine = [[RoosterEntry alloc] initWithKnightData:firstTrainData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        KnightData *secondTrainData = [[KnightData alloc] initWithID:@"Knight5" type:KnightTypeWizard name:@"Sir Fritz" level:10 currentExp:150 weaponLvl:3 armorLvl:6];
//        secondTrainLine = [[RoosterEntry alloc] initWithKnightData:secondTrainData toRectangle:[Rectangle rectangleWithX:rect.x + 587 y:rect.y + 44 + 34 width:165 height:33] layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND];
        
        [trainRooster addItem:firstTrainData];
        [trainRooster addItem:secondTrainData];
        
        [firstTrainData release];
        [secondTrainData release];
        
        
        
        
        // init interface content
        interfaceContent[BuildingTypeCastle] = [[CastleInterface alloc] initWithLayerDepth:layerDepth];
        interfaceContent[BuildingTypeBarracks] = [[BarracksInterface alloc] initWithLayerDepth:layerDepth rooster:rooster];
        interfaceContent[BuildingTypeWarbandCamp] = [[WarbandCampInterface alloc] initWithLayerDepth:layerDepth rooster:rooster];
        interfaceContent[BuildingTypeTrainingYard] = [[TrainingYardInterface alloc] initWithLayerDepth:layerDepth trainRooster:trainRooster rooster:rooster];
        interfaceContent[BuildingTypeBlacksmith] = [[BlacksmithInterface alloc] initWithLayerDepth:layerDepth rooster:rooster];
        
        // init unit name
        unitName = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[rooster getFirstData].name position:[Vector2 vectorWithX:128 + 385 y:64 + 15]];
        unitName.verticalAlign = VerticalAlignTop;
        unitName.horizontalAlign = HorizontalAlignCenter;
        unitName.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [unitName setScaleUniform:FONT_SCALE_MEDIUM];
        
        // init train unit info
        unitNameTrain = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[trainRooster getFirstData].name position:[Vector2 vectorWithX:128 + 385 y:64 + 15]];
        unitNameTrain.verticalAlign = VerticalAlignTop;
        unitNameTrain.horizontalAlign = HorizontalAlignCenter;
        unitNameTrain.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [unitNameTrain setScaleUniform:FONT_SCALE_MEDIUM];
    }
    return self;
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    // check if pressed close button
    if ([closeButton wasReleased]) {
        [menu enableBuildings];
        [scene removeItem:self];
        return;
    }
    
    // check if different switch button was pressed
    if (switchButtonGroup.pressedButtonChanged) {
        [switchButtonGroup reset];
        
        for (int i = 0; i < BuildingTypeGatehouse; i++) {
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
                        } else {
                            [self removeItemFromScene:rooster];
                            
                            // also remove rooster unit info
                            if (interfaceType == BuildingTypeBarracks || interfaceType == BuildingTypeBlacksmith) {
                                [self removeItemFromScene:unitName];
                            }
                        }
                        break;
                        
                    case BuildingTypeBarracks:
                        if (interfaceType != BuildingTypeBlacksmith) {
                            // add rooster unit info
                            [self addItemToScene:unitName];
                            
                            if (interfaceType != BuildingTypeWarbandCamp) {
                                // add rooster
                                [self addItemToScene:rooster];
                                
                                if (interfaceType == BuildingTypeTrainingYard) {
                                    // remove train rooster and unit info
                                    [self removeItemFromScene:trainRooster];
                                    [self removeItemFromScene:unitNameTrain];
                                }
                            }
                        }
                        break;
                        
                    case BuildingTypeWarbandCamp:
                        if (interfaceType == BuildingTypeBarracks || interfaceType == BuildingTypeBlacksmith) {
                            // remove rooster unit info
                            [self removeItemFromScene:unitName];
                        } else {
                            // add rooster
                            [self addItemToScene:rooster];
                            
                            if (interfaceType == BuildingTypeTrainingYard) {
                                // remove train rooster and unit info
                                [self removeItemFromScene:trainRooster];
                                [self removeItemFromScene:unitNameTrain];
                            }
                        }
                        break;
                        
                    case BuildingTypeTrainingYard:
                        // add train rooster and unit info
                        [self addItemToScene:trainRooster];
                        [self addItemToScene:unitNameTrain];
                        
                        if (interfaceType != BuildingTypeCastle) {
                            // remove rooster
                            [self removeItemFromScene:rooster];
                            
                            if (interfaceType != BuildingTypeWarbandCamp) {
                                // remove rooster unit info
                                [self removeItemFromScene:unitName];
                            }
                        }
                        break;
                        
                    case BuildingTypeBlacksmith:
                        if (interfaceType != BuildingTypeBarracks) {
                            // add rooster unit info
                            [self addItemToScene:unitName];
                            
                            if (interfaceType != BuildingTypeWarbandCamp) {
                                // add rooster
                                [self addItemToScene:rooster];
                                
                                if (interfaceType == BuildingTypeTrainingYard) {
                                    // remove train rooster and unit info
                                    [self removeItemFromScene:trainRooster];
                                    [self removeItemFromScene:unitNameTrain];
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
        } else {
            unitName.text = @"";
        }
    }
    
    // check if selection changed in the training rooster
    if (trainRooster.selectionChanged) {
        // change train rooster unit info
        KnightData *selectedData = [trainRooster getSelectedData];
        if (selectedData) {
            unitNameTrain.text = selectedData.name;
        } else {
            unitNameTrain.text = @"";
        }
    }
}

- (void) updateContent:(BuildingType)type {
    // remove current interface content from scene
    if (interfaceType != NoBuilding)
        [self removeItemFromScene:interfaceContent[interfaceType]];
    
    // check switching TO FROM interface content
    switch (type) {
        case BuildingTypeCastle:
            // remove training rooster and unit info if switching from training yard or remove normal rooster if swithcing from other
            if (interfaceType == BuildingTypeTrainingYard) {
                [self removeItemFromScene:trainRooster];
                [self removeItemFromScene:unitNameTrain];
            } else {
                [self removeItemFromScene:rooster];
                
                // also remove rooster unit info
                if (interfaceType == BuildingTypeBarracks || interfaceType == BuildingTypeBlacksmith) {
                    [self removeItemFromScene:unitName];
                }
            }
            break;
            
        case BuildingTypeBarracks:
            if (interfaceType != BuildingTypeBlacksmith) {
                // add rooster unit info
                [self addItemToScene:unitName];
                
                if (interfaceType != BuildingTypeWarbandCamp) {
                    // add rooster
                    [self addItemToScene:rooster];
                    
                    if (interfaceType == BuildingTypeTrainingYard) {
                        // remove train rooster and unit info
                        [self removeItemFromScene:trainRooster];
                        [self removeItemFromScene:unitNameTrain];
                    }
                }
            }
            break;
            
        case BuildingTypeWarbandCamp:
            if (interfaceType == BuildingTypeBarracks || interfaceType == BuildingTypeBlacksmith) {
                // remove rooster unit info
                [self removeItemFromScene:unitName];
            } else {
                // add rooster
                [self addItemToScene:rooster];
                
                if (interfaceType == BuildingTypeTrainingYard) {
                    // remove train rooster and unit info
                    [self removeItemFromScene:trainRooster];
                    [self removeItemFromScene:unitNameTrain];
                }
            }
            break;
            
        case BuildingTypeTrainingYard:
            // add train rooster and unit info
            [self addItemToScene:trainRooster];
            [self addItemToScene:unitNameTrain];
            
            if (interfaceType != BuildingTypeCastle) {
                // remove rooster
                [self removeItemFromScene:rooster];
                
                if (interfaceType != BuildingTypeWarbandCamp) {
                    // remove rooster unit info
                    [self removeItemFromScene:unitName];
                }
            }
            break;
            
        case BuildingTypeBlacksmith:
            if (interfaceType != BuildingTypeBarracks) {
                // add rooster unit info
                [self addItemToScene:unitName];
                
                if (interfaceType != BuildingTypeWarbandCamp) {
                    // add rooster
                    [self addItemToScene:rooster];
                    
                    if (interfaceType == BuildingTypeTrainingYard) {
                        // remove train rooster and unit info
                        [self removeItemFromScene:trainRooster];
                        [self removeItemFromScene:unitNameTrain];
                    }
                }
            }
            break;
            
        default:
            break;
    }
    
    if (interfaceType != NoBuilding)
        switchButtons[interfaceType].isDown  = NO;
    
    switchButtons[type].isDown = YES;
    
    interfaceType = type;
    
    // add new interface content to scene
    [self addItemToScene:interfaceContent[interfaceType]];
}

- (void) dealloc {
    [background release];
    [closeButton release];
    [sidePane release];
    [sidePaneBorder release];
    [switchButtonGroup release];
    [rooster release];
    [trainRooster release];
    
    for (int i = 0; i < BuildingTypeGatehouse; i++) {
        [switchButtons[i] release];
        [buttonKeys[i] release];
        [interfaceContent[i] release];
    }
    
    [unitName release];
    [unitNameTrain release];
    
    [super dealloc];
}

@end
