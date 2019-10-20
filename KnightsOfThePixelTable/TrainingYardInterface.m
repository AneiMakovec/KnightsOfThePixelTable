//
//  TrainingYardInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "TrainingYardInterface.h"

#import "Pixlron.Knights.h"

#define KEY_STATS @"stats"
#define KEY_SKILLS @"skills"
#define KEY_EQUIPMENT @"equipment"

#define DEPTH_DIFF -0.1f

@implementation TrainingYardInterface

- (id) initWithLayerDepth:(float)depth trainRooster:(Rooster *)theTrainRooster rooster:(Rooster *)theRooster {
    self = [super init];
    if (self != nil) {
        showDepth = depth + INTERFACE_LAYER_DEPTH_GROUNDBACK + DEPTH_DIFF;
        hideDepth = depth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        
        showColor = [[Color white] retain];
        hideColor = [[Color gray] retain];
        
        // retain rooster
        rooster = [theRooster retain];
        trainRooster = [theTrainRooster retain];
        
        // init tabs
//        tabs = [[RadioButtonGroup alloc] init];
//
//        tabStats = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 227 y:area.y + 183 width:80 height:16] background:[TownSpriteComponent getInterfaceProp:InterfacePropTab] font:[TownSpriteComponent getFont] text:@"Stats" isDown:YES];
//        tabStats.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        tabStats.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [tabStats.label setScaleUniform:FONT_SCALE_TINY];
//        [tabs registerRadioButton:tabStats forKey:KEY_STATS];
//        [items addObject:tabStats];
//
//        tabSkills = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 307 y:area.y + 183 width:80 height:16] background:[TownSpriteComponent getInterfaceProp:InterfacePropTab] font:[TownSpriteComponent getFont] text:@"Skills" isDown:NO];
//        tabSkills.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        tabSkills.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [tabSkills.label setScaleUniform:FONT_SCALE_TINY];
//        [tabs registerRadioButton:tabSkills forKey:KEY_SKILLS];
//        [items addObject:tabSkills];
//
//        tabEquipment = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 387 y:area.y + 183 width:80 height:16] background:[TownSpriteComponent getInterfaceProp:InterfacePropTab] font:[TownSpriteComponent getFont] text:@"Equipment" isDown:NO];
//        tabEquipment.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        tabEquipment.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [tabEquipment.label setScaleUniform:FONT_SCALE_TINY];
//        [tabs registerRadioButton:tabEquipment forKey:KEY_EQUIPMENT];
//        [items addObject:tabEquipment];
//
//        [items addObject:tabs];
        
//        // init pane for stats, skills and equipment
//        statPanel = [[StatsPanel alloc] initWithKnightData:[trainRooster getFirstData] layerDepth:depth];
//        [items addObject:statPanel];
//
//        skillPanel = [[SkillsPanel alloc] initWithKnightData:[trainRooster getFirstData] layerDepth:depth displayUpgradeButtons:NO];
        
        // init tab buttons
        MetaData *data = [Constants getMetaDataForKey:META_INTERFACE_TAB];
        statButton = [GraphicsComponent getLabelButtonWithText:[Constants getTextForKey:TEXT_INTERFACE_TAB_STATS] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_TAB_STATS] width:data.width height:data.height];
        [items addObject:statButton];
        
        skillButton = [GraphicsComponent getLabelButtonWithText:[Constants getTextForKey:TEXT_INTERFACE_TAB_SKILLS] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_TAB_SKILLS] width:data.width height:data.height];
        [items addObject:skillButton];
        
        
        // init pane for stats, skills and equipment
        statPanel = [[StatsPanel alloc] initWithKnightData:[trainRooster getFirstData] layerDepth:showDepth];
        [skillPanel updateColor:showColor];
        [items addObject:statPanel];
        
        skillPanel = [[SkillsPanel alloc] initWithKnightData:[trainRooster getFirstData] layerDepth:hideDepth displayUpgradeButtons:NO];
        [skillPanel updateColor:hideColor];
        [items addObject:skillPanel];
        
//        equipmentPanel = [[EquipmentPanel alloc] initWithKnightData:[trainRooster getFirstData] area:area layerDepth:depth];
        
        
        // init recruit button
//        recruitButton = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 440 y:area.y + 323 width:95 height:32] notPressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonPressed] font:[TownSpriteComponent getFont] text:@"Recruit"];
//        recruitButton.pressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        recruitButton.notPressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        recruitButton.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [recruitButton.label setScaleUniform:FONT_SCALE_MEDIUM];
//        [items addObject:recruitButton];
    }
    return self;
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    // check if different tab was selected
//    if (tabs.pressedButtonChanged) {
//        [tabs reset];
//
//        if ([tabs.pressedButtonKey isEqualToString:KEY_STATS]) {
//            // change to stats tab
//            [self removeItemFromScene:skillPanel];
////            [self removeItemFromScene:equipmentPanel];
//
//            [self addItemToScene:statPanel];
//        } else if ([tabs.pressedButtonKey isEqualToString:KEY_SKILLS]) {
//            // change to skills tab
//            [self removeItemFromScene:statPanel];
////            [self removeItemFromScene:equipmentPanel];
//
//            [self addItemToScene:skillPanel];
//        } else if ([tabs.pressedButtonKey isEqualToString:KEY_EQUIPMENT]) {
//            // change to equipment tab
//            [self removeItemFromScene:skillPanel];
//            [self removeItemFromScene:statPanel];
//
////            [self addItemToScene:equipmentPanel];
//        }
//    }
    
    // check if different unit was selected in rooster
    if (trainRooster.selectionChanged) {
        [statPanel updateToKnightData:[trainRooster getSelectedData]];
        [skillPanel updateToKnightData:[trainRooster getSelectedData]];
//        [equipmentPanel updateToKnightData:[trainRooster getSelectedData]];
    }
    
    // check if recruit button was pressed
    if (recruitButton.wasReleased) {
        // move the racruited unit from the training rooster to the battle rooster
        [rooster addItem:[trainRooster getSelectedData]];
        [trainRooster removeItem:[trainRooster getSelectedEntry]];
    }
    
    // check if different tab was pressed
    if (statButton.wasReleased) {
        [statPanel updateColor:showColor];
        [statPanel updateDepth:showDepth];
        
        [skillPanel updateDepth:hideDepth];
        [skillPanel updateColor:hideColor];
    }
    
    if (skillButton.wasReleased) {
        [skillPanel updateColor:showColor];
        [skillPanel updateDepth:showDepth];
        
        [statPanel updateDepth:hideDepth];
        [statPanel updateColor:hideColor];
    }
}




- (void) dealloc {
    [rooster release];
    [trainRooster release];
    
    [skillPanel release];
    [statPanel release];
    
    [recruitButton release];
    
    [super dealloc];
}

@end
