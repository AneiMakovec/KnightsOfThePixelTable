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
//        [background setColor:[Color rosyBrown]];
        [items addObject:background];
        
        // init close button
        closeButton = [GraphicsComponent getDoubleImageButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_CLOSE atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_CLOSE_BUTTON]];
        closeButton.notPressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        closeButton.pressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:closeButton];
        
        // init gold count
        goldStack = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_ICONS_GOLD_STACK atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_GOLD_STACK]];
        [goldStack setScaleUniform:1.5f];
        goldStack.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:goldStack];
        
        goldCount = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:@"%d", [GameProgress getGold]] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_GOLD_COUNT]];
        [goldCount setScaleUniform:FONT_SCALE_BIG];
        goldCount.horizontalAlign = HorizontalAlignRight;
        goldCount.verticalAlign = VerticalAlignMiddle;
        goldCount.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:goldCount];
        
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
            [switchButtons[i] setScaleUniform:FONT_SCALE_MEDIUM];
            
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
        rooster = [[[Rooster alloc] initWithArea:[Constants getInterfaceScrollRect] itemSize:[Constants getMetaDataForKey:META_INTERFACE_SCROLL].step layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND] autorelease];
        
        // TODO: implement real rooster entries
//        KnightData *firstData = [[KnightData alloc] initWithID:@"Knight1" type:KnightTypeBrawler characterType:CharacterTypeBrave name:@"Sir Lancelot" level:3 currentExp:1000 weaponLvl:0 armorLvl:0];
//
//        KnightData *secondData = [[KnightData alloc] initWithID:@"Knight2" type:KnightTypePaladin characterType:CharacterTypeCalm name:@"Sir Reginald" level:10 currentExp:1500 weaponLvl:0 armorLvl:0];
//
//        KnightData *thirdData = [[KnightData alloc] initWithID:@"Knight3" type:KnightTypeBard characterType:CharacterTypeBold name:@"Sir Ian" level:5 currentExp:2000 weaponLvl:0 armorLvl:0];
//
//        [rooster addItem:firstData];
//        [rooster addItem:secondData];
//        [rooster addItem:thirdData];
//
//        [firstData release];
//        [secondData release];
//        [thirdData release];
        
        // init rooster for trained units
        trainRooster = [[[Rooster alloc] initWithArea:[Constants getInterfaceScrollRect] itemSize:[Constants getMetaDataForKey:META_INTERFACE_SCROLL].step layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BEFOREGROUND] autorelease];
        
//        KnightData *firstTrainData = [[KnightData alloc] initWithID:@"Knight4" type:KnightTypeLongbowman characterType:CharacterTypePrepared name:@"Sir Bowen" level:3 currentExp:0 weaponLvl:0 armorLvl:0];
//
//        KnightData *secondTrainData = [[KnightData alloc] initWithID:@"Knight5" type:KnightTypeCrossbowman characterType:CharacterTypeHasty name:@"Sir Fritz" level:10 currentExp:0 weaponLvl:0 armorLvl:0];
//
//        KnightData *thirdTrainData = [[KnightData alloc] initWithID:@"Knight6" type:KnightTypeScout characterType:CharacterTypeCareful name:@"Sir Donald" level:7 currentExp:0 weaponLvl:0 armorLvl:0];
//
//        KnightData *fourthTrainData = [[KnightData alloc] initWithID:@"Knight7" type:KnightTypeBattlemage characterType:CharacterTypeCareful name:@"Sir Ian" level:7 currentExp:0 weaponLvl:0 armorLvl:0];
//
//        KnightData *fifthTrainData = [[KnightData alloc] initWithID:@"Knight8" type:KnightTypeWizard characterType:CharacterTypeCareful name:@"Sir Jack" level:7 currentExp:0 weaponLvl:0 armorLvl:0];
//
//        KnightData *sixthTrainData = [[KnightData alloc] initWithID:@"Knight9" type:KnightTypeMonk characterType:CharacterTypeCareful name:@"Sir Henry" level:7 currentExp:0 weaponLvl:0 armorLvl:0];
//
//        [trainRooster addItem:firstTrainData];
//        [trainRooster addItem:secondTrainData];
//        [trainRooster addItem:thirdTrainData];
//        [trainRooster addItem:fourthTrainData];
//        [trainRooster addItem:fifthTrainData];
//        [trainRooster addItem:sixthTrainData];
//
//        [firstTrainData release];
//        [secondTrainData release];
//        [thirdTrainData release];
//        [fourthTrainData release];
//        [fifthTrainData release];
//        [sixthTrainData release];
        
        
        
        
        // init interface content
        interfaceContent[BuildingTypeCastle] = [[CastleInterface alloc] initWithLayerDepth:layerDepth + INTERFACE_LAYER_FRONT];
        interfaceContent[BuildingTypeBarracks] = [[BarracksInterface alloc] initWithLayerDepth:layerDepth + INTERFACE_LAYER_FRONT rooster:rooster];
        interfaceContent[BuildingTypeWarbandCamp] = [[WarbandCampInterface alloc] initWithLayerDepth:layerDepth + INTERFACE_LAYER_FRONT rooster:rooster];
        interfaceContent[BuildingTypeTrainingYard] = [[TrainingYardInterface alloc] initWithLayerDepth:layerDepth + INTERFACE_LAYER_FRONT trainRooster:trainRooster rooster:rooster];
        interfaceContent[BuildingTypeBlacksmith] = [[BlacksmithInterface alloc] initWithLayerDepth:layerDepth + INTERFACE_LAYER_FRONT rooster:rooster];
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
        
//        if (interfaceType == BuildingTypeWarbandCamp) {
//            WarbandCampInterface *warbandCamp = (WarbandCampInterface *) interfaceContent[interfaceType];
//            NSLog(@"RESETING ROOSTER");
//            [warbandCamp reset];
//        }
        
        for (int i = 0; i < BuildingTypeGatehouse; i++) {
            if ([switchButtonGroup.pressedButtonKey isEqualToString:buttonKeys[i]] && i != interfaceType) {
                // remove current interface content from scene
                [self removeItemFromScene:interfaceContent[interfaceType]];
                
                // check switching TO FROM interface content
                switch (i) {
                    case BuildingTypeCastle:
                        // remove training rooster and unit info if switching from training yard or remove normal rooster if swithcing from other
                        if (interfaceType == BuildingTypeTrainingYard) {
//                            [self removeItemFromScene:trainRooster];
//                            [self removeItemFromScene:unitNameTrain];
                        } else {
//                            [self removeItemFromScene:rooster];
                            
                            // also remove rooster unit info
//                            if (interfaceType == BuildingTypeBarracks || interfaceType == BuildingTypeBlacksmith) {
//                                [self removeItemFromScene:unitName];
//                            }
                        }
                        
                        if (interfaceType == BuildingTypeWarbandCamp) {
                            WarbandCampInterface *warbandCamp = (WarbandCampInterface *) interfaceContent[interfaceType];
                            [warbandCamp reset];
                        }
                        break;
                        
                    case BuildingTypeBarracks:
                        if (interfaceType != BuildingTypeBlacksmith) {
                            // add rooster unit info
//                            [self addItemToScene:unitName];
                            
                            if (interfaceType != BuildingTypeWarbandCamp) {
                                // add rooster
//                                [self addItemToScene:rooster];
                                
                                if (interfaceType == BuildingTypeTrainingYard) {
                                    // remove train rooster and unit info
//                                    [self removeItemFromScene:trainRooster];
//                                    [self removeItemFromScene:unitNameTrain];
                                }
                            }
                        }
                        
                        if (interfaceType == BuildingTypeWarbandCamp) {
                            WarbandCampInterface *warbandCamp = (WarbandCampInterface *) interfaceContent[interfaceType];
                            [warbandCamp reset];
                        }
                        
                        BarracksInterface *barracks = (BarracksInterface *) interfaceContent[i];
                        [barracks update];
                        break;
                        
                    case BuildingTypeWarbandCamp:
                        if (interfaceType == BuildingTypeBarracks || interfaceType == BuildingTypeBlacksmith) {
                            // remove rooster unit info
//                            [self removeItemFromScene:unitName];
                        } else {
                            // add rooster
//                            [self addItemToScene:rooster];
                            
                            if (interfaceType == BuildingTypeTrainingYard) {
                                // remove train rooster and unit info
//                                [self removeItemFromScene:trainRooster];
//                                [self removeItemFromScene:unitNameTrain];
                            }
                        }
                        
                        WarbandCampInterface *warbandcamp = (WarbandCampInterface *) interfaceContent[i];
                        [warbandcamp update];
                        break;
                        
                    case BuildingTypeTrainingYard:
                        // add train rooster and unit info
//                        [self addItemToScene:trainRooster];
//                        [self addItemToScene:unitNameTrain];
                        
                        if (interfaceType != BuildingTypeCastle) {
                            // remove rooster
//                            [self removeItemFromScene:rooster];
                            
                            if (interfaceType != BuildingTypeWarbandCamp) {
                                // remove rooster unit info
//                                [self removeItemFromScene:unitName];
                            }
                        }
                        
                        if (interfaceType == BuildingTypeWarbandCamp) {
                            WarbandCampInterface *warbandCamp = (WarbandCampInterface *) interfaceContent[interfaceType];
                            [warbandCamp reset];
                        }
                        break;
                        
                    case BuildingTypeBlacksmith:
                        if (interfaceType != BuildingTypeBarracks) {
                            // add rooster unit info
//                            [self addItemToScene:unitName];
                            
                            if (interfaceType != BuildingTypeWarbandCamp) {
                                // add rooster
//                                [self addItemToScene:rooster];
                                
                                if (interfaceType == BuildingTypeTrainingYard) {
                                    // remove train rooster and unit info
//                                    [self removeItemFromScene:trainRooster];
//                                    [self removeItemFromScene:unitNameTrain];
                                }
                            }
                        }
                        
                        if (interfaceType == BuildingTypeWarbandCamp) {
                            WarbandCampInterface *warbandCamp = (WarbandCampInterface *) interfaceContent[interfaceType];
                            [warbandCamp reset];
                        }
                        
                        BlacksmithInterface *blacksmith = (BlacksmithInterface *) interfaceContent[i];
                        [blacksmith updateValues];
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
//    if (rooster.selectionChanged) {
//        // change rooster unit info
//        KnightData *selectedData = [rooster getSelectedData];
//        if (selectedData) {
//            unitName.text = selectedData.name;
//        } else {
//            unitName.text = @"";
//        }
//    }
    
    // check if selection changed in the training rooster
//    if (trainRooster.selectionChanged) {
//        // change train rooster unit info
//        KnightData *selectedData = [trainRooster getSelectedData];
//        if (selectedData) {
//            unitNameTrain.text = selectedData.name;
//        } else {
//            unitNameTrain.text = @"";
//        }
//    }
    if (interfaceType == BuildingTypeCastle) {
        // check if upgrade dices was pressed
        CastleInterface *castle = (CastleInterface *) interfaceContent[BuildingTypeCastle];
        if ([castle upgradeButtonReleased]) {
            if ([GameProgress getGold] >= [Constants getUpgradeCostOfDicesLvl:[GameProgress getDiceLvl]]) {
                [GameProgress buyValue:[Constants getUpgradeCostOfDicesLvl:[GameProgress getDiceLvl]]];
                [GameProgress upgradeNumOfDices];
                
                [castle updateDices];
                [castle updateButton];
                [self updateGoldCounter];
            }
        }
    } else if (interfaceType == BuildingTypeBarracks) {
        // check if skill upgrade was pressed
        BarracksInterface *barracks = (BarracksInterface *) interfaceContent[BuildingTypeBarracks];
        for (int i = 0; i < SkillTypes; i++) {
            if ([barracks wasSkillUpgradeButtonReleased:i]) {
                if ([GameProgress getGold] >= [Constants getUpgradeCostOfSkillLvl:i]) {
                    [GameProgress buyValue:[Constants getUpgradeCostOfSkillLvl:i]];
                    [barracks upgradeSkill:i];
                    
                    [self updateGoldCounter];
                }
            }
        }
    } else if (interfaceType == BuildingTypeBlacksmith) {
        // check if equipment upgrade was pressed
        BlacksmithInterface *blacksmith = (BlacksmithInterface *) interfaceContent[BuildingTypeBlacksmith];
        if ([blacksmith wasUpgradeEquipmentPressed]) {
            int cost = [Constants getUpgradeCostOfEquipmentLvl:[blacksmith getCurrentEquipmentLvl]];
            if ([GameProgress getGold] >= cost) {
                [GameProgress buyValue:cost];
                
                [blacksmith upgradeEquipment];
                [blacksmith updateValues];
                
                [self updateGoldCounter];
            }
        }
    }
}

- (void) updateContent:(BuildingType)type {
    // remove current interface content from scene
    if (interfaceType != NoBuilding) {
        if (interfaceType == BuildingTypeWarbandCamp) {
            WarbandCampInterface *warbandCamp = (WarbandCampInterface *) interfaceContent[interfaceType];
            [warbandCamp reset];
        }
        
        [items removeObject:interfaceContent[interfaceType]];
//        [items removeObject:rooster];
//        [items removeObject:trainRooster];
    }
    
    // check switching TO FROM interface content
//    switch (type) {
//        case BuildingTypeCastle:
            // remove training rooster and unit info if switching from training yard or remove normal rooster if swithcing from other
//            if (interfaceType == BuildingTypeTrainingYard) {
//                [items removeObject:trainRooster];
////                [self removeItemFromScene:unitNameTrain];
//            } else {
//                [items removeObject:rooster];
//
//                // also remove rooster unit info
//                if (interfaceType == BuildingTypeBarracks || interfaceType == BuildingTypeBlacksmith) {
////                    [self removeItemFromScene:unitName];
//                }
//            }
//            break;
            
//        case BuildingTypeBarracks:
//            if (interfaceType != BuildingTypeBlacksmith) {
//                // add rooster unit info
////                [self addItemToScene:unitName];
//
//                if (interfaceType != BuildingTypeWarbandCamp) {
//                    // add rooster
//                    [items addObject:rooster];

//                    if (interfaceType == BuildingTypeTrainingYard) {
//                        // remove train rooster and unit info
//                        [items removeObject:trainRooster];
////                        [self removeItemFromScene:unitNameTrain];
//                    }
//                }
//            }

//            BarracksInterface *barracks = (BarracksInterface *) interfaceContent[type];
//            [barracks update];
//            break;
    
//        case BuildingTypeWarbandCamp:
//            if (interfaceType == BuildingTypeBarracks || interfaceType == BuildingTypeBlacksmith) {
//                // remove rooster unit info
////                [self removeItemFromScene:unitName];
//            } else {
//                // add rooster
//                [items removeObject:rooster];
//
//                if (interfaceType == BuildingTypeTrainingYard) {
//                    // remove train rooster and unit info
//                    [items removeObject:trainRooster];
////                    [self removeItemFromScene:unitNameTrain];
//                }
//            }
//            break;
//
//        case BuildingTypeTrainingYard:
            // add train rooster and unit info
//            [items addObject:trainRooster];
//            [self addItemToScene:unitNameTrain];
            
//            if (interfaceType != BuildingTypeCastle) {
//                // remove rooster
//                [items removeObject:rooster];
//
//                if (interfaceType != BuildingTypeWarbandCamp) {
//                    // remove rooster unit info
////                    [self removeItemFromScene:unitName];
//                }
//            }
//            break;
//
//        case BuildingTypeBlacksmith:
//            if (interfaceType != BuildingTypeBarracks) {
//                // add rooster unit info
////                [self addItemToScene:unitName];
//
//                if (interfaceType != BuildingTypeWarbandCamp) {
//                    // add rooster
//                    [items addObject:rooster];
//
//                    if (interfaceType == BuildingTypeTrainingYard) {
//                        // remove train rooster and unit info
//                        [items removeObject:trainRooster];
////                        [self removeItemFromScene:unitNameTrain];
//                    }
//                }
//            }
            
//            BlacksmithInterface *blacksmith = (BlacksmithInterface *) interfaceContent[type];
//            [blacksmith updateValues];
//            break;
//
//        default:
//            break;
//    }
    
    if (interfaceType != NoBuilding)
        switchButtons[interfaceType].isDown  = NO;
    
    switchButtons[type].isDown = YES;
    
    interfaceType = type;
    
    if (interfaceType == BuildingTypeWarbandCamp) {
        WarbandCampInterface *warbandcamp = (WarbandCampInterface *) interfaceContent[interfaceType];
        [warbandcamp update];
    } else if (interfaceType == BuildingTypeBlacksmith) {
        BlacksmithInterface *blacksmith = (BlacksmithInterface *) interfaceContent[interfaceType];
        [blacksmith updateValues];
    } else if (interfaceType == BuildingTypeBarracks) {
        BarracksInterface *barracks = (BarracksInterface *) interfaceContent[interfaceType];
        [barracks update];
    }
    
    // add new interface content to scene
    [items addObject:interfaceContent[interfaceType]];
}


- (void) updateGoldCounter {
    goldCount.text = [NSString stringWithFormat:@"%d", [GameProgress getGold]];
}

- (void) updateRoosters {
    [rooster removeAllItems];
    for (KnightData *data in [GameProgress getKnights]) {
        [rooster addItem:data];
    }
    
    [trainRooster removeAllItems];
    for (KnightData *data in [GameProgress getTrainKnights]) {
        [trainRooster addItem:data];
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
    
    for (int i = 0; i < BuildingTypeGatehouse; i++) {
        [switchButtons[i] release];
        [buttonKeys[i] release];
        [interfaceContent[i] release];
    }
    
//    [unitName release];
//    [unitNameTrain release];
    [goldCount release];
    [goldStack release];
    
    [super dealloc];
}

@end
