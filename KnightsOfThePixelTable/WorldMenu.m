//
//  WorldMenu.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "WorldMenu.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

#import "Pixlron.Knights.h"

@implementation WorldMenu


- (void) initialize {
    // invoke super method
    [super initialize];
    
    
    isPanelVisible = NO;
    curLevel = LevelTypeNoLevel;
    
    // init background
    background = [GraphicsComponent getImageWithKey:WORLD_MENU_MAP atPosition:[Vector2 zero]];
    background.layerDepth = 1.0f;
    [background setScaleUniform:2.0f];
    [scene addItem:background];
    
    // init dungeon panel
    panel = [GraphicsComponent getImageWithKey:WORLD_MENU_PANEL atPosition:[Constants getPositionDataForKey:POSITION_WORLD_MENU_PANEL]];
    panel.layerDepth = 0.8f;
    [panel setScaleUniform:4.0f];
//    [scene addItem:panel];
    
    panelText = [GraphicsComponent getLabelWithText:@"TODO" atPosition:[Constants getPositionDataForKey:POSITION_WORLD_MENU_PANEL_TEXT]];
    panelText.layerDepth = 0.79f;
    panelText.horizontalAlign = HorizontalAlignLeft;
    panelText.verticalAlign = VerticalAlignMiddle;
    [panelText setScaleUniform:4.0f];
//    [scene addItem:panelText];
    
    panelClose = [GraphicsComponent getImageButtonWithKey:WORLD_MENU_PANEL_CLOSE atPosition:[Constants getPositionDataForKey:POSITION_WORLD_MENU_PANEL_CLOSE]];
    panelClose.backgroundImage.layerDepth = 0.79f;
    [panelClose setScaleUniform:4.0f];
//    [scene addItem:panelClose];
    
    // init dungeon markers
    NSString *markerPosKey = POSITION_WORLD_MENU_MARKERS;
    NSString *pathPosKey = POSITION_WORLD_MENU_PATHS;
    NSString *pathImageKeys[LevelTypes] = {WORLD_MENU_PATH_FARMLANDS, WORLD_MENU_PATH_PINEWOODS, WORLD_MENU_PATH_MOUNTAINS, WORLD_MENU_PATH_SEASHORE};
    for (int i = 0; i < LevelTypes; i++) {
        dungeonsUnlocked[i] = [GraphicsComponent getDoubleImageButtonWithKey:WORLD_MENU_MARKER_UNLOCKED atPosition:[Constants getPositionDataForKey:[markerPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
        [dungeonsUnlocked[i] setLayerDepth:0.85f];
        [dungeonsUnlocked[i] setScaleUniform:3.0f];
        dungeonsLocked[i] = [GraphicsComponent getDoubleImageButtonWithKey:WORLD_MENU_MARKER_LOCKED atPosition:[Constants getPositionDataForKey:[markerPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
        [dungeonsLocked[i] setLayerDepth:0.85f];
        [dungeonsLocked[i] setScaleUniform:3.0f];
        
        paths[i] = [GraphicsComponent getImageWithKey:pathImageKeys[i] atPosition:[Constants getPositionDataForKey:[pathPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
        [paths[i] setLayerDepth:0.89f];
        [paths[i] setScaleUniform:2.0f];
    }
    
    // init stage butons
    NSString *stagePosKey = POSITION_WORLD_MENU_STAGES;
    NSString *stageUnlockedImageKeys[StageTypes] = {WORLD_MENU_BUTTONS_EASY, WORLD_MENU_BUTTONS_EASY, WORLD_MENU_BUTTONS_EASY, WORLD_MENU_BUTTONS_EASY, WORLD_MENU_BUTTONS_EASY, WORLD_MENU_BUTTONS_MEDIUM, WORLD_MENU_BUTTONS_MEDIUM, WORLD_MENU_BUTTONS_MEDIUM, WORLD_MENU_BUTTONS_MEDIUM, WORLD_MENU_BUTTONS_MEDIUM, WORLD_MENU_BUTTONS_HARD, WORLD_MENU_BUTTONS_HARD, WORLD_MENU_BUTTONS_HARD, WORLD_MENU_BUTTONS_HARD, WORLD_MENU_BUTTONS_HARD};
    NSString *stageLockedImageKeys[StageTypes] = {WORLD_MENU_BUTTONS_EASY_LOCKED, WORLD_MENU_BUTTONS_EASY_LOCKED, WORLD_MENU_BUTTONS_EASY_LOCKED, WORLD_MENU_BUTTONS_EASY_LOCKED, WORLD_MENU_BUTTONS_EASY_LOCKED, WORLD_MENU_BUTTONS_MEDIUM_LOCKED, WORLD_MENU_BUTTONS_MEDIUM_LOCKED, WORLD_MENU_BUTTONS_MEDIUM_LOCKED, WORLD_MENU_BUTTONS_MEDIUM_LOCKED, WORLD_MENU_BUTTONS_MEDIUM_LOCKED, WORLD_MENU_BUTTONS_HARD_LOCKED, WORLD_MENU_BUTTONS_HARD_LOCKED, WORLD_MENU_BUTTONS_HARD_LOCKED, WORLD_MENU_BUTTONS_HARD_LOCKED, WORLD_MENU_BUTTONS_HARD_LOCKED};
    NSString *stageName = @"Stage ";
    for (int i = 0; i < StageTypes; i++) {
        stagesLocked[i] = [GraphicsComponent getImageWithKey:stageLockedImageKeys[i] atPosition:[Constants getPositionDataForKey:[stagePosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
        [stagesLocked[i] setLayerDepth:0.75f];
        [stagesLocked[i] setScaleUniform:4.0f];
//        [scene addItem:stagesLocked[i]];
        
        
//        Vector2 *pos = [Constants getPositionDataForKey:[stagePosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]];
//        NSLog(@"x: %f, y: %f", pos.x, pos.y);
        
        stagesUnlocked[i] = [GraphicsComponent getDoubleImageLabelButtonWithKey:stageUnlockedImageKeys[i] atPosition:[Constants getPositionDataForKey:[stagePosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] text:[stageName stringByAppendingString:[NSString stringWithFormat:@"%d", i + 1]]];
        stagesUnlocked[i].pressedImage.layerDepth = 0.75f;
        stagesUnlocked[i].notPressedImage.layerDepth = 0.75f;
        stagesUnlocked[i].label.layerDepth = 0.74f;
        [stagesUnlocked[i] setScaleUniform:4.0f withLabelScale:FONT_SCALE_MEDIUM];
        stagesUnlocked[i].label.position.y -= 5;
//        [scene addItem:stagesUnlocked[i]];
        
//        NSLog(@"x: %f, y: %f", stagesUnlocked[i].notPressedImage.position.x, stagesUnlocked[i].notPressedImage.position.y);
    }
    
    
    
    // init dungeon names
    dungeonNames[LevelTypeFarmlands] = @"Farmlands";
    dungeonNames[LevelTypePinewoods] = @"Pinewoods";
    dungeonNames[LevelTypeMountains] = @"Mountains";
    dungeonNames[LevelTypeSeashore] = @"Seashore";
    
    // Text
//    Label *farmlandsText = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:@"Farmlands" position:[Vector2 vectorWithX:270 y:37]];
//    farmlandsText.color = [Color darkBlue];
//    farmlandsText.horizontalAlign = HorizontalAlignCenter;
//    farmlandsText.verticalAlign = VerticalAlignMiddle;
//    [scene addItem:farmlandsText];
//    [farmlandsText release];
//
//    Label *mountainsText = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:@"Mountains" position:[Vector2 vectorWithX:900 y:45]];
//    mountainsText.color = [Color darkBlue];
//    mountainsText.horizontalAlign = HorizontalAlignCenter;
//    mountainsText.verticalAlign = VerticalAlignMiddle;
//    [scene addItem:mountainsText];
//    [mountainsText release];
//
//    Label *seashoreText = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:@"Seashore" position:[Vector2 vectorWithX:132 y:400]];
//    seashoreText.color = [Color darkBlue];
//    seashoreText.horizontalAlign = HorizontalAlignCenter;
//    seashoreText.verticalAlign = VerticalAlignMiddle;
//    [scene addItem:seashoreText];
//    [seashoreText release];
//
//    Label *pinewoodsText = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:@"Pinewoods" position:[Vector2 vectorWithX:745 y:320]];
//    pinewoodsText.color = [Color darkBlue];
//    pinewoodsText.horizontalAlign = HorizontalAlignCenter;
//    pinewoodsText.verticalAlign = VerticalAlignMiddle;
//    [scene addItem:pinewoodsText];
//    [pinewoodsText release];
    
    
    // Buttons
//    dungeonFarmlands = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:255 y:57 width:30 height:30] background:[self.game.content load:BUTTON_DESTINATION]];
//    [scene addItem:dungeonFarmlands];
//    
//    dungeonMountains = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:885 y:65 width:30 height:30] background:[self.game.content load:BUTTON_DESTINATION]];
//    [scene addItem:dungeonMountains];
//    
//    dungeonSeashore = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:117 y:420 width:30 height:30] background:[self.game.content load:BUTTON_DESTINATION]];
//    [scene addItem:dungeonSeashore];
//    
//    dungeonPinewoods = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:730 y:340 width:30 height:30] background:[self.game.content load:BUTTON_DESTINATION]];
//    [scene addItem:dungeonPinewoods];
    
    
    [scene addItem:back];
}


- (void) activate {
    [super activate];
    
    for (int i = 0; i < LevelTypes; i++) {
        if ([GameProgress isLevelUnlocked:i]) {
            [scene addItem:dungeonsUnlocked[i]];
            [scene addItem:paths[i]];
        } else {
            [scene addItem:dungeonsLocked[i]];
        }
    }
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    // invoke super method
    [super updateWithGameTime:gameTime];
    
    // check if clicked any button
//    GameState *newState = nil;
//    if (dungeonFarmlands.wasReleased) {
//        [SoundEngine play:SoundEffectTypeClick];
//        newState = [[Gameplay alloc] initWithGame:self.game levelType:LevelTypeFarmlands];
//    } else if (dungeonMountains.wasReleased) {
//        [SoundEngine play:SoundEffectTypeClick];
//        newState = [[Gameplay alloc] initWithGame:self.game levelType:LevelTypeMountains];
//    } else if (dungeonSeashore.wasReleased) {
//        [SoundEngine play:SoundEffectTypeClick];
//        newState = [[Gameplay alloc] initWithGame:self.game levelType:LevelTypeSeashore];
//    } else if (dungeonPinewoods.wasReleased) {
//        [SoundEngine play:SoundEffectTypeClick];
//        newState = [[Gameplay alloc] initWithGame:self.game levelType:LevelTypePinewoods];
//    }
    
//    if (newState) {
//        [knightsGame pushState:newState];
//    }

    
    
    if (!isPanelVisible) {
        for (int i = 0; i < LevelTypes; i++) {
            if (dungeonsUnlocked[i].wasReleased) {
                isPanelVisible = YES;
                curLevel = i;
                
                panelText.text = dungeonNames[i];
                
                [scene addItem:panel];
                [scene addItem:panelText];
                [scene addItem:panelClose];
                
                for (int j = 0; j < StageTypes; j++) {
                    if ([GameProgress isStageUnlocked:j forLevel:i]) {
                        [scene addItem:stagesUnlocked[j]];
                    } else {
                        [scene addItem:stagesLocked[j]];
                    }
                }
            }
        }
    } else {
        if (panelClose.wasReleased) {
            isPanelVisible = NO;
            
            [scene removeItem:panel];
            [scene removeItem:panelText];
            [scene removeItem:panelClose];
            
            for (int j = 0; j < StageTypes; j++) {
                if ([GameProgress isStageUnlocked:j forLevel:curLevel]) {
                    [scene removeItem:stagesUnlocked[j]];
                } else {
                    [scene removeItem:stagesLocked[j]];
                }
            }
        } else {
            for (int i = 0; i < StageTypes; i++) {
                if (stagesUnlocked[i].wasReleased) {
                    [GameProgress setCurrentLevel:curLevel];
                    [GameProgress setCurrentStage:i];
                    
                    GameState *newState = [[[Gameplay alloc] initWithGame:self.game] autorelease];
                    [knightsGame pushState:newState];
                }
            }
        }
    }
}


- (void) dealloc {
//    [dungeonFarmlands release];
//    [dungeonSeashore release];
//    [dungeonMountains release];
//    [dungeonPinewoods release];
    [background release];
    
    [super dealloc];
}

@end
