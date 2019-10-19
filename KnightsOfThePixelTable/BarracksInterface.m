//
//  BarracksInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "BarracksInterface.h"

#import "Pixlron.Knights.h"

#define KEY_STATS @"stats"
#define KEY_SKILLS @"skills"
#define KEY_EQUIPMENT @"equipment"

#define DEPTH_DIFF 0.02

@implementation BarracksInterface

- (id) initWithLayerDepth:(float)depth rooster:(Rooster *)theRooster {
    self = [super init];
    if (self != nil) {
        
        showDepth = depth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        hideDepth = depth + INTERFACE_LAYER_DEPTH_GROUNDBACK + DEPTH_DIFF;
        
        showColor = [[Color white] retain];
        hideColor = [[Color gray] retain];
        
        // retain rooster
        rooster = [theRooster retain];
        
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
        
        // init tab buttons
        MetaData *data = [Constants getMetaDataForKey:META_INTERFACE_TAB];
        statButton = [GraphicsComponent getLabelButtonWithText:[Constants getTextForKey:TEXT_INTERFACE_TAB_STATS] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_TAB_STATS] width:data.width height:data.height];
        [items addObject:statButton];
        
        skillButton = [GraphicsComponent getLabelButtonWithText:[Constants getTextForKey:TEXT_INTERFACE_TAB_SKILLS] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_TAB_SKILLS] width:data.width height:data.height];
        [items addObject:skillButton];
        
        
        // init pane for stats, skills and equipment
        statPanel = [[StatsPanel alloc] initWithKnightData:[rooster getFirstData] layerDepth:showDepth];
        [skillPanel updateColor:showColor];
        [items addObject:statPanel];
        
        skillPanel = [[SkillsPanel alloc] initWithKnightData:[rooster getFirstData] layerDepth:hideDepth displayUpgradeButtons:YES];
        [skillPanel updateColor:hideColor];
        [items addObject:skillPanel];
        
//        equipmentPanel = [[EquipmentPanel alloc] initWithKnightData:[rooster getFirstData] area:area layerDepth:depth];
    }
    return self;
}




- (void) updateWithGameTime:(GameTime *)gameTime {
//    // check if different tab was selected
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
    if (rooster.selectionChanged) {
        [statPanel updateToKnightData:[rooster getSelectedData]];
        [skillPanel updateToKnightData:[rooster getSelectedData]];
//        [equipmentPanel updateToKnightData:[rooster getSelectedData]];
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
    
    [skillPanel release];
    [statPanel release];
//    [equipmentPanel release];
    
//    [tabs release];
//    [tabStats release];
//    [tabSkills release];
//    [tabEquipment release];
    
    [super dealloc];
}

@end
