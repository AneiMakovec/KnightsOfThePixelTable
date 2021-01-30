//
//  CastleInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "CastleInterface.h"

#import "Pixlron.Knights.h"

@implementation CastleInterface

- (id) initWithLayerDepth:(float)depth {
    self = [super init];
    if (self != nil) {
        // init scroll background
        scrollMap = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_SCROLL atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_CASTLE_SCROLL]];
        scrollMap.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:scrollMap];
        
        backImage = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_BACK_IMAGE_BARRACKS atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BACK_IMAGE]];
        backImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        [items addObject:backImage];
        
        // init flags
        NSString *flagPosKey = POSITION_INTERFACE_CASTLE_SCROLL_FLAGS;
        for (int i = 0; i < LevelTypes; i++) {
            flags[i] = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_ICONS_FLAG atPosition:[Constants getPositionDataForKey:[flagPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
            
            if ([GameProgress isLevelUnlocked:i])
                [flags[i] setColor:[Color blue]];
            else if ([GameProgress isLevelFinished:i])
                [flags[i] setColor:[Color green]];
            else
                [flags[i] setColor:[Color red]];
            
            flags[i].layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
            [items addObject:flags[i]];
        }
        
        // init upgrade dices button
        upgradeDices = [GraphicsComponent getDoubleImageLabelButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_DEFAULT atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_CASTLE_BUTTON_UPGRADE] text:[NSString stringWithFormat:@"%d", [Constants getUpgradeCostOfDicesLvl:[GameProgress getDiceLvl]]]];
        upgradeDices.notPressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeDices.pressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeDices.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [upgradeDices.label setScaleUniform:FONT_SCALE_MEDIUM];
        [items addObject:upgradeDices];
        
        // init labels
        upgradeLabel = [GraphicsComponent getLabelWithText:[Constants getTextForKey:TEXT_INTERFACE_SKILL_UPGRADE_LABEL] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_CASTLE_UPGRADE_LABEL]];
        upgradeLabel.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeLabel.horizontalAlign = HorizontalAlignCenter;
        upgradeLabel.verticalAlign = VerticalAlignMiddle;
        [upgradeLabel setScaleUniform:FONT_SCALE_MEDIUM];
        [items addObject:upgradeLabel];
        
        diceNumLabel = [GraphicsComponent getLabelWithText:[Constants getTextForKey:TEXT_INTERFACE_CASTLE_DICES_LABEL] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_CASTLE_DICES_LABEL]];
        diceNumLabel.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        diceNumLabel.horizontalAlign = HorizontalAlignCenter;
        diceNumLabel.verticalAlign = VerticalAlignMiddle;
        [diceNumLabel setScaleUniform:FONT_SCALE_MEDIUM];
        [items addObject:diceNumLabel];
        
        diceNum = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:@"%d", [GameProgress getNumOfDices]] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_CASTLE_DICES]];
        diceNum.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        diceNum.horizontalAlign = HorizontalAlignCenter;
        diceNum.verticalAlign = VerticalAlignMiddle;
        [diceNum setScaleUniform:FONT_SCALE_HUGE];
        [items addObject:diceNum];
    }
    return self;
}


- (BOOL) upgradeButtonReleased {
    return upgradeDices.wasReleased;
}


- (void) updateFlags {
    for (int i = 0; i < LevelTypes; i++) {
        if ([GameProgress isLevelUnlocked:i])
            [flags[i] setColor:[Color blue]];
        else if ([GameProgress isLevelFinished:i])
            [flags[i] setColor:[Color green]];
        else
            [flags[i] setColor:[Color red]];
    }
}

- (void) updateDices {
    diceNum.text = [NSString stringWithFormat:@"%d", [GameProgress getNumOfDices]];
}

- (void) updateButton {
    if ([GameProgress areDicesMaxLvl]) {
        upgradeDices.label.text = [Constants getTextForKey:TEXT_INTERFACE_MAX_LVL];
        upgradeDices.enabled = NO;
    } else {
        upgradeDices.label.text = [NSString stringWithFormat:@"%d", [Constants getUpgradeCostOfDicesLvl:[GameProgress getDiceLvl]]];
    }
}


- (void) dealloc {
    [upgradeDices release];
    [diceNumLabel release];
    [diceNum release];
    [upgradeLabel release];
    [scrollMap release];
    
    
    for (int i = 0; i < LevelTypes; i++) {
        [flags[i] release];
    }
    
    [super dealloc];
}

@end
