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

@implementation TrainingYardInterface

- (id) initWithArea:(Rectangle *)area layerDepth:(float)depth rooster:(Rooster *)theRooster {
    self = [super init];
    if (self != nil) {
        // retain rooster
        rooster = [theRooster retain];
        
        // init tabs
        tabs = [[RadioButtonGroup alloc] init];
        
        tabStats = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 227 y:area.y + 183 width:80 height:16] background:[CamelotTextureComponent getInterfaceProp:InterfacePropTab] font:[CamelotTextureComponent getFont] text:@"Stats" isDown:YES];
        tabStats.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        tabStats.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [tabStats.label setScaleUniform:0.4];
        [tabs registerRadioButton:tabStats forKey:KEY_STATS];
        [items addObject:tabStats];
        
        tabSkills = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 307 y:area.y + 183 width:80 height:16] background:[CamelotTextureComponent getInterfaceProp:InterfacePropTab] font:[CamelotTextureComponent getFont] text:@"Skills" isDown:NO];
        tabSkills.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        tabSkills.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [tabSkills.label setScaleUniform:0.4];
        [tabs registerRadioButton:tabSkills forKey:KEY_SKILLS];
        [items addObject:tabSkills];
        
        tabEquipment = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 387 y:area.y + 183 width:80 height:16] background:[CamelotTextureComponent getInterfaceProp:InterfacePropTab] font:[CamelotTextureComponent getFont] text:@"Equipment" isDown:NO];
        tabEquipment.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        tabEquipment.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [tabEquipment.label setScaleUniform:0.4];
        [tabs registerRadioButton:tabEquipment forKey:KEY_EQUIPMENT];
        [items addObject:tabEquipment];
        
        [items addObject:tabs];
        
        // init pane for stats, skills and equipment
        statPanel = [[StatsPanel alloc] initWithKnightData:[rooster getFirstEntry].data area:area layerDepth:depth];
        [items addObject:statPanel];
        
        skillPanel = [[SkillsPanel alloc] initWithKnightData:[rooster getFirstEntry].data area:area layerDepth:depth displayUpgradeButtons:NO];
        
        equipmentPanel = [[EquipmentPanel alloc] initWithKnightData:[rooster getFirstEntry].data area:area layerDepth:depth];
        
        
        // init recruit button
        recruitButton = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 395 y:area.y + 323 width:95 height:32] notPressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonPressed] font:[CamelotTextureComponent getFont] text:@"Recruit"];
        recruitButton.pressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        recruitButton.notPressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        recruitButton.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [recruitButton.label setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        [items addObject:recruitButton];
    }
    return self;
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    // check if different tab was selected
    if (tabs.pressedButtonChanged) {
        [tabs reset];
        
        if ([tabs.pressedButtonKey isEqualToString:KEY_STATS]) {
            // change to stats tab
            [self removeItemFromScene:skillPanel];
            [self removeItemFromScene:equipmentPanel];
            
            [self addItemToScene:statPanel];
            [self addItemToScene:recruitButton];
        } else if ([tabs.pressedButtonKey isEqualToString:KEY_SKILLS]) {
            // change to skills tab
            [self removeItemFromScene:statPanel];
            [self removeItemFromScene:equipmentPanel];
            [self removeItemFromScene:recruitButton];
            
            [self addItemToScene:skillPanel];
        } else if ([tabs.pressedButtonKey isEqualToString:KEY_EQUIPMENT]) {
            // change to equipment tab
            [self removeItemFromScene:skillPanel];
            [self removeItemFromScene:statPanel];
            [self removeItemFromScene:recruitButton];
            
            [self addItemToScene:equipmentPanel];
        }
    }
}




- (void) dealloc {
    [rooster release];
    
    [skillPanel release];
    [statPanel release];
    [equipmentPanel release];
    
    [tabs release];
    [tabStats release];
    [tabSkills release];
    [tabEquipment release];
    
    [recruitButton release];
    
    [super dealloc];
}

@end
