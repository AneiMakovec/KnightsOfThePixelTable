//
//  CamelotMenu.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 07/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "CamelotMenu.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

#import "Pixlron.Knights.h"

@implementation CamelotMenu

- (void) initialize {
    [super initialize];
    
    // init textures
    [CamelotTextureComponent activateWithGame:self.game];
    
    // Background
    background = [[Image alloc] initWithTexture:[self.game.content load:BACKGROUND_CAMELOT] position:[Vector2 vectorWithX:0 y:0]];
    background.layerDepth = 0.9;
    [scene addItem:background];
    
    // Text
    title = [[Label alloc] initWithFont:font text:@"Cemelot" position:[Vector2 vectorWithX:[Constants backgroundWidth] / 2 y:20]];
    title.horizontalAlign = HorizontalAlignCenter;
    title.verticalAlign = VerticalAlignMiddle;
    [scene addItem:title];
    
    
    // Buttons
//    castle = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:200 y:50 width:200 height:50]
//                                   background:buttonBackground font:font text:@"Castle"];
//    [scene addItem:castle];
//
//    commandersPost = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:400 y:150 width:200 height:50]
//                                      background:buttonBackground font:font text:@"Commander's post"];
//    [scene addItem:commandersPost];
//
//    barracks = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:650 y:200 width:200 height:50]
//                                            background:buttonBackground font:font text:@"Barracks"];
//    [scene addItem:barracks];
//
    gatehouse = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:0 y:0 width:[Constants backgroundWidth] height:[Constants hudHeight] + [Constants battlefieldHeight]] background:[self.game.content load:BUTTON_GATE]];
    gatehouse.backgroundImage.layerDepth = 0.8;
    [scene addItem:gatehouse];
    
//    enchantersGuild = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:50 y:130 width:200 height:50]
//                                       background:buttonBackground font:font text:@"Enchanter's guild"];
//    [scene addItem:enchantersGuild];
//    
//    blackSmith = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:20 y:300 width:200 height:50]
//                                             background:buttonBackground font:font text:@"Black smith"];
//    [scene addItem:blackSmith];
//    
//    adventurersYard = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:200 y:400 width:200 height:50]
//                                        background:buttonBackground font:font text:@"Adventurer's yard"];
//    [scene addItem:adventurersYard];
//    
//    warbandCamp = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:460 y:350 width:200 height:50]
//                                        background:buttonBackground font:font text:@"Warband camp"];
//    [scene addItem:warbandCamp];
    
    
    FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
    SpriteFont *font = [[self.game.content load:FONT processor:fontProcessor] autorelease];
    
    // interface test
    interface = [[Interface alloc] initToRectangle:[Rectangle rectangleWithX:128 y:64 width:768 height:384] font:font layerDepth:0.7 type:BuildingTypeBarracks];
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
    
    if (newState) {
        [knightsGame pushState:newState];
    }
}

- (void) dealloc {
    [title release];
    
    [castle release];
    [commandersPost release];
    [barracks release];
    [enchantersGuild release];
    [blackSmith release];
    [adventurersYard release];
    [warbandCamp release];
    [gatehouse release];
    
    [interface  release];
    
    [super dealloc];
}

@end
