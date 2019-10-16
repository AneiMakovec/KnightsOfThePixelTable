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
    
    // Text
//    title = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:@"Cemelot" position:[Vector2 vectorWithX:[Constants backgroundWidth] / 2 y:20]];
//    title.horizontalAlign = HorizontalAlignCenter;
//    title.verticalAlign = VerticalAlignMiddle;
//    [scene addItem:title];
    
    
    // Buildings
    castle = [GraphicsComponent getImageButtonWithKey:TOWN_MENU_BUILDINGS_CASTLE atPosition:[Vector2 vectorWithX:0 y:0]];
    castle.backgroundImage.layerDepth = 0.9;
    [scene addItem:castle];
    
    barracks = [GraphicsComponent getImageButtonWithKey:TOWN_MENU_BUILDINGS_BARRACKS atPosition:[Vector2 vectorWithX:475 y:5]];
    barracks.backgroundImage.layerDepth = 0.9;
    [scene addItem:barracks];
    
    blacksmith = [GraphicsComponent getImageButtonWithKey:TOWN_MENU_BUILDINGS_BLACKSMITH atPosition:[Vector2 vectorWithX:67 y:319]];
    blacksmith.backgroundImage.layerDepth = 0.9;
    [scene addItem:blacksmith];
    
    trainingYard = [GraphicsComponent getImageButtonWithKey:TOWN_MENU_BUILDINGS_TRAINING_YARD atPosition:[Vector2 vectorWithX:389 y:362]];
    trainingYard.backgroundImage.layerDepth = 0.9;
    [scene addItem:trainingYard];
    
    warbandCamp = [GraphicsComponent getImageButtonWithKey:TOWN_MENU_BUILDINGS_WARBAND_CAMP atPosition:[Vector2 vectorWithX:771 y:387]];
    warbandCamp.backgroundImage.layerDepth = 0.9;
    [scene addItem:warbandCamp];
    
    gatehouse = [GraphicsComponent getImageButtonWithKey:TOWN_MENU_BUILDINGS_GATEHOUSE atPosition:[Vector2 vectorWithX:904 y:51]];
    gatehouse.backgroundImage.layerDepth = 0.9;
    [scene addItem:gatehouse];
    
    // interface test
    interface = [[Interface alloc] initToRectangle:[Rectangle rectangleWithX:128 y:64 width:768 height:384] layerDepth:0.7];
    [scene addItem:interface];
    
    
    [scene addItem:back];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    GameState *newState = nil;
    
    // check for actions
    if (gatehouse.wasReleased && !back.wasReleased) {
        [SoundEngine play:SoundEffectTypeClick];
        //newState = [[WorldMenu alloc] initWithGame:self.game];
    }
    
    if (barracks.wasReleased) {
        [scene addItem:interface];
        [interface updateContent:BuildingTypeBarracks];
    }
    
    if (newState) {
        [knightsGame pushState:newState];
    }
}

- (void) dealloc {
    [title release];
    
    [gatehouse release];
    
    [interface release];
    
    [super dealloc];
}

@end
