//
//  TownMenu.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 07/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "TownMenu.h"

#import "Pixlron.Knights.h"

#define SHOW_DEPTH 0.85f
#define HIDE_DEPTH 0.95f

@implementation TownMenu

- (void) initialize {
    [super initialize];
    
    // Background
    background = [GraphicsComponent getImageWithKey:TOWN_MENU_BACKGROUND atPosition:[Vector2 vectorWithX:0 y:0]];
    background.layerDepth = 1.0f;
    [scene addItem:background];
    
    // init option panel
    NSString *posKey = POSITION_TOWN_MENU_OPTION_PANELS;
    for (int i = 0; i < OPTION_PANELS; i++) {
        if (i == 0)
            optionPanel[i] = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_WINDOW_DOWN_LEFT atPosition:[Constants getPositionDataForKey:[posKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
        else
            optionPanel[i] = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_WINDOW_DOWN atPosition:[Constants getPositionDataForKey:[posKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
        optionPanel[i].layerDepth = 0.9f;
        [optionPanel[i] setScaleUniform:2.0f];
        [optionPanel[i] setColor:[Color saddleBrown]];
        [scene addItem:optionPanel[i]];
    }
    
    // init option button
    soundButtonOn = [GraphicsComponent getDoubleImageButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_SOUND_ON atPosition:[Constants getPositionDataForKey:POSITION_TOWN_MENU_SETTINGS_BUTTON]];
    [soundButtonOn setScaleUniform:1.5f];
    [scene addItem:soundButtonOn];
    
    soundButtonOff = [GraphicsComponent getDoubleImageButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_SOUND_OFF atPosition:[Constants getPositionDataForKey:POSITION_TOWN_MENU_SETTINGS_BUTTON]];
    [soundButtonOff setScaleUniform:1.5f];
    [scene addItem:soundButtonOff];
    
    if ([GameProgress isSoundEnabled]) {
        soundButtonOff.enabled = NO;
        [soundButtonOff setLayerDepth:HIDE_DEPTH];
        [soundButtonOn setLayerDepth:SHOW_DEPTH];
    } else {
        soundButtonOn.enabled = NO;
        [soundButtonOff setLayerDepth:SHOW_DEPTH];
        [soundButtonOn setLayerDepth:HIDE_DEPTH];
    }
    
    // init week counter
    weekCounterLabel = [GraphicsComponent getLabelWithText:[Constants getTextForKey:TEXT_TOWN_MENU_WEEK_COUNTER_LABEL] atPosition:[Constants getPositionDataForKey:POSITION_TOWN_MENU_WEEK_COUNTER_LABEL]];
    [weekCounterLabel setScaleUniform:FONT_SCALE_BIG];
    weekCounterLabel.horizontalAlign = HorizontalAlignLeft;
    weekCounterLabel.verticalAlign = VerticalAlignMiddle;
    [scene addItem:weekCounterLabel];
    
    weekCounter = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:@"%d", [GameProgress getWeek]] atPosition:[Constants getPositionDataForKey:POSITION_TOWN_MENU_WEEK_COUNTER]];
    [weekCounter setScaleUniform:FONT_SCALE_BIG];
    weekCounter.horizontalAlign = HorizontalAlignLeft;
    weekCounter.verticalAlign = VerticalAlignMiddle;
    [scene addItem:weekCounter];
    
    // init buildings
    NSString *textureKeys[BuildingTypes] = {TOWN_MENU_BUILDINGS_CASTLE, TOWN_MENU_BUILDINGS_BARRACKS, TOWN_MENU_BUILDINGS_TRAINING_YARD, TOWN_MENU_BUILDINGS_BLACKSMITH, TOWN_MENU_BUILDINGS_WARBAND_CAMP, TOWN_MENU_BUILDINGS_GATEHOUSE};
    NSString *buildingPosKeys[BuildingTypes] = {POSITION_BUILDING_CASTLE, POSITION_BUILDING_BARRACKS, POSITION_BUILDING_TRAINING_YARD, POSITION_BUILDING_BLACKSMITH, POSITION_BUILDING_WARBAND_CAMP, POSITION_BUILDING_GATEHOUSE};
    for (int i = 0; i < BuildingTypes; i++) {
        buildings[i] = [GraphicsComponent getImageButtonWithKey:textureKeys[i] atPosition:[Constants getPositionDataForKey:buildingPosKeys[i]]];
        buildings[i].backgroundImage.layerDepth = 0.9;
        [scene addItem:buildings[i]];
    }
    
    // init interface
    interface = [[Interface alloc] initWithMenu:self layerDepth:0.5];
    
    
    [scene addItem:back];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    // check if sound button was pressed
    if (soundButtonOn.wasReleased) {
        [GameProgress setSoundEnabled:NO];
        soundButtonOn.enabled = NO;
        [soundButtonOn setLayerDepth:HIDE_DEPTH];
        soundButtonOff.enabled = YES;
        [soundButtonOff setLayerDepth:SHOW_DEPTH];
    }
    
    if (soundButtonOff.wasReleased) {
        [GameProgress setSoundEnabled:YES];
        soundButtonOff.enabled = NO;
        [soundButtonOff setLayerDepth:HIDE_DEPTH];
        soundButtonOn.enabled = YES;
        [soundButtonOn setLayerDepth:SHOW_DEPTH];
    }
    
    GameState *newState = nil;
    
    // check for actions
    if (buildings[BuildingTypeGatehouse].enabled && buildings[BuildingTypeGatehouse].wasReleased && !back.wasReleased) {
//        [SoundEngine play:SoundEffectTypeClick];

        if ([GameProgress getNumOfBattleKnights] == CombatPositions) {
//            newState = [[WorldMenu alloc] initWithGame:self.game];
        } else {
            Indicator *warning = [[Indicator alloc] initWithText:@"WARBAND IS NOT FULL!" position:[Constants getPositionDataForKey:POSITION_WARNING] font:[GraphicsComponent getFont] color:[Color red] duration:2.0f];
            [scene addItem:warning];
            [warning release];
        }
    }
    
    for (int i = 0; i < BuildingTypeGatehouse; i++) {
        if (buildings[i].enabled && buildings[i].wasReleased) {
            [self disableBuildings];
            [interface updateContent:i];
            [scene addItem:interface];
        }
    }
    
    if (newState) {
        [knightsGame pushState:newState];
    }
}

- (void) disableBuildings {
    for (int i = 0; i < BuildingTypes; i++)
        buildings[i].enabled = NO;
}

- (void) enableBuildings {
    for (int i = 0; i < BuildingTypes; i++)
        buildings[i].enabled = YES;
}




- (void) dealloc {
    for (int i = 0; i < BuildingTypes; i++)
         [buildings[i] release];
    
    [interface release];
    
    [super dealloc];
}

@end
