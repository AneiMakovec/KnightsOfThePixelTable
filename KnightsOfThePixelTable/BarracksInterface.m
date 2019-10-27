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
        [items addObject:rooster];
        
        // init back image
        backImage = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_BACK_IMAGE_BARRACKS atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BACK_IMAGE]];
        backImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        [items addObject:backImage];

        // init tab buttons
        MetaData *data = [Constants getMetaDataForKey:META_INTERFACE_TAB];
        statButton = [GraphicsComponent getLabelButtonWithText:[Constants getTextForKey:TEXT_INTERFACE_TAB_STATS] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_TAB_STATS] width:data.width height:data.height];
        statButton.label.layerDepth = showDepth + INTERFACE_LAYER_DEPTH_BACK;
        [statButton.label setScaleUniform:FONT_SCALE_SMALL_MEDIUM];
        [items addObject:statButton];
        
        skillButton = [GraphicsComponent getLabelButtonWithText:[Constants getTextForKey:TEXT_INTERFACE_TAB_SKILLS] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_TAB_SKILLS] width:data.width height:data.height];
        skillButton.label.layerDepth = hideDepth + INTERFACE_LAYER_DEPTH_BACK;
        [skillButton.label setScaleUniform:FONT_SCALE_SMALL_MEDIUM];
        [items addObject:skillButton];
        
        // init unit name
//        unitName = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[rooster getFirstData].name position:[Vector2 vectorWithX:128 + 385 y:64 + 15]];
        NSString *name = @"";
        if ([rooster getFirstData])
            name = [rooster getFirstData].name;
        
        unitName = [GraphicsComponent getLabelWithText:name atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_UNIT_NAME]];
        unitName.verticalAlign = VerticalAlignTop;
        unitName.horizontalAlign = HorizontalAlignCenter;
        unitName.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        unitName.color = [Color darkGray];
        [unitName setScaleUniform:FONT_SCALE_BIG];
        [items addObject:unitName];
        
        NSString *classTextKey = TEXT_UNIT_CLASSES;
        for (int i = 0; i < KnightTypes; i++) {
            unitClassNames[i] = [Constants getTextForKey:[classTextKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]];
        }
        
        classColors[DamageTypePhysical] = [[Color indianRed] retain];
        classColors[DamageTypeRanged] = [[Color green] retain];
        classColors[DamageTypeMagic] = [[Color blue] retain];
        
        if ([rooster getFirstData]) {
            unitClassName = [GraphicsComponent getLabelWithText:unitClassNames[[rooster getFirstData].type] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_UNIT_CLASS_NAME]];
            unitClassName.color = classColors[[rooster getFirstData].damageType];
        } else {
            unitClassName = [GraphicsComponent getLabelWithText:@"" atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_UNIT_CLASS_NAME]];
        }
        unitClassName.verticalAlign = VerticalAlignTop;
        unitClassName.horizontalAlign = HorizontalAlignCenter;
        unitClassName.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [unitClassName setScaleUniform:FONT_SCALE_MEDIUM];
        [items addObject:unitClassName];
        
        
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
        
        if ([rooster getSelectedData] != nil) {
            unitName.text = [rooster getSelectedData].name;
            unitClassName.text = unitClassNames[[rooster getSelectedData].type];
            unitClassName.color = classColors[[rooster getSelectedData].damageType];
        } else {
            unitName.text = @"";
            unitClassName.text = @"";
        }
    }
    
    // check if different tab was pressed
    if (statButton.wasReleased) {
        [statPanel updateColor:showColor];
        [statPanel updateDepth:showDepth];
        statButton.label.layerDepth -= hideDepth;
        statButton.label.layerDepth += showDepth;

//        [skillPanel setEnabled:NO];
        [skillPanel updateDepth:hideDepth];
        [skillPanel updateColor:hideColor];
        skillButton.label.layerDepth -= showDepth;
        skillButton.label.layerDepth += hideDepth;
    }
    
    if (skillButton.wasReleased) {
//        [skillPanel setEnabled:YES];
        [skillPanel updateColor:showColor];
        [skillPanel updateDepth:showDepth];
        skillButton.label.layerDepth -= hideDepth;
        skillButton.label.layerDepth += showDepth;
        
        [statPanel updateDepth:hideDepth];
        [statPanel updateColor:hideColor];
        statButton.label.layerDepth -= showDepth;
        statButton.label.layerDepth += hideDepth;
    }
}


- (BOOL) wasSkillUpgradeButtonReleased:(SkillType)skill {
    return [skillPanel wasUpgradeBtnReleased:skill];
}

- (void) upgradeSkill:(SkillType)skill {
    KnightData *data = [rooster getSelectedData];
    [data upgradeSkill:skill];
    [statPanel updateToKnightData:data];
    [skillPanel updateToKnightData:data];
}

- (void) update {
    KnightData *data = [rooster getSelectedData];
    if (data) {
        [statPanel updateToKnightData:data];
        [skillPanel updateToKnightData:data];
        unitName.text = data.name;
        unitClassName.text = unitClassNames[data.type];
        unitClassName.color = classColors[data.damageType];
    }
}




- (void) dealloc {    
    [rooster release];
    
    [skillPanel release];
    [statPanel release];
    
    [super dealloc];
}

@end
