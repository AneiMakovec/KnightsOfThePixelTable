//
//  WarbandCampInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "WarbandCampInterface.h"

#import "Pixlron.Knights.h"

@implementation WarbandCampInterface

- (id) initWithArea:(Rectangle *)area layerDepth:(float)depth rooster:(Rooster *)theRooster {
    self = [super init];
    if (self != nil) {
        // retain rooster
        rooster = [theRooster retain];
        
        // init warband slots
        warbandSlots[FirstWarbandSlot] = [[TouchImage alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotGreen] toRectangle:[Rectangle rectangleWithX:area.x + 455 y:area.y + 150 width:42 height:42]];
        warbandSlots[FirstWarbandSlot].layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:warbandSlots[FirstWarbandSlot]];
        
        warbandSlots[SecondWarbandSlot] = [[TouchImage alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotGreen] toRectangle:[Rectangle rectangleWithX:area.x + 415 y:area.y + 300 width:42 height:42]];
        warbandSlots[SecondWarbandSlot].layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:warbandSlots[SecondWarbandSlot]];
        
        warbandSlots[ThirdWarbandSlot] = [[TouchImage alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotGreen] toRectangle:[Rectangle rectangleWithX:area.x + 305 y:area.y + 150 width:42 height:42]];
        warbandSlots[ThirdWarbandSlot].layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:warbandSlots[ThirdWarbandSlot]];
        
        warbandSlots[FourthWarbandSlot] = [[TouchImage alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotGreen] toRectangle:[Rectangle rectangleWithX:area.x + 265 y:area.y + 300 width:42 height:42]];
        warbandSlots[FourthWarbandSlot].layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:warbandSlots[FourthWarbandSlot]];
        
        // init colors
        selectedColor = [[Color red] retain];
        defaultColor = [[Color white] retain];
        
        selectedSlot = FirstWarbandSlot;
        warbandSlots[selectedSlot].color = selectedColor;
    }
    return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // check if slots were selected
    for (int i = 0; i < WarbandSlotTypes; i++) {
        if (warbandSlots[i].wasReleased && selectedSlot != i) {
            // reset color of previous selected slot
            warbandSlots[selectedSlot].color = defaultColor;
            selectedSlot = i;
            
            // set color of currently selected slot
            warbandSlots[selectedSlot].color = selectedColor;
        }
    }
}

- (void) dealloc {
    [rooster release];
    
    
    
    [super dealloc];
}

@end
