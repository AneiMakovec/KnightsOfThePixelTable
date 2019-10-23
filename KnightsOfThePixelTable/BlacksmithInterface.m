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
        [weaponBorder setScaleUniform:2.0f];
        weaponBorder.backgroundHoverColor = [Color lightGreen];
        weaponBorder.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:weaponBorder];
        
        armorBorder = [GraphicsComponent getImageRadioButtonWithKey:TOWN_MENU_INTERFACE_SLOTS_BRONZE atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BLACKSMITH_ARMOR] isDown:NO];
        [armorBorder setScaleUniform:2.0f];
        armorBorder.backgroundHoverColor = [Color lightGreen];
        armorBorder.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:armorBorder];
        
        [equipmentBtnGroup registerRadioButton:weaponBorder forKey:WEAPON_KEY];
        [equipmentBtnGroup registerRadioButton:armorBorder forKey:ARMOR_KEY];
        [items addObject:equipmentBtnGroup];
        
        KnightData *data = [rooster getSelectedData];
        NSString *weaponKeys[KnightTypes] = {TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_BRAWLER, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_PALADIN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_BARD, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_LONGBOWMAN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_CROSSBOWMAN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_SCOUT, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_BATTLEMAGE, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_WIZARD, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_MONK};
        NSString *armorKeys[KnightTypes] = {TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_BRAWLER, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_PALADIN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_BARD, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_LONGBOWMAN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_CROSSBOWMAN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_SCOUT, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_BATTLEMAGE, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_WIZARD, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_MONK};
        for (int i = 0; i < KnightTypes; i++) {
            weapon[i] = [GraphicsComponent getImageWithKey:weaponKeys[i] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BLACKSMITH_WEAPON_ICON]];
            [weapon[i] setScaleUniform:2.0f];
            weapon[i].layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
            
            armor[i] = [GraphicsComponent getImageWithKey:armorKeys[i] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BLACKSMITH_ARMOR_ICON]];
            [armor[i] setScaleUniform:2.0f];
            armor[i].layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        }
        
        currentType = data.type;
        
        weapon[currentType].color = [Color lightGreen];
        
        [items addObject:weapon[currentType]];
        [items addObject:armor[currentType]];
        
        
        weaponLvl = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:@"Lvl: %d", data.weaponLvl] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BLACKSMITH_WEAPON_LVL]];
        weaponLvl.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        weaponLvl.horizontalAlign = HorizontalAlignCenter;
        weaponLvl.verticalAlign = VerticalAlignTop;
        [weaponLvl setScaleUniform:FONT_SCALE_MEDIUM];
        [items addObject:weaponLvl];
        
        armorLvl = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:@"Lvl: %d", data.armorLvl] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BLACKSMITH_ARMOR_LVL]];
        armorLvl.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        armorLvl.horizontalAlign = HorizontalAlignCenter;
        armorLvl.verticalAlign = VerticalAlignTop;
        [armorLvl setScaleUniform:FONT_SCALE_MEDIUM];
        [items addObject:armorLvl];

        
        
        // init stat buttons
        NSString *posKey = POSITION_INTERFACE_BLACKSMITH_STATS;
        NSString *textKey = TEXT_INTERFACE_STAT_LABELS;
        NSString *stats[StatTypes] = {STR_KEY, ACC_KEY, CUN_KEY, DEF_KEY, AGI_KEY, STD_KEY};
        for (int i = 0; i < StatTypes; i++) {
            BOOL down;
            if (i == Strength)
                down = YES;
            else
                down = NO;
            statButtons[i] = [GraphicsComponent getDoubleImageLabelRadioButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_SKILL atPosition:[Constants getPositionDataForKey:[posKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] text:[[Constants getTextForKey:[textKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] stringByAppendingString:[NSString stringWithFormat:@"+%d", [data getWeaponBonusForStat:i]]] isDown:down];
            statButtons[i].notPressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
            statButtons[i].pressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
            statButtons[i].label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
            [statButtons[i].label setScaleUniform:1.5f];
            
            if ([data getWeaponBonusForStat:i] > 0)
                statButtons[i].label.color = [Color lightGreen];
            
            [statsBtnGroup registerRadioButton:statButtons[i] forKey:stats[i]];
            [items addObject:statButtons[i]];
        }
        
        [items addObject:statsBtnGroup];
        
        
        // init upgrade button and label
        upgradeLabel = [GraphicsComponent getLabelWithText:[Constants getTextForKey:TEXT_INTERFACE_SKILL_UPGRADE_LABEL] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BLACKSMITH_UPGRADE_LABEL]];
        upgradeLabel.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [upgradeLabel setScaleUniform:FONT_SCALE_MEDIUM];
        [items addObject:upgradeLabel];
        
        
        upgrade = [GraphicsComponent getDoubleImageLabelButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_DEFAULT atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BLACKSMITH_UPGRADE_BUTTON] text:[NSString stringWithFormat:@"%d", [Constants getUpgradeCostOfEquipmentLvl:data.weaponLvl]]];
        upgrade.notPressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        upgrade.pressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        upgrade.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [upgrade.label setScaleUniform:FONT_SCALE_MEDIUM];
        [items addObject:upgrade];
        
        
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


- (void) updateWithGameTime:(GameTime *)gameTime {
    // check if equipment buttons pressed
    if (equipmentBtnGroup.pressedButtonChanged) {
        [equipmentBtnGroup reset];
        [self updateValues];
    }
    
    // check if different knight pressed
    if (rooster.selectionChanged) {
        // update according to selected equipment
        [self updateValues];
    }
}

- (void) updateValues {
    KnightData *data = [rooster getSelectedData];
    
    // update equipment images
    [self removeItemFromScene:weapon[currentType]];
    [self removeItemFromScene:armor[currentType]];
    weapon[currentType].color = [Color white];
    armor[currentType].color = [Color white];
    currentType = data.type;
    
    [self addItemToScene:weapon[currentType]];
    [self addItemToScene:armor[currentType]];
    
    // update lvls
    weaponLvl.text = [NSString stringWithFormat:@"Lvl: %d", data.weaponLvl];
    armorLvl.text = [NSString stringWithFormat:@"Lvl: %d", data.armorLvl];
    
    if ([equipmentBtnGroup.pressedButtonKey isEqualToString:WEAPON_KEY]) {
        weapon[currentType].color = [Color lightGreen];
        armor[currentType].color = [Color white];
        
        // update upgrade cost
        if (data.weaponLvl == [Constants getMaxEquipmentLvl]) {
            upgrade.label.text = [Constants getTextForKey:TEXT_INTERFACE_MAX_LVL];
            upgrade.enabled = NO;
        } else {
            upgrade.label.text = [NSString stringWithFormat:@"%d", [Constants getUpgradeCostOfEquipmentLvl:data.weaponLvl]];
            upgrade.enabled = YES;
        }
        
        // update bonuses
        NSString *textKey = TEXT_INTERFACE_STAT_LABELS;
        for (int i = 0; i < StatTypes; i++) {
            statButtons[i].label.color = [Color white];
            statButtons[i].label.text = [[Constants getTextForKey:[textKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] stringByAppendingString:[NSString stringWithFormat:@"+%d", [data getWeaponBonusForStat:i]]];
            
            if ([data getWeaponBonusForStat:i] > 0)
                statButtons[i].label.color = [Color lightGreen];
        }
    } else if ([equipmentBtnGroup.pressedButtonKey isEqualToString:ARMOR_KEY]) {
        armor[currentType].color = [Color lightGreen];
        weapon[currentType].color = [Color white];
        
        // update upgrade cost
        if (data.armorLvl == [Constants getMaxEquipmentLvl]) {
            upgrade.label.text = [Constants getTextForKey:TEXT_INTERFACE_MAX_LVL];
            upgrade.enabled = NO;
        } else {
            upgrade.label.text = [NSString stringWithFormat:@"%d", [Constants getUpgradeCostOfEquipmentLvl:data.armorLvl]];
            upgrade.enabled = YES;
        }
        
        // update bonuses
        NSString *textKey = TEXT_INTERFACE_STAT_LABELS;
        for (int i = 0; i < StatTypes; i++) {
            statButtons[i].label.color = [Color white];
            statButtons[i].label.text = [[Constants getTextForKey:[textKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] stringByAppendingString:[NSString stringWithFormat:@"+%d", [data getArmorBonusForStat:i]]];
            
            if ([data getArmorBonusForStat:i] > 0)
                statButtons[i].label.color = [Color lightGreen];
        }
    }
}

- (void) upgradeEquipment {
    NSString *statKeys[StatTypes] = {STR_KEY, ACC_KEY, CUN_KEY, DEF_KEY, AGI_KEY, STD_KEY};
    StatType type = Strength;
    for (int i = 0; i < StatTypes; i++) {
        if ([statsBtnGroup.pressedButtonKey isEqualToString:statKeys[i]]) {
            type = i;
            break;
        }
    }
    
    if ([equipmentBtnGroup.pressedButtonKey isEqualToString:WEAPON_KEY]) {
        [[rooster getSelectedData] upgradeWeaponWithBonus:type];
    } else if ([equipmentBtnGroup.pressedButtonKey isEqualToString:ARMOR_KEY]) {
        [[rooster getSelectedData] upgradeArmorWithBonus:type];
    }
}

- (Lvl) getCurrentEquipmentLvl {
    if ([equipmentBtnGroup.pressedButtonKey isEqualToString:WEAPON_KEY]) {
        return [rooster getSelectedData].weaponLvl;
    } else if ([equipmentBtnGroup.pressedButtonKey isEqualToString:ARMOR_KEY]) {
        return [rooster getSelectedData].armorLvl;
    } else {
        return 0;
    }
}

- (BOOL) wasUpgradeEquipmentPressed {
    return upgrade.wasReleased;
}

- (void) dealloc {
    [rooster release];
    
    [weaponBorder release];
    
    [armorBorder release];
    
    [super dealloc];
}

@end
