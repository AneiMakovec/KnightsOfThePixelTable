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
    
    
    // Background
    background = [[Image alloc] initWithTexture:[self.game.content load:BACKGROUND_WORLD_MENU] position:[Vector2 vectorWithX:0 y:0]];
    [scene addItem:background];
    
    
    // Text
    Label *farmlandsText = [[Label alloc] initWithFont:font text:@"Farmlands" position:[Vector2 vectorWithX:270 y:37]];
    farmlandsText.color = [Color darkBlue];
    farmlandsText.horizontalAlign = HorizontalAlignCenter;
    farmlandsText.verticalAlign = VerticalAlignMiddle;
    [scene addItem:farmlandsText];
    [farmlandsText release];
    
    Label *mountainsText = [[Label alloc] initWithFont:font text:@"Mountains" position:[Vector2 vectorWithX:900 y:45]];
    mountainsText.color = [Color darkBlue];
    mountainsText.horizontalAlign = HorizontalAlignCenter;
    mountainsText.verticalAlign = VerticalAlignMiddle;
    [scene addItem:mountainsText];
    [mountainsText release];
    
    Label *seashoreText = [[Label alloc] initWithFont:font text:@"Seashore" position:[Vector2 vectorWithX:132 y:400]];
    seashoreText.color = [Color darkBlue];
    seashoreText.horizontalAlign = HorizontalAlignCenter;
    seashoreText.verticalAlign = VerticalAlignMiddle;
    [scene addItem:seashoreText];
    [seashoreText release];
    
    Label *pinewoodsText = [[Label alloc] initWithFont:font text:@"Pinewoods" position:[Vector2 vectorWithX:745 y:320]];
    pinewoodsText.color = [Color darkBlue];
    pinewoodsText.horizontalAlign = HorizontalAlignCenter;
    pinewoodsText.verticalAlign = VerticalAlignMiddle;
    [scene addItem:pinewoodsText];
    [pinewoodsText release];
    
    
    // Buttons
    dungeonFarmlands = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:255 y:57 width:30 height:30] background:[self.game.content load:BUTTON_DESTINATION]];
    [scene addItem:dungeonFarmlands];
    
    dungeonMountains = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:885 y:65 width:30 height:30] background:[self.game.content load:BUTTON_DESTINATION]];
    [scene addItem:dungeonMountains];
    
    dungeonSeashore = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:117 y:420 width:30 height:30] background:[self.game.content load:BUTTON_DESTINATION]];
    [scene addItem:dungeonSeashore];
    
    dungeonPinewoods = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:730 y:340 width:30 height:30] background:[self.game.content load:BUTTON_DESTINATION]];
    [scene addItem:dungeonPinewoods];
    
    
    [scene addItem:back];
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    // invoke super method
    [super updateWithGameTime:gameTime];
    
    // check if clicked any button
    GameState *newState = nil;
    if (dungeonFarmlands.wasReleased) {
        newState = [[Gameplay alloc] initWithGame:self.game levelType:LevelTypeFarmlands];
    } else if (dungeonMountains.wasReleased) {
        newState = [[Gameplay alloc] initWithGame:self.game levelType:LevelTypeMountains];
    } else if (dungeonSeashore.wasReleased) {
        newState = [[Gameplay alloc] initWithGame:self.game levelType:LevelTypeSeashore];
    } else if (dungeonPinewoods.wasReleased) {
        newState = [[Gameplay alloc] initWithGame:self.game levelType:LevelTypePinewoods];
    }
    
    if (newState) {
        [knightsGame pushState:newState];
    }
}


- (void) dealloc {
    [dungeonFarmlands release];
    [dungeonSeashore release];
    [dungeonMountains release];
    [dungeonPinewoods release];
    [background release];
    
    [super dealloc];
}

@end
