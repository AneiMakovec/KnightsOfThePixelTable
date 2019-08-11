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
        [tabStats.label setScaleUniform:INTERFACE_SCALE_FONT_TINY];
        [tabs registerRadioButton:tabStats forKey:KEY_STATS];
        [items addObject:tabStats];
        
        tabSkills = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 307 y:area.y + 183 width:80 height:16] background:[CamelotTextureComponent getInterfaceProp:InterfacePropTab] font:[CamelotTextureComponent getFont] text:@"Skills" isDown:NO];
        tabSkills.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        tabSkills.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [tabSkills.label setScaleUniform:INTERFACE_SCALE_FONT_TINY];
        [tabs registerRadioButton:tabSkills forKey:KEY_SKILLS];
        [items addObject:tabSkills];
        
        tabEquipment = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 387 y:area.y + 183 width:80 height:16] background:[CamelotTextureComponent getInterfaceProp:InterfacePropTab] font:[CamelotTextureComponent getFont] text:@"Equipment" isDown:NO];
        tabEquipment.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        tabEquipment.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [tabEquipment.label setScaleUniform:INTERFACE_SCALE_FONT_TINY];
        [tabs registerRadioButton:tabEquipment forKey:KEY_EQUIPMENT];
        [items addObject:tabEquipment];
        
        [items addObject:tabs];
        
        // init pane for stats, skills and equipment
        statPanel = [[StatsPanel alloc] initWithKnightData:[rooster getFirstEntry] area:area layerDepth:depth];
        [items addObject:statPanel];
        
        skillPanel = [[SkillsPanel alloc] initWithKnightData:[rooster getFirstEntry] area:area layerDepth:depth displayUpgradeButtons:YES];
        
        equipmentPanel = [[EquipmentPanel alloc] initWithKnightData:[rooster getFirstEntry] area:area layerDepth:depth];
        
        // init selected unit name and type
        unitName = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:[rooster getFirstEntry].name position:[Vector2 vectorWithX:area.x + 385 y:area.y + 15]];
        unitName.verticalAlign = VerticalAlignTop;
        unitName.horizontalAlign = HorizontalAlignCenter;
        unitName.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [unitName setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        [items addObject:unitName];
        
        unitTypes[KnightTypeBrawler] = @"Brawler";
        unitTypes[KnightTypeBowman] = @"Bowman";
        unitTypes[KnightTypePaladin] = @"Paladin";
        unitTypes[KnightTypeFireEnchantress] = @"Fire enchantress";
        
        unitType = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:unitTypes[[rooster getFirstEntry].type] position:[Vector2 vectorWithX:area.x + 385 y:area.y + 30]];
        unitType.verticalAlign = VerticalAlignTop;
        unitType.horizontalAlign = HorizontalAlignCenter;
        unitType.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [unitType setScaleUniform:INTERFACE_SCALE_FONT_SMALL];
        [items addObject:unitType];
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
        } else if ([tabs.pressedButtonKey isEqualToString:KEY_SKILLS]) {
            // change to skills tab
            [self removeItemFromScene:statPanel];
            [self removeItemFromScene:equipmentPanel];
            
            [self addItemToScene:skillPanel];
        } else if ([tabs.pressedButtonKey isEqualToString:KEY_EQUIPMENT]) {
            // change to equipment tab
            [self removeItemFromScene:skillPanel];
            [self removeItemFromScene:statPanel];
            
            [self addItemToScene:equipmentPanel];
        }
    }
}




- (void) dealloc {
    [unitName release];
    [unitType release];
    
    for (int i = 0; i < KnightTypes; i++) {
        [unitTypes[i] release];
    }
    
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
