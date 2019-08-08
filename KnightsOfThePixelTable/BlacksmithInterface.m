//
//  BlacksmithInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "BlacksmithInterface.h"

#import "Pixlron.Knights.h"

@implementation BlacksmithInterface

- (id) initWithArea:(Rectangle *)area layerDepth:(float)depth rooster:(Rooster *)theRooster {
    self = [super init];
    if (self != nil) {
        // retain rooster
        rooster = [theRooster retain];
        
        // init weapon info
        weaponBorder = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotBronze] position:[Vector2 vectorWithX:area.x + 302 y:area.y + 200]];
        weaponBorder.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:weaponBorder];
        
        weapon = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotBronze] position:[Vector2 vectorWithX:area.x + 302 y:area.y + 200]];
        weapon.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [items addObject:weapon];
        
        upgradeWeapon = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 276 y:area.y + 250 width:95 height:32] notPressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonPressed] font:[CamelotTextureComponent getFont] text:@"Upgrade"];
        upgradeWeapon.notPressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeWeapon.pressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeWeapon.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [upgradeWeapon.label setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        [items addObject:upgradeWeapon];
        
        // init armor info
        armorBorder = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotBronze] position:[Vector2 vectorWithX:area.x + 425 y:area.y + 200]];
        armorBorder.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:armorBorder];
        
        armor = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotBronze] position:[Vector2 vectorWithX:area.x + 425 y:area.y + 200]];
        armor.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [items addObject:armor];
        
        upgradeArmor = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 399 y:area.y + 250 width:95 height:32] notPressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonPressed] font:[CamelotTextureComponent getFont] text:@"Upgrade"];
        upgradeArmor.notPressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeArmor.pressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeArmor.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [upgradeArmor.label setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        [items addObject:upgradeArmor];
    }
    return self;
}

- (void) dealloc {
    [rooster release];
    
    [weaponBorder release];
    [weapon release];
    [upgradeWeapon release];
    
    [armorBorder release];
    [armor release];
    [upgradeArmor release];
    
    [super dealloc];
}

@end
