//
//  StatsPanel.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 01/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "StatsPanel.h"

#import "Pixlron.Knights.h"

#define PANE_POS_X 220
#define PANE_POS_Y 199

#define LABEL_SPACING 25

@implementation StatsPanel

- (id) initWithKnightData:(KnightData *)data layerDepth:(float)layerDepth {
    self = [super init];
    if (self != nil) {
        curDepth = layerDepth;
        
        // init pane
        statPane = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_PANE_STATS atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_PANE]];
        statPane.layerDepth = layerDepth;
        [items addObject:statPane];

        // init stats
        NSString *statLabelKey = TEXT_INTERFACE_STAT_LABELS;
        NSString *statLabelPosKey = POSITION_INTERFACE_STAT_LABELS;
        NSString *statsPosKey = POSITION_INTERFACE_STATS;
        for (int i = 0; i < StatTypes; i++) {
            statLabels[i] = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[Constants getTextForKey:[statLabelKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] position:[Constants getPositionDataForKey:[statLabelPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
            statLabels[i].verticalAlign = VerticalAlignMiddle;
            statLabels[i].horizontalAlign = HorizontalAlignCenter;
            statLabels[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            [statLabels[i] setScaleUniform:FONT_SCALE_SMALL];
            [items addObject:statLabels[i]];
            
            stats[i] = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[NSString stringWithFormat:@"%d", [data getValueOfStat:i]] position:[Constants getPositionDataForKey:[statsPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
            stats[i].verticalAlign = VerticalAlignMiddle;
            stats[i].horizontalAlign = HorizontalAlignCenter;
            stats[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            [stats[i] setScaleUniform:FONT_SCALE_SMALL];
            [items addObject:stats[i]];
        }
        
        // init lvl info
        lvl = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[NSString stringWithFormat:@"%d", data.lvl] position:[Constants getPositionDataForKey:POSITION_INTERFACE_LVL]];
        lvl.verticalAlign = VerticalAlignMiddle;
        lvl.horizontalAlign = HorizontalAlignCenter;
        lvl.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [lvl setScaleUniform:FONT_SCALE_MEDIUM];
        [items addObject:lvl];
        
        lvlLabel = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[Constants getTextForKey:TEXT_INTERFACE_LVL] position:[Constants getPositionDataForKey:POSITION_INTERFACE_LVL_LABEL]];
        lvlLabel.verticalAlign = VerticalAlignMiddle;
        lvlLabel.horizontalAlign = HorizontalAlignCenter;
        lvlLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [lvlLabel setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:lvlLabel];
        
        
        // init unit type info
        unitTypeLabel = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[Constants getTextForKey:TEXT_INTERFACE_UNIT_TYPE] position:[Constants getPositionDataForKey:POSITION_INTERFACE_TYPE_LABEL]];
        unitTypeLabel.verticalAlign = VerticalAlignMiddle;
        unitTypeLabel.horizontalAlign = HorizontalAlignCenter;
        unitTypeLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [unitTypeLabel setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:unitTypeLabel];
        
        NSString *dmgTypes[DamageTypes] = {TOWN_MENU_INTERFACE_ICONS_TYPE_PHYSICAL, TOWN_MENU_INTERFACE_ICONS_TYPE_RANGED, TOWN_MENU_INTERFACE_ICONS_TYPE_MAGIC};
        for (int i = 0; i < DamageTypes; i++) {
            unitType[i] = [GraphicsComponent getImageWithKey:dmgTypes[i] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_TYPE]];
            unitType[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        }
        [items addObject:unitType[data.damageType]];
        currentDmgType = data.damageType;
        
        // init hp info
        hpLabel = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[Constants getTextForKey:TEXT_INTERFACE_HP] position:[Constants getPositionDataForKey:POSITION_INTERFACE_HP_LABEL]];
        hpLabel.verticalAlign = VerticalAlignMiddle;
        hpLabel.horizontalAlign = HorizontalAlignCenter;
        hpLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [hpLabel setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:hpLabel];
        
        hp = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[NSString stringWithFormat:@"%d", data.hp] position:[Constants getPositionDataForKey:POSITION_INTERFACE_HP]];
        hp.verticalAlign = VerticalAlignMiddle;
        hp.horizontalAlign = HorizontalAlignCenter;
        hp.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [hp setScaleUniform:FONT_SCALE_SMALL];
        hp.color = [Color red];
        [items addObject:hp];
        
        // init exp info
//        xpLabel = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:@"Exp:" position:[Vector2 vectorWithX:128 + 395 y:64 + 270]];
//        xpLabel.verticalAlign = VerticalAlignMiddle;
//        xpLabel.horizontalAlign = HorizontalAlignCenter;
//        xpLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [xpLabel setScaleUniform:FONT_SCALE_SMALL];
//        [items addObject:xpLabel];
        
        // init quirk info
        quirk = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:@"TODO" position:[Constants getPositionDataForKey:POSITION_INTERFACE_QUIRK]];
        quirk.verticalAlign = VerticalAlignMiddle;
        quirk.horizontalAlign = HorizontalAlignCenter;
        quirk.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [quirk setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:quirk];
        
        quirkLabel = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[Constants getTextForKey:TEXT_INTERFACE_QUIRK] position:[Constants getPositionDataForKey:POSITION_INTERFACE_QUIRK_LABEL]];
        quirkLabel.verticalAlign = VerticalAlignMiddle;
        quirkLabel.horizontalAlign = HorizontalAlignCenter;
        quirkLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [quirkLabel setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:quirkLabel];
        
        
        // init weapon info
        weaponLvl = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:@"0" position:[Constants getPositionDataForKey:POSITION_INTERFACE_WEAPON_LVL]];
        weaponLvl.verticalAlign = VerticalAlignMiddle;
        weaponLvl.horizontalAlign = HorizontalAlignCenter;
        weaponLvl.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [weaponLvl setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:weaponLvl];
        
        weaponLvlLabel = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[Constants getTextForKey:TEXT_INTERFACE_LVL] position:[Constants getPositionDataForKey:POSITION_INTERFACE_WEAPON_LVL_LABEL]];
        weaponLvlLabel.verticalAlign = VerticalAlignMiddle;
        weaponLvlLabel.horizontalAlign = HorizontalAlignCenter;
        weaponLvlLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [weaponLvlLabel setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:weaponLvlLabel];
        
        weaponName = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[Constants getTextForKey:TEXT_INTERFACE_WEAPON] position:[Constants getPositionDataForKey:POSITION_INTERFACE_WEAPON_NAME]];
        weaponName.verticalAlign = VerticalAlignMiddle;
        weaponName.horizontalAlign = HorizontalAlignCenter;
        weaponName.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [weaponName setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:weaponName];
        
        NSString *weaponKeys[KnightTypes] = {TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_BRAWLER, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_PALADIN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_BARD, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_LONGBOWMAN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_CROSSBOWMAN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_SCOUT, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_BATTLEMAGE, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_WIZARD, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_MONK};
        NSString *armorKeys[KnightTypes] = {TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_BRAWLER, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_PALADIN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_BARD, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_LONGBOWMAN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_CROSSBOWMAN, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_SCOUT, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_BATTLEMAGE, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_WIZARD, TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_MONK};
        for (int i = 0; i < KnightTypes; i++) {
            weapon[i] = [GraphicsComponent getImageWithKey:weaponKeys[i] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_WEAPON]];
            weapon[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            
            armor[i] = [GraphicsComponent getImageWithKey:armorKeys[i] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_ARMOR]];
            armor[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        }
        
        currentType = data.type;
        [items addObject:weapon[currentType]];
        [items addObject:armor[currentType]];
        
        NSString *weaponBonusPosKey = POSITION_INTERFACE_WEAPON_BONUSES;
        NSString *weaponBonusLabelPosKey = POSITION_INTERFACE_WEAPON_BONUS_LABELS;
        NSString *weaponBonusTextKey = TEXT_INTERFACE_STAT_LABELS;
        for (int i = 0; i < StatTypes; i++) {
            weaponBonusLabel[i] = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[Constants getTextForKey:[weaponBonusTextKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] position:[Constants getPositionDataForKey:[weaponBonusLabelPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
            weaponBonusLabel[i].verticalAlign = VerticalAlignMiddle;
            weaponBonusLabel[i].horizontalAlign = HorizontalAlignCenter;
            weaponBonusLabel[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            [weaponBonusLabel[i] setScaleUniform:FONT_SCALE_SMALL];
            [items addObject:weaponBonusLabel[i]];
            
            weaponBonus[i] = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[NSString stringWithFormat:@"%d", 0] position:[Constants getPositionDataForKey:[weaponBonusPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
            weaponBonus[i].verticalAlign = VerticalAlignMiddle;
            weaponBonus[i].horizontalAlign = HorizontalAlignCenter;
            weaponBonus[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            [weaponBonus[i] setScaleUniform:FONT_SCALE_SMALL];
            [items addObject:weaponBonus[i]];
        }
        
        weaponBonusText = [GraphicsComponent getLabelWithText:[Constants getTextForKey:TEXT_INTERFACE_BONUS] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_WEAPON_BONUS_TEXT]];
        weaponBonusText.verticalAlign = VerticalAlignTop;
        weaponBonusText.horizontalAlign = HorizontalAlignLeft;
        weaponBonusText.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [weaponBonusText setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:weaponBonusText];
        
        
        // init armor info
        armorLvl = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:@"0" position:[Constants getPositionDataForKey:POSITION_INTERFACE_ARMOR_LVL]];
        armorLvl.verticalAlign = VerticalAlignMiddle;
        armorLvl.horizontalAlign = HorizontalAlignCenter;
        armorLvl.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [armorLvl setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:armorLvl];
        
        armorLvlLabel = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[Constants getTextForKey:TEXT_INTERFACE_LVL] position:[Constants getPositionDataForKey:POSITION_INTERFACE_ARMOR_LVL_LABEL]];
        armorLvlLabel.verticalAlign = VerticalAlignMiddle;
        armorLvlLabel.horizontalAlign = HorizontalAlignCenter;
        armorLvlLabel.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [armorLvlLabel setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:armorLvlLabel];
        
        armorName = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[Constants getTextForKey:TEXT_INTERFACE_ARMOR] position:[Constants getPositionDataForKey:POSITION_INTERFACE_ARMOR_NAME]];
        armorName.verticalAlign = VerticalAlignMiddle;
        armorName.horizontalAlign = HorizontalAlignCenter;
        armorName.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [armorName setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:armorName];
        
        NSString *armorBonusPosKey = POSITION_INTERFACE_ARMOR_BONUSES;
        NSString *armorBonusLabelPosKey = POSITION_INTERFACE_ARMOR_BONUS_LABELS;
        NSString *armorBonusTextKey = TEXT_INTERFACE_STAT_LABELS;
        for (int i = 0; i < StatTypes; i++) {
            armorBonusLabel[i] = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[Constants getTextForKey:[armorBonusTextKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] position:[Constants getPositionDataForKey:[armorBonusLabelPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
            armorBonusLabel[i].verticalAlign = VerticalAlignMiddle;
            armorBonusLabel[i].horizontalAlign = HorizontalAlignCenter;
            armorBonusLabel[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            [armorBonusLabel[i] setScaleUniform:FONT_SCALE_SMALL];
            [items addObject:armorBonusLabel[i]];
            
            armorBonus[i] = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[NSString stringWithFormat:@"%d", 0] position:[Constants getPositionDataForKey:[armorBonusPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
            armorBonus[i].verticalAlign = VerticalAlignMiddle;
            armorBonus[i].horizontalAlign = HorizontalAlignCenter;
            armorBonus[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            [armorBonus[i] setScaleUniform:FONT_SCALE_SMALL];
            [items addObject:armorBonus[i]];
        }
        
        armorBonusText = [GraphicsComponent getLabelWithText:[Constants getTextForKey:TEXT_INTERFACE_BONUS] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_ARMOR_BONUS_TEXT]];
        armorBonusText.verticalAlign = VerticalAlignTop;
        armorBonusText.horizontalAlign = HorizontalAlignLeft;
        armorBonusText.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [armorBonusText setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:armorBonusText];
        
        // load knight animations
        NSString *animKeys[KnightTypes] = {GAMEPLAY_MENU_ENTITIES_ALLIES_BRAWLER_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_PALADIN_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_BARD_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_LONGBOWMAN_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_CROSSBOWMAN_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_SCOUT_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_BATTLEMAGE_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_WIZARD_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_MONK_IDLE};
        for (int i = 0; i < KnightTypes; i++) {
            knightAnimations[i] = [GraphicsComponent getAnimatedImageWithKey:animKeys[i] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_KNIGHT_ANIMATION withAdded:POSITION_INTERFACE_BACKGROUND]];
            [knightAnimations[i] setLayerDepth:layerDepth + INTERFACE_LAYER_DEPTH_BACK];
            [knightAnimations[i] setScaleUniform:4.0f];
        }
        
        [items addObject:knightAnimations[data.type]];
    }
    return self;
}



- (void) updateToKnightData:(KnightData *)data {
    if (data) {
        // reset all data
        [self removeItemFromScene:unitType[currentDmgType]];
        currentDmgType = data.damageType;
        [self addItemToScene:unitType[currentDmgType]];
        
        lvl.text = [NSString stringWithFormat:@"%d", data.lvl];
        
        // TODO: character
        
        hp.text = [NSString stringWithFormat:@"%d", data.hp];
        
        for (int i = 0; i < StatTypes; i++) {
            stats[i].text = [NSString stringWithFormat:@"%d", [data getValueOfStat:i]];
            weaponBonus[i].text = [NSString stringWithFormat:@"%d", [data getWeaponBonusForStat:i]];
            armorBonus[i].text = [NSString stringWithFormat:@"%d", [data getArmorBonusForStat:i]];
        }
        
        [self removeItemFromScene:weapon[currentType]];
        [self removeItemFromScene:armor[currentType]];
        [self removeItemFromScene:knightAnimations[currentType]];
        currentType = data.type;
        [self addItemToScene:weapon[currentType]];
        [self addItemToScene:armor[currentType]];
        [self addItemToScene:knightAnimations[currentType]];
    } else {
        // reset all values to 0
        for (int i = 0; i < StatTypes; i++) {
            stats[i].text = @"0";
        }
        
        hp.text = @"0";
    }
}

- (void) updateDepth:(float)depth {
    for (id item in items) {
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
    
    curDepth = depth;
}

- (void) updateColor:(Color *)color {
//    for (id item in items) {
//        Image* imageItem = [item isKindOfClass:[Image class]] ? item : nil;
//        if (imageItem)
//            [imageItem setColor:color];
//
//        Label *labelItem = [item isKindOfClass:[Label class]] ? item : nil;
//        if (labelItem)
//            [labelItem setColor:color];
//    }
    [statPane setColor:color];
}



- (void) dealloc {
    for (int i = 0; i < StatTypes; i++) {
        [statLabels[i] release];
        [stats[i] release];
        [armorBonus[i] release];
        [armorBonusLabel[i] release];
        [weaponBonus[i] release];
        [weaponBonusLabel[i] release];
    }
    
    [statPane release];
    
    [unitTypeLabel release];
    for (int i = 0; i < DamageTypes; i++) {
        [unitType[i] release];
    }
    
    [hpLabel release];
    [hp release];
    
    [quirk release];
    [quirkLabel release];
    
    [lvl release];
    [lvlLabel release];
    
    for (int i = 0; i < KnightTypes; i++) {
        [weapon[i] release];
        [armor[i] release];
    }
    
    [weaponLvl release];
    [weaponLvlLabel release];
    
    [weaponName release];
    
    [armorLvl release];
    [armorLvlLabel release];
    
    [armorName release];
    
    [super dealloc];
}

@end
