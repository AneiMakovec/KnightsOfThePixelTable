//
//  TownMenu.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 07/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "TownMenu.h"

#import "Pixlron.Knights.h"

@implementation TownMenu

- (void) initialize {
    [super initialize];
    
    // Background
    background = [GraphicsComponent getImageWithKey:TOWN_MENU_BACKGROUND atPosition:[Vector2 vectorWithX:0 y:0]];
    background.layerDepth = 1.0;
    [scene addItem:background];
    
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
    
    GameState *newState = nil;
    
    // check for actions
    if (buildings[BuildingTypeGatehouse].enabled && buildings[BuildingTypeGatehouse].wasReleased && !back.wasReleased) {
        [SoundEngine play:SoundEffectTypeClick];
        //newState = [[WorldMenu alloc] initWithGame:self.game];
    }
    
    for (int i = 0; i < BuildingTypeGatehouse; i++) {
        if (buildings[i].enabled && buildings[i].wasReleased) {
            [self disableBuildings];
            [scene addItem:interface];
            [interface updateContent:i];
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
