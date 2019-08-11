//
//  EquipmentPanel.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 01/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "EquipmentPanel.h"

#import "Pixlron.Knights.h"

@implementation EquipmentPanel

- (id) initWithKnightData:(KnightData *)data area:(Rectangle *)area layerDepth:(float)layerDepth {
    self = [super init];
    if (self != nil) {
        // init pane
        equipmentPane = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropPane] position:[Vector2 vectorWithX:area.x + 220 y:area.y + 199]];
        equipmentPane.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        [items addObject:equipmentPane];
        
        // init weapon info
        weaponLabel = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:@"Weapon" position:[Vector2 vectorWithX:area.x + 322 y:area.y + 215]];
        weaponLabel.verticalAlign = VerticalAlignTop;
        weaponLabel.horizontalAlign = HorizontalAlignCenter;
        weaponLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [weaponLabel setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        [items addObject:weaponLabel];
        
        weaponBorder = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotBronze] position:[Vector2 vectorWithX:area.x + 302 y:area.y + 235]];
        weaponBorder.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:weaponBorder];
        
        weapon = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotBronze] position:[Vector2 vectorWithX:area.x + 302 y:area.y + 235]];
        weapon.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [items addObject:weapon];
        
        weaponNameLabel = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:@"Weapon name" position:[Vector2 vectorWithX:area.x + 322 y:area.y + 285]];
        weaponNameLabel.verticalAlign = VerticalAlignMiddle;
        weaponNameLabel.horizontalAlign = HorizontalAlignCenter;
        weaponNameLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [weaponNameLabel setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        [items addObject:weaponNameLabel];
        
        weaponLvlLabel = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:@"LVL." position:[Vector2 vectorWithX:area.x + 312 y:area.y + 305]];
        weaponLvlLabel.verticalAlign = VerticalAlignMiddle;
        weaponLvlLabel.horizontalAlign = HorizontalAlignCenter;
        weaponLvlLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [weaponLvlLabel setScaleUniform:INTERFACE_SCALE_FONT_SMALL];
        [items addObject:weaponLvlLabel];
        
        weaponLvlValueLabel = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:[NSString stringWithFormat:@"%d", data.weaponLvl] position:[Vector2 vectorWithX:area.x + 332 y:area.y + 305]];
        weaponLvlValueLabel.verticalAlign = VerticalAlignMiddle;
        weaponLvlValueLabel.horizontalAlign = HorizontalAlignLeft;
        weaponLvlValueLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [weaponLvlValueLabel setScaleUniform:INTERFACE_SCALE_FONT_SMALL];
        [items addObject:weaponLvlValueLabel];
        
        // init armor info
        armorLabel = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:@"Armor" position:[Vector2 vectorWithX:area.x + 445 y:area.y + 215]];
        armorLabel.verticalAlign = VerticalAlignTop;
        armorLabel.horizontalAlign = HorizontalAlignCenter;
        armorLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [armorLabel setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        [items addObject:armorLabel];
        
        armorBorder = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotBronze] position:[Vector2 vectorWithX:area.x + 425 y:area.y + 235]];
        armorBorder.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:armorBorder];
        
        armor = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotBronze] position:[Vector2 vectorWithX:area.x + 425 y:area.y + 235]];
        armor.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [items addObject:armor];
        
        armorNameLabel = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:@"Armor name" position:[Vector2 vectorWithX:area.x + 445 y:area.y + 285]];
        armorNameLabel.verticalAlign = VerticalAlignMiddle;
        armorNameLabel.horizontalAlign = HorizontalAlignCenter;
        armorNameLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [armorNameLabel setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        [items addObject:armorNameLabel];
        
        armorLvlLabel = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:@"LVL." position:[Vector2 vectorWithX:area.x + 435 y:area.y + 305]];
        armorLvlLabel.verticalAlign = VerticalAlignMiddle;
        armorLvlLabel.horizontalAlign = HorizontalAlignCenter;
        armorLvlLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [armorLvlLabel setScaleUniform:INTERFACE_SCALE_FONT_SMALL];
        [items addObject:armorLvlLabel];
        
        armorLvlValueLabel = [[Label alloc] initWithFont:[CamelotTextureComponent getFont] text:[NSString stringWithFormat:@"%d", data.armorLvl] position:[Vector2 vectorWithX:area.x + 455 y:area.y + 305]];
        armorLvlValueLabel.verticalAlign = VerticalAlignMiddle;
        armorLvlValueLabel.horizontalAlign = HorizontalAlignLeft;
        armorLvlValueLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [armorLvlValueLabel setScaleUniform:INTERFACE_SCALE_FONT_SMALL];
        [items addObject:armorLvlValueLabel];
    }
    return self;
}


- (void) updateToKnightData:(KnightData *)data {
    if (data) {
        weaponLvlValueLabel.text = [NSString stringWithFormat:@"%d", data.weaponLvl];
        armorLvlValueLabel.text = [NSString stringWithFormat:@"%d", data.armorLvl];
    } else {
        // reset all values to 0
        weaponLvlValueLabel.text = @"0";
        armorLvlValueLabel.text = @"0";
    }
}


- (void) dealloc {
    [weaponLabel release];
    [weapon release];
    [weaponBorder release];
    [weaponNameLabel release];
    [weaponLvlLabel release];
    [weaponLvlValueLabel release];
    
    [armorLabel release];
    [armor release];
    [armorBorder release];
    [armorNameLabel release];
    [armorLvlLabel release];
    [armorLvlValueLabel release];
    
    [super dealloc];
}

@end
