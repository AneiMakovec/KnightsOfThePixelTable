//
//  BarracksInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "BarracksInterface.h"

#import "Pixlron.Knights.h"

@implementation BarracksInterface

- (id) initWithArea:(Rectangle *)area layerDepth:(float)depth font:(SpriteFont *)font {
    self = [super init];
    if (self != nil) {
        
        // init rooster
        rooster = [[ScrollPanel alloc] initWithArea:[Rectangle rectangleWithX:area.x + 587 y:area.y + 44 width:164 height:323] itemSize:32];
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
        
        tabStats = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 227 y:area.y + 183 width:80 height:16] background:[CamelotTextureComponent getInterfaceProp:InterfacePropTab] font:font text:@"Stats" isDown:YES];
        tabStats.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        tabStats.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [tabStats.label setScaleUniform:0.4];
        [tabs registerRadioButton:tabStats];
        [items addObject:tabStats];
        
        tabSkills = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 307 y:area.y + 183 width:80 height:16] background:[CamelotTextureComponent getInterfaceProp:InterfacePropTab] font:font text:@"Skills" isDown:NO];
        tabSkills.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        tabSkills.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [tabSkills.label setScaleUniform:0.4];
        [tabs registerRadioButton:tabSkills];
        [items addObject:tabSkills];
        
        tabEquipment = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 387 y:area.y + 183 width:80 height:16] background:[CamelotTextureComponent getInterfaceProp:InterfacePropTab] font:font text:@"Equipment" isDown:NO];
        tabEquipment.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        tabEquipment.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [tabEquipment.label setScaleUniform:0.4];
        [tabs registerRadioButton:tabEquipment];
        [items addObject:tabEquipment];
        
        [items addObject:tabs];
        
        // init pane for stats, skills and equipment
        statPanel = [[StatsPanel alloc] initWithArea:area layerDepth:depth font:font];
        [items addObject:statPanel];
        
        skillPanel = [[SkillsPanel alloc] initWithArea:area layerDepth:depth font:font];
        
        equipmentPanel = [[EquipmentPanel alloc] initWithArea:area layerDepth:depth font:font];
    }
    return self;
}




- (void) dealloc {
    [rooster release];
    [skillPanel release];
    
    [super dealloc];
}

@end
