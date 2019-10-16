//
//  StatsPanel.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 01/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "StatsPanel.h"

#import "Pixlron.Knights.h"

#define LABEL_SPACING 25

@implementation StatsPanel

- (id) initWithKnightData:(KnightData *)data area:(Rectangle *)area layerDepth:(float)layerDepth {
    self = [super init];
    if (self != nil) {
        // init pane
        statPane = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropPane] position:[Vector2 vectorWithX:area.x + 220 y:area.y + 199]];
        statPane.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        [items addObject:statPane];
        
        // init stat labels
        NSString *statNames[] = {@"Strength:", @"Agility:", @"Defence:", @"Insight:", @"Cunning:", @"Sturdiness:"};
        
        for (int i = 0; i < StatTypes; i++) {
            statLabels[i] = [[Label alloc] initWithFont:[TownSpriteComponent getFont] text:statNames[i] position:[Vector2 vectorWithX:area.x + 238 y:area.y + 208 + i * LABEL_SPACING]];
            statLabels[i].verticalAlign = VerticalAlignTop;
            statLabels[i].horizontalAlign = HorizontalAlignLeft;
            statLabels[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            [statLabels[i] setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
            [items addObject:statLabels[i]];
            
            statValueLabels[i] = [[Label alloc] initWithFont:[TownSpriteComponent getFont] text:@"0" position:[Vector2 vectorWithX:area.x + 368 y:area.y + 208 + i * LABEL_SPACING]];
            statValueLabels[i].verticalAlign = VerticalAlignTop;
            statValueLabels[i].horizontalAlign = HorizontalAlignRight;
            statValueLabels[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            [statValueLabels[i] setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
            [items addObject:statValueLabels[i]];
        }
        
        // init unit type info
        unitTypeLabel = [[Label alloc] initWithFont:[TownSpriteComponent getFont] text:@"Unit type:" position:[Vector2 vectorWithX:area.x + 395 y:area.y + 208]];
        unitTypeLabel.verticalAlign = VerticalAlignTop;
        unitTypeLabel.horizontalAlign = HorizontalAlignLeft;
        unitTypeLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [unitTypeLabel setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        [items addObject:unitTypeLabel];
        
        // TODO: add appropriate texture
        unitTypeBorder = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 485 y:area.y + 208]];
        unitTypeBorder.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:unitTypeBorder];
        
        unitType = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 485 y:area.y + 208]];
        unitType.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [items addObject:unitType];
        
        // init hp info
        hpLabel = [[Label alloc] initWithFont:[TownSpriteComponent getFont] text:@"HP:" position:[Vector2 vectorWithX:area.x + 395 y:area.y + 250]];
        hpLabel.verticalAlign = VerticalAlignTop;
        hpLabel.horizontalAlign = HorizontalAlignLeft;
        hpLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [hpLabel setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        hpLabel.color = [Color red];
        [items addObject:hpLabel];
        
        hpValueLabel = [[Label alloc] initWithFont:[TownSpriteComponent getFont] text:@"1000" position:[Vector2 vectorWithX:area.x + 460 y:area.y + 250]];
        hpValueLabel.verticalAlign = VerticalAlignTop;
        hpValueLabel.horizontalAlign = HorizontalAlignLeft;
        hpValueLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [hpValueLabel setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        hpValueLabel.color = [Color red];
        [items addObject:hpValueLabel];
        
        // init exp info
        expLabel = [[Label alloc] initWithFont:[TownSpriteComponent getFont] text:@"Exp:" position:[Vector2 vectorWithX:area.x + 395 y:area.y + 270]];
        expLabel.verticalAlign = VerticalAlignTop;
        expLabel.horizontalAlign = HorizontalAlignLeft;
        expLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [expLabel setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        expLabel.color = [Color cornflowerBlue];
        [items addObject:expLabel];
        
        expCurrentLabel = [[Label alloc] initWithFont:[TownSpriteComponent getFont] text:[NSString stringWithFormat:@"%d", data.currentExp] position:[Vector2 vectorWithX:area.x + 478 y:area.y + 270]];
        expCurrentLabel.verticalAlign = VerticalAlignTop;
        expCurrentLabel.horizontalAlign = HorizontalAlignRight;
        expCurrentLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [expCurrentLabel setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        expCurrentLabel.color = [Color cornflowerBlue];
        [items addObject:expCurrentLabel];
        
        expSlashLabel = [[Label alloc] initWithFont:[TownSpriteComponent getFont] text:@"/" position:[Vector2 vectorWithX:area.x + 480 y:area.y + 270]];
        expSlashLabel.verticalAlign = VerticalAlignTop;
        expSlashLabel.horizontalAlign = HorizontalAlignLeft;
        expSlashLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [expSlashLabel setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        expSlashLabel.color = [Color cornflowerBlue];
        [items addObject:expSlashLabel];
        
        expNextLvlLabel = [[Label alloc] initWithFont:[TownSpriteComponent getFont] text:@"200000" position:[Vector2 vectorWithX:area.x + 490 y:area.y + 270]];
        expNextLvlLabel.verticalAlign = VerticalAlignTop;
        expNextLvlLabel.horizontalAlign = HorizontalAlignLeft;
        expNextLvlLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [expNextLvlLabel setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        expNextLvlLabel.color = [Color cornflowerBlue];
        [items addObject:expNextLvlLabel];
        
    }
    return self;
}



- (void) updateToKnightData:(KnightData *)data {
    if (data) {
        // TODO: add all other values
        expCurrentLabel.text = [NSString stringWithFormat:@"%d", data.currentExp];
    } else {
        // reset all values to 0
        for (int i = 0; i < StatTypes; i++) {
            statValueLabels[i].text = @"0";
        }
        
        hpValueLabel.text = @"0";
        expCurrentLabel.text = @"0";
        expNextLvlLabel.text = @"0";
    }
}



- (void) dealloc {
    for (int i = 0; i < StatTypes; i++) {
        [statLabels[i] release];
        [statValueLabels[i] release];
    }
    
    [statPane release];
    
    [unitTypeLabel release];
    [unitTypeBorder release];
    [unitType release];
    
    [hpLabel release];
    [hpValueLabel release];
    
    [expLabel release];
    [expSlashLabel release];
    [expCurrentLabel release];
    [expNextLvlLabel release];
    
    [super dealloc];
}

@end
