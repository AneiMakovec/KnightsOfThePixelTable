//
//  BlacksmithInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "BlacksmithInterface.h"

#import "Pixlron.Knights.h"

#define WEAPON_KEY @"weapon"
#define ARMOR_KEY @"armor"

#define STR_KEY @"STR"
#define ACC_KEY @"ACC"
#define CUN_KEY @"CUN"
#define DEF_KEY @"DEF"
#define AGI_KEY @"AGI"
#define STD_KEY @"STD"

@implementation BlacksmithInterface

- (id) initWithLayerDepth:(float)depth rooster:(Rooster *)theRooster {
    self = [super init];
    if (self != nil) {
        // retain rooster
        rooster = [theRooster retain];
        
        // create radio button group
        equipmentBtnGroup = [[RadioButtonGroup alloc] init];
        statsBtnGroup = [[RadioButtonGroup alloc] init];
        
        // init weapon and armor buttons
        weaponBorder = [GraphicsComponent getImageRadioButtonWithKey:TOWN_MENU_INTERFACE_SLOTS_BRONZE atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BLACKSMITH_WEAPON] isDown:YES];
//        [weaponBorder setScaleUniform:1.0f];
        [items addObject:weaponBorder];
        
        armorBorder = [GraphicsComponent getImageRadioButtonWithKey:TOWN_MENU_INTERFACE_SLOTS_BRONZE atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BLACKSMITH_ARMOR] isDown:NO];
//        [armorBorder setScaleUniform:1.0f];
        [items addObject:armorBorder];
        
        [equipmentBtnGroup registerRadioButton:weaponBorder forKey:WEAPON_KEY];
        [equipmentBtnGroup registerRadioButton:armorBorder forKey:ARMOR_KEY];
        [items addObject:equipmentBtnGroup];
        
        KnightData *data = [rooster getSelectedData];
        NSString *weaponKeys[KnightTypes] = {TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_BRAWLER, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_PALADIN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_BARD, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_LONGBOWMAN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_CROSSBOWMAN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_SCOUT, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_BATTLEMAGE, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_WIZARD, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_MONK};
        NSString *armorKeys[KnightTypes] = {TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_BRAWLER, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_PALADIN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_BARD, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_LONGBOWMAN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_CROSSBOWMAN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_SCOUT, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_BATTLEMAGE, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_WIZARD, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_MONK};
        for (int i = 0; i < KnightTypes; i++) {
            weapon[i] = [GraphicsComponent getImageWithKey:weaponKeys[i] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BLACKSMITH_WEAPON]];
//            [weapon[i] setScaleUniform:1.0f];
            
            armor[i] = [GraphicsComponent getImageWithKey:armorKeys[i] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BLACKSMITH_ARMOR]];
//            [armor[i] setScaleUniform:1.0f];
        }
        
        [items addObject:weapon[data.type]];
        [items addObject:armor[data.type]];
        
        
        // init stat buttons
        NSString *posKey = POSITION_INTERFACE_BLACKSMITH_STATS;
        NSString *textKey = TEXT_INTERFACE_STAT_LABELS;
        NSString *stats[StatTypes] = {STR_KEY, ACC_KEY, CUN_KEY, DEF_KEY, AGI_KEY, STD_KEY};
        for (int i = 0; i < StatTypes; i++) {
            statButtons[i] = [GraphicsComponent getDoubleImageLabelRadioButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_SKILL atPosition:[Constants getPositionDataForKey:[posKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] text:[[NSString stringWithFormat:@"+%d", [data getWeaponBonusForStat:i]] stringByAppendingString:[Constants getTextForKey:[textKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]] isDown:NO];
            [statsBtnGroup registerRadioButton:statButtons[i] forKey:stats[i]];
            [items addObject:statButtons[i]];
        }
        
        [items addObject:statsBtnGroup];
        
        
//        // init weapon info
//        weaponBorder = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotBronze] position:[Vector2 vectorWithX:area.x + 302 y:area.y + 200]];
//        weaponBorder.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:weaponBorder];
//
//        weapon = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotBronze] position:[Vector2 vectorWithX:area.x + 302 y:area.y + 200]];
//        weapon.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [items addObject:weapon];
//
//        upgradeWeapon = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 276 y:area.y + 250 width:95 height:32] notPressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonPressed] font:[TownSpriteComponent getFont] text:@"Upgrade"];
//        upgradeWeapon.notPressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        upgradeWeapon.pressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        upgradeWeapon.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [upgradeWeapon.label setScaleUniform:FONT_SCALE_MEDIUM];
//        [items addObject:upgradeWeapon];
//
//        // init armor info
//        armorBorder = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotBronze] position:[Vector2 vectorWithX:area.x + 425 y:area.y + 200]];
//        armorBorder.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:armorBorder];
//
//        armor = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotBronze] position:[Vector2 vectorWithX:area.x + 425 y:area.y + 200]];
//        armor.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [items addObject:armor];
//
//        upgradeArmor = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 399 y:area.y + 250 width:95 height:32] notPressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonPressed] font:[TownSpriteComponent getFont] text:@"Upgrade"];
//        upgradeArmor.notPressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        upgradeArmor.pressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        upgradeArmor.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [upgradeArmor.label setScaleUniform:FONT_SCALE_MEDIUM];
//        [items addObject:upgradeArmor];
        
        
    }
    return self;
}

- (void) dealloc {
    [rooster release];
    
    [weaponBorder release];
    
    [armorBorder release];
    
    [super dealloc];
}

@end
