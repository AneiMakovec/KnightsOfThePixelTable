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

- (id) initWithArea:(Rectangle *)area layerDepth:(float)layerDepth font:(SpriteFont *)font {
    self = [super init];
    if (self != nil) {
        // init pane
        equipmentPane = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropPane] position:[Vector2 vectorWithX:area.x + 220 y:area.y + 199]];
        equipmentPane.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        [items addObject:equipmentPane];
        
        // init weapon info
        
        
        // init armor info
    }
    return self;
}

@end
