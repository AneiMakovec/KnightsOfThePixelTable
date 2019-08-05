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

@implementation BarracksInterface

- (id) initWithArea:(Rectangle *)area layerDepth:(float)depth {
    self = [super init];
    if (self != nil) {
        
        // init rooster
        rooster = [[ScrollPanel alloc] initWithArea:[Rectangle rectangleWithX:area.x + 587 y:area.y + 44 width:164 height:323] itemSize:32];
        
        // TODO: implement real rooster entries
        Image *firstLine = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropPaneScrollLine] position:[Vector2 vectorWithX:area.x + 587 y:area.y + 44]];
        firstLine.layerDepth = depth + INTERFACE_LAYER_DEPTH_BEFOREGROUND;
        Image *secondLine = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropPaneScrollLine] position:[Vector2 vectorWithX:area.x + 587 y:area.y + 44 + 34]];
        secondLine.layerDepth = depth + INTERFACE_LAYER_DEPTH_BEFOREGROUND;
        Image *thirdLine = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropPaneScrollLine] position:[Vector2 vectorWithX:area.x + 587 y:area.y + 44 + 34 + 34]];
        thirdLine.layerDepth = depth + INTERFACE_LAYER_DEPTH_BEFOREGROUND;
        
        [rooster addItem:firstLine];
        [firstLine release];
        [rooster addItem:secondLine];
        [secondLine release];
        [rooster addItem:thirdLine];
        [thirdLine release];
        
        [items addObject:rooster];
        
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
        statPanel = [[StatsPanel alloc] initWithArea:area layerDepth:depth];
        [items addObject:statPanel];
        
        skillPanel = [[SkillsPanel alloc] initWithArea:area layerDepth:depth displayUpgradeButtons:YES];
        
        equipmentPanel = [[EquipmentPanel alloc] initWithArea:area layerDepth:depth];
    }
    return self;
}




- (void) updateWithGameTime:(GameTime *)gameTime {
    // check if different tab was selected
    if (tabs.pressedButtonChanged) {
        [tabs reset];
        
        if ([tabs.pressedButtonKey isEqualToString:KEY_STATS]) {
            // change to stats tab
            [scene removeItem:skillPanel];
            [items removeObject:skillPanel];
            [scene removeItem:equipmentPanel];
            [items removeObject:equipmentPanel];
            
            [scene addItem:statPanel];
            [items addObject:statPanel];
        } else if ([tabs.pressedButtonKey isEqualToString:KEY_SKILLS]) {
            // change to skills tab
            [scene removeItem:statPanel];
            [items removeObject:statPanel];
            [scene removeItem:equipmentPanel];
            [items removeObject:equipmentPanel];
            
            [scene addItem:skillPanel];
            [items addObject:skillPanel];
        } else if ([tabs.pressedButtonKey isEqualToString:KEY_EQUIPMENT]) {
            // change to equipment tab
            [scene removeItem:skillPanel];
            [items removeObject:skillPanel];
            [scene removeItem:statPanel];
            [items removeObject:statPanel];
            
            [scene addItem:equipmentPanel];
            [items addObject:equipmentPanel];
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
    
    [super dealloc];
}

@end
