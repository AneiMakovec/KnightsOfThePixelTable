//
//  XpPopUp.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 26/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "XpPopUp.h"

#import "Pixlron.Knights.h"

@implementation XpPopUp


- (id) initWithDepth:(float)depth {
    self = [super init];
    if (self != nil) {
        curDepth = depth;
        
        // get position
        Vector2 *pos = [Constants getPositionDataForKey:POSITION_INTERFACE_XP_POP_UP];
        
        // init background
        background = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_POP_UP atPosition:[Vector2 vectorWithX:pos.x y:pos.y]];
        background.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:background];
        
//        curXp = [GraphicsComponent getLabelWithText:@"" atPosition:<#(nonnull Vector2 *)#>]
    }
    
    return self;
}




- (void) updateToKnightData:(KnightData *)data {
    
}


- (void) updateDepth:(float)depth {
    
}

- (void) updateDepth:(float)depth toItem:(id)item {
    Image* imageItem = [item isKindOfClass:[Image class]] ? item : nil;
    if (imageItem) {
        imageItem.layerDepth -= curDepth;
        imageItem.layerDepth += depth;
    }
    
    Label *labelItem = [item isKindOfClass:[Label class]] ? item : nil;
    if (labelItem) {
        labelItem.layerDepth -= curDepth;
        labelItem.layerDepth += depth;
    }
}

@end
