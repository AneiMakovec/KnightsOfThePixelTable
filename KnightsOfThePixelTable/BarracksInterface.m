//
//  BarracksInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "BarracksInterface.h"

#import "Pixlron.Knights.h"

#define KEY_STATS @"stats"
#define KEY_SKILLS @"skills"
#define KEY_EQUIPMENT @"equipment"

#define DEPTH_DIFF -0.1f

@implementation BarracksInterface

- (id) initWithLayerDepth:(float)depth rooster:(Rooster *)theRooster {
    self = [super init];
    if (self != nil) {
        
        showDepth = depth + INTERFACE_LAYER_DEPTH_GROUNDBACK + DEPTH_DIFF;
        hideDepth = depth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        
        showColor = [[Color white] retain];
        hideColor = [[Color gray] retain];
        
        // retain rooster
        rooster = [theRooster retain];

        // init tab buttons
        MetaData *data = [Constants getMetaDataForKey:META_INTERFACE_TAB];
        statButton = [GraphicsComponent getLabelButtonWithText:[Constants getTextForKey:TEXT_INTERFACE_TAB_STATS] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_TAB_STATS] width:data.width height:data.height];
        [items addObject:statButton];
        
        skillButton = [GraphicsComponent getLabelButtonWithText:[Constants getTextForKey:TEXT_INTERFACE_TAB_SKILLS] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_TAB_SKILLS] width:data.width height:data.height];
        [items addObject:skillButton];
        
        // init unit name
//        unitName = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[rooster getFirstData].name position:[Vector2 vectorWithX:128 + 385 y:64 + 15]];
        unitName = [GraphicsComponent getLabelWithText:[rooster getFirstData].name atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_UNIT_NAME]];
        unitName.verticalAlign = VerticalAlignTop;
        unitName.horizontalAlign = HorizontalAlignCenter;
        unitName.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [unitName setScaleUniform:FONT_SCALE_MEDIUM];
        [items addObject:unitName];
        
        
        // init pane for stats, skills and equipment
        statPanel = [[StatsPanel alloc] initWithKnightData:[rooster getFirstData] layerDepth:showDepth];
        [skillPanel updateColor:showColor];
        [items addObject:statPanel];
        
        skillPanel = [[SkillsPanel alloc] initWithKnightData:[rooster getFirstData] layerDepth:hideDepth displayUpgradeButtons:YES];
        [skillPanel updateColor:hideColor];
        [items addObject:skillPanel];
    }
    return self;
}




- (void) updateWithGameTime:(GameTime *)gameTime {
    // check if different unit was selected in rooster
    if (rooster.selectionChanged) {
        [statPanel updateToKnightData:[rooster getSelectedData]];
        [skillPanel updateToKnightData:[rooster getSelectedData]];
        unitName.text = [rooster getSelectedData].name;
    }
    
    // check if different tab was pressed
    if (statButton.wasReleased) {
        [statPanel updateColor:showColor];
        [statPanel updateDepth:showDepth];
        
        [skillPanel updateDepth:hideDepth];
        [skillPanel updateColor:hideColor];
    }
    
    if (skillButton.wasReleased) {
        [skillPanel updateColor:showColor];
        [skillPanel updateDepth:showDepth];
        
        [statPanel updateDepth:hideDepth];
        [statPanel updateColor:hideColor];
    }
}




- (void) dealloc {    
    [rooster release];
    
    [skillPanel release];
    [statPanel release];
    
    [super dealloc];
}

@end
