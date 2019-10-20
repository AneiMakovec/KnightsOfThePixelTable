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
//        skillPane = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropPaneSkills] position:[Vector2 vectorWithX:area.x + 220 y:area.y + 199]];
        skillPane = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_PANE_SKILLS atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_PANE]];
        skillPane.layerDepth = layerDepth;
        [items addObject:skillPane];
        
        // init skill slots
//        firstSkill = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotGold] position:[Vector2 vectorWithX:area.x + 238 y:area.y + 208]];
        
        NSString *knightType = @"";
        switch (data.type) {
            case KnightTypeBrawler:
                knightType = GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BRAWLER;
                break;
                
            case KnightTypePaladin:
                knightType = GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_PALADIN;
                break;
                
            case KnightTypeBard:
                knightType = GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BARD;
                break;
                
            case KnightTypeLongbowman:
                knightType = GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_LONGBOWMAN;
                break;
                
            case KnightTypeCrossbowman:
                knightType = GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_CROSSBOWMAN;
                break;
                
            case KnightTypeScout:
                knightType = GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_SCOUT;
                break;
                
            case KnightTypeBattlemage:
                knightType = GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BATTLEMAGE;
                break;
                
            case KnightTypeWizard:
                knightType = GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_WIZARD;
                break;
                
            case KnightTypeMonk:
                knightType = GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_MONK;
                break;
                
            default:
                break;
        }
        
        NSString *skillPosKey = POSITION_INTERFACE_SKILLS;
        for (int i = 0; i < SkillTypes; i++) {
            skills[i] = [GraphicsComponent getImageWithKey:[knightType stringByAppendingString:[NSString stringWithFormat:@"s%d", i + 1]] atPosition:[Constants getPositionDataForKey:[skillPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
            skills[i].layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
            [items addObject:skills[i]];
        }
        
//        firstSkill = [GraphicsComponent getImageWithKey:[knightType stringByAppendingString:<#(nonnull NSString *)#>] atPosition:<#(nonnull Vector2 *)#>]
//        firstSkill.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:firstSkill];
//
//        secondSkill = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotGold] position:[Vector2 vectorWithX:area.x + 238 y:area.y + 263]];
//        secondSkill.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:secondSkill];
//
//        thirdSkill = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotGold] position:[Vector2 vectorWithX:area.x + 238 y:area.y + 318]];
//        thirdSkill.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:thirdSkill];
        
        // init combo slots
//        firstSkillCombo1 = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 293 y:area.y + 223]];
//        firstSkillCombo1.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:firstSkillCombo1];
//
//        firstSkillCombo2 = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 326 y:area.y + 223]];
//        firstSkillCombo2.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:firstSkillCombo2];
//
//
//        secondSkillCombo1 = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 293 y:area.y + 278]];
//        secondSkillCombo1.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:secondSkillCombo1];
//
//        secondSkillCombo2 = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 326 y:area.y + 278]];
//        secondSkillCombo2.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:secondSkillCombo2];
//
//        secondSkillCombo3 = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 359 y:area.y + 278]];
//        secondSkillCombo3.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:secondSkillCombo3];
//
//
//        thirdSkillCombo1 = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 293 y:area.y + 333]];
//        thirdSkillCombo1.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:thirdSkillCombo1];
//
//        thirdSkillCombo2 = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 326 y:area.y + 333]];
//        thirdSkillCombo2.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:thirdSkillCombo2];
//
//        thirdSkillCombo3 = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 359 y:area.y + 333]];
//        thirdSkillCombo3.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:thirdSkillCombo3];
//
//        thirdSkillCombo4 = [[Image alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 392 y:area.y + 333]];
//        thirdSkillCombo4.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:thirdSkillCombo4];
        
        // TODO: display combo slots
        
        // init upgrade buttons
        if (displayUpgradeButtons) {
//            upgradeFirstSkill = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 439 y:area.y + 216 width:95 height:32] notPressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonPressed] font:[TownSpriteComponent getFont] text:[NSString stringWithFormat:@"%d", [data getLevelOfSkill:FirstComboSkill]]];
//            upgradeFirstSkill.pressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//            upgradeFirstSkill.notPressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//            upgradeFirstSkill.label.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
//            [upgradeFirstSkill.label setScaleUniform:FONT_SCALE_MEDIUM];
//            [items addObject:upgradeFirstSkill];
//
//            upgradeSecondSkill = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 439 y:area.y + 272 width:95 height:32] notPressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonPressed] font:[TownSpriteComponent getFont] text:[NSString stringWithFormat:@"%d", [data getLevelOfSkill:SecondComboSkill]]];
//            upgradeSecondSkill.pressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//            upgradeSecondSkill.notPressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//            upgradeSecondSkill.label.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
//            [upgradeSecondSkill.label setScaleUniform:FONT_SCALE_MEDIUM];
//            [items addObject:upgradeSecondSkill];
//
//            upgradeThirdSkill = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 439 y:area.y + 327 width:95 height:32] notPressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonPressed] font:[TownSpriteComponent getFont] text:[NSString stringWithFormat:@"%d", [data getLevelOfSkill:ThirdComboSkill]]];
//            upgradeThirdSkill.pressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//            upgradeThirdSkill.notPressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
//            upgradeThirdSkill.label.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
//            [upgradeThirdSkill.label setScaleUniform:FONT_SCALE_MEDIUM];
//            [items addObject:upgradeThirdSkill];
            
            // init upgrade buttons
            NSString *buttonPosKey = POSITION_INTERFACE_SKILL_UPGRADE_BUTTONS;
            for (int i = 0; i < SkillTypes; i++) {
                upgradeButtons[i] = [GraphicsComponent getDoubleImageLabelButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_SKILL atPosition:[Constants getPositionDataForKey:[buttonPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] text:[Constants getTextForKey:TEXT_INTERFACE_BUTTON_UPGRADE]];
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
    
    for (int i = 0; i < SkillTypes; i++) {
        if (upgradeButtons[i].wasReleased)
            NSLog(@"Pressed!");
    }
}

- (void) updateToKnightData:(KnightData *)data {
//    if (data) {
//        upgradeFirstSkill.label.text = [NSString stringWithFormat:@"%d", [data getLevelOfSkill:FirstComboSkill]];
//        upgradeSecondSkill.label.text = [NSString stringWithFormat:@"%d", [data getLevelOfSkill:SecondComboSkill]];
//        upgradeThirdSkill.label.text = [NSString stringWithFormat:@"%d", [data getLevelOfSkill:ThirdComboSkill]];
//    } else {
//        // reset all values to 0
//        upgradeFirstSkill.label.text = @"0";
//        upgradeSecondSkill.label.text = @"0";
//        upgradeThirdSkill.label.text = @"0";
//    }
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
    [skillPane setColor:color];
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
