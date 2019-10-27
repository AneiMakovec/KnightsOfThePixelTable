//
//  SkillsPanel.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 01/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "SkillsPanel.h"

#import "Pixlron.Knights.h"

@implementation SkillsPanel

- (id) initWithKnightData:(KnightData *)data layerDepth:(float)layerDepth displayUpgradeButtons:(BOOL)display {
    self = [super init];
    if (self != nil) {
        displayUpgradeButtons = display;
        curDepth = layerDepth;
        
        // init pane
        skillPane = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_PANE_SKILLS atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_PANE]];
        skillPane.layerDepth = layerDepth;
        [items addObject:skillPane];
        
        // init skill slots
        NSString *knightTypeKeys[KnightTypes] = {GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BRAWLER, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_PALADIN, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BARD, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_LONGBOWMAN, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_CROSSBOWMAN, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_SCOUT, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BATTLEMAGE, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_WIZARD, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_MONK};
        NSString *skillPosKey = POSITION_INTERFACE_SKILLS;
        for (int i = 0; i < KnightTypes; i++) {
            for (int j = 0; j < SkillTypes; j++) {
                skills[i][j] = [GraphicsComponent getTouchImageWithKey:[knightTypeKeys[i] stringByAppendingString:[NSString stringWithFormat:@"s%d", j + 1]] atPosition:[Constants getPositionDataForKey:[skillPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", j]]]];
                skills[i][j].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
            }
        }
        
        // init upgrade buttons
        if (displayUpgradeButtons) {
            // init labels
            NSString *upgradePosKey = POSITION_INTERFACE_SKILL_UPGRADE_LABELS;
            for (int i = 0; i < SkillTypes; i++) {
                upgradeLabels[i] = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:[Constants getTextForKey:TEXT_INTERFACE_SKILL_UPGRADE_LABEL], 10] atPosition:[Constants getPositionDataForKey:[upgradePosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
                upgradeLabels[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
                [items addObject:upgradeLabels[i]];
            }
        }
        
        // init labels
        NSString *comboLabelPosKey = POSITION_INTERFACE_SKILL_COMBO_LABELS;
        for (int i = 0; i < SkillTypes; i++) {
            comboLabels[i] = [GraphicsComponent getLabelWithText:[Constants getTextForKey:TEXT_INTERFACE_SKILL_COMBO_LABEL] atPosition:[Constants getPositionDataForKey:[comboLabelPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
            comboLabels[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
            [items addObject:comboLabels[i]];
        }
        
        // init combo images
        NSString *diceKeys[StatTypes] = {GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_STRENGTH, GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_ACCURACY, GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_CUNNING, GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_DEFENSE, GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_AGILITY, GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_STURDINESS};
        NSString *comboPosKey = POSITION_INTERFACE_COMBOS;
        for (int i = 0; i < SkillTypes; i++) {
            for (int j = 0; j < StatTypes; j++) {
                if (i < 2){
                    firstSkillCombo[i][j] = [GraphicsComponent getImageWithKey:diceKeys[j] atPosition:[Constants getPositionDataForKey:[comboPosKey stringByAppendingString:[NSString stringWithFormat:@"1_%d", i]]]];
                    firstSkillCombo[i][j].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
                }
                
                if (i < 3){
                    secondSkillCombo[i][j] = [GraphicsComponent getImageWithKey:diceKeys[j] atPosition:[Constants getPositionDataForKey:[comboPosKey stringByAppendingString:[NSString stringWithFormat:@"2_%d", i]]]];
                    secondSkillCombo[i][j].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
                }
                
                thirdSkillCombo[i][j] = [GraphicsComponent getImageWithKey:diceKeys[j] atPosition:[Constants getPositionDataForKey:[comboPosKey stringByAppendingString:[NSString stringWithFormat:@"3_%d", i]]]];
                thirdSkillCombo[i][j].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
            }
        }
        
        
        // init pop ups
        for (int i = 0; i < SkillTypes; i++) {
            popUps[i] = [[SkillPopUp alloc] initForSkill:i layerDepth:layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE];
            popUpVisible[i] = NO;
        }
        
        
        
        
//        if (data) {
//            currentType = data.type;
//            for (int i = 0; i < SkillTypes; i++) {
//                [items addObject:skills[currentType][i]];
//            }
//
//            // display combo slots
//            NSArray *skillCombos = [Constants getComboForUnit:data.type forSkill:FirstComboSkill];
//            [items addObject:firstSkillCombo[0][[[skillCombos objectAtIndex:0] intValue]]];
//            [items addObject:firstSkillCombo[1][[[skillCombos objectAtIndex:1] intValue]]];
//
//            skillCombos = [Constants getComboForUnit:data.type forSkill:SecondComboSkill];
//            [items addObject:secondSkillCombo[0][[[skillCombos objectAtIndex:0] intValue]]];
//            [items addObject:secondSkillCombo[1][[[skillCombos objectAtIndex:1] intValue]]];
//            [items addObject:secondSkillCombo[2][[[skillCombos objectAtIndex:2] intValue]]];
//
//            skillCombos = [Constants getComboForUnit:data.type forSkill:ThirdComboSkill];
//            [items addObject:thirdSkillCombo[0][[[skillCombos objectAtIndex:0] intValue]]];
//            [items addObject:thirdSkillCombo[1][[[skillCombos objectAtIndex:1] intValue]]];
//            [items addObject:thirdSkillCombo[2][[[skillCombos objectAtIndex:2] intValue]]];
//            [items addObject:thirdSkillCombo[3][[[skillCombos objectAtIndex:3] intValue]]];
//
//            // init upgrade buttons
//            if (displayUpgradeButtons) {
//                // init upgrade buttons
//                NSString *buttonPosKey = POSITION_INTERFACE_SKILL_UPGRADE_BUTTONS;
//                for (int i = 0; i < SkillTypes; i++) {
//                    upgradeButtons[i] = [GraphicsComponent getDoubleImageLabelButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_SKILL atPosition:[Constants getPositionDataForKey:[buttonPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] text:[NSString stringWithFormat:@"%d", [Constants getUpgradeCostOfSkillLvl:[data getLevelOfSkill:i]]]];
//                    upgradeButtons[i].notPressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//                    upgradeButtons[i].pressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
//                    upgradeButtons[i].label.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDFRONT;
//                    [items addObject:upgradeButtons[i]];
//                }
//            }
//
//            // init labels
//            NSString *lvlPosKey = POSITION_INTERFACE_SKILL_LVLS;
//            for (int i = 0; i < SkillTypes; i++) {
//                lvlLabels[i] = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:[Constants getTextForKey:TEXT_INTERFACE_SKILL_LVL_LABEL], [data getLevelOfSkill:i]] atPosition:[Constants getPositionDataForKey:[lvlPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
//                lvlLabels[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//                lvlLabels[i].horizontalAlign = HorizontalAlignCenter;
//                lvlLabels[i].verticalAlign = VerticalAlignMiddle;
//                [items addObject:lvlLabels[i]];
//            }
//        } else {
            // init upgrade buttons
            if (displayUpgradeButtons) {
                // init upgrade buttons
                NSString *buttonPosKey = POSITION_INTERFACE_SKILL_UPGRADE_BUTTONS;
                for (int i = 0; i < SkillTypes; i++) {
                    upgradeButtons[i] = [GraphicsComponent getDoubleImageLabelButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_SKILL atPosition:[Constants getPositionDataForKey:[buttonPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] text:@"0"];
                    upgradeButtons[i].notPressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
                    upgradeButtons[i].pressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                    upgradeButtons[i].label.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDFRONT;
                    [upgradeButtons[i].label setScaleUniform:FONT_SCALE_MEDIUM];
                    upgradeButtons[i].enabled = NO;
                    [items addObject:upgradeButtons[i]];
                }
            }
            
            // init labels
            NSString *lvlPosKey = POSITION_INTERFACE_SKILL_LVLS;
            for (int i = 0; i < SkillTypes; i++) {
                lvlLabels[i] = [GraphicsComponent getLabelWithText:@"Lvl: " atPosition:[Constants getPositionDataForKey:[lvlPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
                lvlLabels[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
                lvlLabels[i].horizontalAlign = HorizontalAlignCenter;
                lvlLabels[i].verticalAlign = VerticalAlignMiddle;
                [lvlLabels[i] setScaleUniform:FONT_SCALE_SMALL_MEDIUM];
                [items addObject:lvlLabels[i]];
            }
//        }
    }
    return self;
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    for (int i = 0; i < SkillTypes; i++) {
        if (!popUpVisible[i] && skills[currentType][i].isTouched) {
            popUpVisible[i] = YES;
            [self addItemToScene:popUps[i]];
        } else if (popUpVisible[i] && skills[currentType][i].wasReleased) {
            popUpVisible[i] = NO;
            [self removeItemFromScene:popUps[i]];
        }
    }
}

- (void) updateToKnightData:(KnightData *)data {
    if (data) {
        for (int i = 0; i < SkillTypes; i++) {
            [self removeItemFromScene:skills[currentType][i]];
            [self addItemToScene:skills[data.type][i]];
            
            if ([data isSkillAtMaxLvl:i]) {
                upgradeButtons[i].label.text = [Constants getTextForKey:TEXT_INTERFACE_MAX_LVL];
                upgradeButtons[i].enabled = NO;
            } else {
                upgradeButtons[i].label.text = [NSString stringWithFormat:@"%d", [Constants getUpgradeCostOfSkillLvl:[data getLevelOfSkill:i]]];
                upgradeButtons[i].enabled = YES;
            }
            lvlLabels[i].text = [NSString stringWithFormat:[Constants getTextForKey:TEXT_INTERFACE_SKILL_LVL_LABEL], [data getLevelOfSkill:i]];
            
            [popUps[i] updateToKnight:data];
        }
        
        [self removeCurrentCombos];
        [self displayCombosForUnit:data.type];
            
        currentType = data.type;
    } else {
        for (int i = 0; i < SkillTypes; i++) {
            [self removeItemFromScene:skills[currentType][i]];
            
            [popUps[i] updateToKnight:nil];

            upgradeButtons[i].label.text = @"0";
            upgradeButtons[i].enabled = NO;

            lvlLabels[i].text = @"Lvl: ";
        }
        
        [self removeCurrentCombos];
    }
}

- (void) updateDepth:(float)depth {
    [self updateDepth:depth toItem:skillPane];
    
    for (int i = 0; i < KnightTypes; i++) {
        for (int j = 0; j < SkillTypes; j++) {
            [self updateDepth:depth toItem:skills[i][j]];
            
            if (depth > curDepth)
                skills[i][j].enabled = NO;
            else
                skills[i][j].enabled = YES;
        }
    }
    
    for (int i = 0; i < SkillTypes; i++) {
        [self updateDepth:depth toItem:comboLabels[i]];
        [self updateDepth:depth toItem:upgradeLabels[i]];
        [self updateDepth:depth toItem:lvlLabels[i]];
        
        if (displayUpgradeButtons) {
            [self updateDepth:depth toItem:upgradeButtons[i]];
            
            if (depth > curDepth)
                [self removeItemFromScene:upgradeButtons[i]];
            else
                [self addItemToScene:upgradeButtons[i]];
        }
        
        [popUps[i] updateDepth:depth];
        
        for (int j = 0; j < StatTypes; j++) {
            if (i < 2)
                [self updateDepth:depth toItem:firstSkillCombo[i][j]];
            
            if (i < 3)
                [self updateDepth:depth toItem:secondSkillCombo[i][j]];
            
            [self updateDepth:depth toItem:thirdSkillCombo[i][j]];
        }
    }
    
    curDepth = depth;
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
        
    DoubleImageLabelButton *btn = [item isKindOfClass:[DoubleImageLabelButton class]] ? item : nil;
    if (btn) {
        btn.notPressedImage.layerDepth -= curDepth;
        btn.notPressedImage.layerDepth += depth;
            
        btn.pressedImage.layerDepth -= curDepth;
        btn.pressedImage.layerDepth += depth;
        
        btn.label.layerDepth -= curDepth;
        btn.label.layerDepth += depth;
    }
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
    [skillPane setColor:color];
}



- (BOOL) wasUpgradeBtnReleased:(SkillType)skill {
    if (upgradeButtons[skill].enabled) {
        return upgradeButtons[skill].wasReleased;
    } else {
        return NO;
    }
}

- (void) setEnabled:(BOOL)enabled {
    for (int i = 0; i < SkillTypes; i++) {
        upgradeButtons[i].enabled = enabled;
    }
}

- (void) displayCombosForUnit:(KnightType)type {
    NSArray *skillCombos = [Constants getComboForUnit:type forSkill:FirstComboSkill];
    [self addItemToScene:firstSkillCombo[0][[[skillCombos objectAtIndex:0] intValue]]];
    [self addItemToScene:firstSkillCombo[1][[[skillCombos objectAtIndex:1] intValue]]];
    
    skillCombos = [Constants getComboForUnit:type forSkill:SecondComboSkill];
    [self addItemToScene:secondSkillCombo[0][[[skillCombos objectAtIndex:0] intValue]]];
    [self addItemToScene:secondSkillCombo[1][[[skillCombos objectAtIndex:1] intValue]]];
    [self addItemToScene:secondSkillCombo[2][[[skillCombos objectAtIndex:2] intValue]]];
    
    skillCombos = [Constants getComboForUnit:type forSkill:ThirdComboSkill];
    [self addItemToScene:thirdSkillCombo[0][[[skillCombos objectAtIndex:0] intValue]]];
    [self addItemToScene:thirdSkillCombo[1][[[skillCombos objectAtIndex:1] intValue]]];
    [self addItemToScene:thirdSkillCombo[2][[[skillCombos objectAtIndex:2] intValue]]];
    [self addItemToScene:thirdSkillCombo[3][[[skillCombos objectAtIndex:3] intValue]]];
}

- (void) removeCurrentCombos {
    NSArray *skillCombos = [Constants getComboForUnit:currentType forSkill:FirstComboSkill];
    [self removeItemFromScene:firstSkillCombo[0][[[skillCombos objectAtIndex:0] intValue]]];
    [self removeItemFromScene:firstSkillCombo[1][[[skillCombos objectAtIndex:1] intValue]]];
    
    skillCombos = [Constants getComboForUnit:currentType forSkill:SecondComboSkill];
    [self removeItemFromScene:secondSkillCombo[0][[[skillCombos objectAtIndex:0] intValue]]];
    [self removeItemFromScene:secondSkillCombo[1][[[skillCombos objectAtIndex:1] intValue]]];
    [self removeItemFromScene:secondSkillCombo[2][[[skillCombos objectAtIndex:2] intValue]]];
    
    skillCombos = [Constants getComboForUnit:currentType forSkill:ThirdComboSkill];
    [self removeItemFromScene:thirdSkillCombo[0][[[skillCombos objectAtIndex:0] intValue]]];
    [self removeItemFromScene:thirdSkillCombo[1][[[skillCombos objectAtIndex:1] intValue]]];
    [self removeItemFromScene:thirdSkillCombo[2][[[skillCombos objectAtIndex:2] intValue]]];
    [self removeItemFromScene:thirdSkillCombo[3][[[skillCombos objectAtIndex:3] intValue]]];
}


- (void) dealloc {
    [skillPane release];
    
//    [basicSkill release];
//    [firstSkill release];
//    [secondSkill release];
//    [thirdSkill release];
    
    if (displayUpgradeButtons) {
//        [upgradeFirstSkill release];
//        [upgradeSecondSkill release];
//        [upgradeThirdSkill release];
    }
    
    [super dealloc];
}

@end
