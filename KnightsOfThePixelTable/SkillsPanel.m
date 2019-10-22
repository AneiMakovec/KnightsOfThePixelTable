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
                skills[i][j] = [GraphicsComponent getImageWithKey:[knightTypeKeys[i] stringByAppendingString:[NSString stringWithFormat:@"s%d", j + 1]] atPosition:[Constants getPositionDataForKey:[skillPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", j]]]];
                skills[i][j].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
            }
        }
        
        currentType = data.type;
        for (int i = 0; i < SkillTypes; i++) {
            [items addObject:skills[currentType][i]];
        }
        
        // TODO: display combo slots
        
        // init upgrade buttons
        if (displayUpgradeButtons) {
            // init upgrade buttons
            NSString *buttonPosKey = POSITION_INTERFACE_SKILL_UPGRADE_BUTTONS;
            for (int i = 0; i < SkillTypes; i++) {
                upgradeButtons[i] = [GraphicsComponent getDoubleImageLabelButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_SKILL atPosition:[Constants getPositionDataForKey:[buttonPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] text:[NSString stringWithFormat:@"%d", [Constants getUpgradeCostOfSkillLvl:[data getLevelOfSkill:i]]]];
                upgradeButtons[i].notPressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
                upgradeButtons[i].pressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                upgradeButtons[i].label.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDFRONT;
                [items addObject:upgradeButtons[i]];
            }
            
            // init labels
            NSString *upgradePosKey = POSITION_INTERFACE_SKILL_UPGRADE_LABELS;
            for (int i = 0; i < SkillTypes; i++) {
                upgradeLabels[i] = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:[Constants getTextForKey:TEXT_INTERFACE_SKILL_UPGRADE_LABEL], 10] atPosition:[Constants getPositionDataForKey:[upgradePosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
                upgradeLabels[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
                [items addObject:upgradeLabels[i]];
            }
        }
        
        // init labels
        NSString *comboPosKey = POSITION_INTERFACE_SKILL_COMBO_LABELS;
        NSString *lvlPosKey = POSITION_INTERFACE_SKILL_LVLS;
        for (int i = 0; i < SkillTypes; i++) {
            comboLabels[i] = [GraphicsComponent getLabelWithText:[Constants getTextForKey:TEXT_INTERFACE_SKILL_COMBO_LABEL] atPosition:[Constants getPositionDataForKey:[comboPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
            lvlLabels[i] = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:[Constants getTextForKey:TEXT_INTERFACE_SKILL_LVL_LABEL], [data getLevelOfSkill:i]] atPosition:[Constants getPositionDataForKey:[lvlPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
            
            comboLabels[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
            lvlLabels[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
            lvlLabels[i].horizontalAlign = HorizontalAlignCenter;
            lvlLabels[i].verticalAlign = VerticalAlignMiddle;
            
            [items addObject:comboLabels[i]];
            [items addObject:lvlLabels[i]];
        }
    }
    return self;
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    // TODO: implement skill upgrade
    
//    for (int i = 0; i < SkillTypes; i++) {
//        if (upgradeButtons[i].wasReleased)
//            NSLog(@"Pressed!");
//    }
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
        }
            
        currentType = data.type;
    } else {
        // TODO: handle case when there is no knights in rooster
    }
}

- (void) updateDepth:(float)depth {
    [self updateDepth:depth toItem:skillPane];
    
    for (int i = 0; i < KnightTypes; i++) {
        for (int j = 0; j < SkillTypes; j++) {
            [self updateDepth:depth toItem:skills[i][j]];
        }
    }
    
    for (int i = 0; i < SkillTypes; i++) {
        [self updateDepth:depth toItem:upgradeButtons[i]];
        [self updateDepth:depth toItem:comboLabels[i]];
        [self updateDepth:depth toItem:upgradeLabels[i]];
        [self updateDepth:depth toItem:lvlLabels[i]];
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
    return upgradeButtons[skill].wasReleased;
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
