//
//  TrainingYardInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "TrainingYardInterface.h"

#import "Pixlron.Knights.h"

#define KEY_STATS @"stats"
#define KEY_SKILLS @"skills"
#define KEY_EQUIPMENT @"equipment"

#define DEPTH_DIFF -0.1f

@implementation TrainingYardInterface

- (id) initWithLayerDepth:(float)depth trainRooster:(Rooster *)theTrainRooster rooster:(Rooster *)theRooster {
    self = [super init];
    if (self != nil) {
        showDepth = depth + INTERFACE_LAYER_DEPTH_GROUNDBACK + DEPTH_DIFF;
        hideDepth = depth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        
        showColor = [[Color white] retain];
        hideColor = [[Color gray] retain];
        
        // retain roosters
        rooster = [theRooster retain];
        
        trainRooster = [theTrainRooster retain];
        [items addObject:trainRooster];
        
        // init back image
        backImage = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_BACK_IMAGE_TRAINING_YARD atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BACK_IMAGE]];
        backImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        [items addObject:backImage];
        
        // init tabs
//        tabs = [[RadioButtonGroup alloc] init];
//
//        tabStats = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 227 y:area.y + 183 width:80 height:16] background:[TownSpriteComponent getInterfaceProp:InterfacePropTab] font:[TownSpriteComponent getFont] text:@"Stats" isDown:YES];
//        tabStats.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        tabStats.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [tabStats.label setScaleUniform:FONT_SCALE_TINY];
//        [tabs registerRadioButton:tabStats forKey:KEY_STATS];
//        [items addObject:tabStats];
//
//        tabSkills = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 307 y:area.y + 183 width:80 height:16] background:[TownSpriteComponent getInterfaceProp:InterfacePropTab] font:[TownSpriteComponent getFont] text:@"Skills" isDown:NO];
//        tabSkills.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        tabSkills.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [tabSkills.label setScaleUniform:FONT_SCALE_TINY];
//        [tabs registerRadioButton:tabSkills forKey:KEY_SKILLS];
//        [items addObject:tabSkills];
//
//        tabEquipment = [[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 387 y:area.y + 183 width:80 height:16] background:[TownSpriteComponent getInterfaceProp:InterfacePropTab] font:[TownSpriteComponent getFont] text:@"Equipment" isDown:NO];
//        tabEquipment.backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        tabEquipment.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [tabEquipment.label setScaleUniform:FONT_SCALE_TINY];
//        [tabs registerRadioButton:tabEquipment forKey:KEY_EQUIPMENT];
//        [items addObject:tabEquipment];
//
//        [items addObject:tabs];
        
//        // init pane for stats, skills and equipment
//        statPanel = [[StatsPanel alloc] initWithKnightData:[trainRooster getFirstData] layerDepth:depth];
//        [items addObject:statPanel];
//
//        skillPanel = [[SkillsPanel alloc] initWithKnightData:[trainRooster getFirstData] layerDepth:depth displayUpgradeButtons:NO];
        
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
//        unitName = [[Label alloc] initWithFont:[GraphicsComponent getFont] text:[trainRooster getFirstData].name position:[Vector2 vectorWithX:128 + 385 y:64 + 15]];
        NSString *name = @"";
        if ([trainRooster getFirstData])
            name = [trainRooster getFirstData].name;
        
        unitName = [GraphicsComponent getLabelWithText:name atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_UNIT_NAME]];
        unitName.verticalAlign = VerticalAlignTop;
        unitName.horizontalAlign = HorizontalAlignCenter;
        unitName.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        unitName.color = [Color darkGray];
        [unitName setScaleUniform:FONT_SCALE_BIG];
        [items addObject:unitName];
        
        classColors[DamageTypePhysical] = [[Color indianRed] retain];
        classColors[DamageTypeRanged] = [[Color green] retain];
        classColors[DamageTypeMagic] = [[Color blue] retain];
        
        NSString *classTextKey = TEXT_UNIT_CLASSES;
        for (int i = 0; i < KnightTypes; i++) {
            unitClassNames[i] = [Constants getTextForKey:[classTextKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]];
        }
        
        if ([trainRooster getFirstData]) {
            unitClassName = [GraphicsComponent getLabelWithText:unitClassNames[[trainRooster getFirstData].type] atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_UNIT_CLASS_NAME]];
            unitClassName.color = classColors[[trainRooster getFirstData].damageType];
        } else {
            unitClassName = [GraphicsComponent getLabelWithText:@"" atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_UNIT_CLASS_NAME]];
        }
        unitClassName.verticalAlign = VerticalAlignTop;
        unitClassName.horizontalAlign = HorizontalAlignCenter;
        unitClassName.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [unitClassName setScaleUniform:FONT_SCALE_MEDIUM];
        [items addObject:unitClassName];
        
        
        // init pane for stats, skills and equipment
        statPanel = [[StatsPanel alloc] initWithKnightData:[trainRooster getFirstData] layerDepth:showDepth];
        [skillPanel updateColor:showColor];
        [items addObject:statPanel];
        
        skillPanel = [[SkillsPanel alloc] initWithKnightData:[trainRooster getFirstData] layerDepth:hideDepth displayUpgradeButtons:NO];
        [skillPanel updateColor:hideColor];
        [items addObject:skillPanel];
        
        // init recturit button
        recruitButton = [GraphicsComponent getDoubleImageLabelButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_DEFAULT atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_TRAINING_YARD_RECRUIT] text:@"Recruit"];
        recruitButton.pressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        recruitButton.notPressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        recruitButton.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [recruitButton.label setScaleUniform:FONT_SCALE_MEDIUM];
        [recruitButton.label setScaleUniform:FONT_SCALE_MEDIUM];
        [items addObject:recruitButton];
        
//        equipmentPanel = [[EquipmentPanel alloc] initWithKnightData:[trainRooster getFirstData] area:area layerDepth:depth];
        
        
        // init recruit button
//        recruitButton = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 440 y:area.y + 323 width:95 height:32] notPressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[TownSpriteComponent getInterfaceProp:InterfacePropButtonPressed] font:[TownSpriteComponent getFont] text:@"Recruit"];
//        recruitButton.pressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        recruitButton.notPressedImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        recruitButton.label.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [recruitButton.label setScaleUniform:FONT_SCALE_MEDIUM];
//        [items addObject:recruitButton];
    }
    return self;
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    // check if different tab was selected
//    if (tabs.pressedButtonChanged) {
//        [tabs reset];
//
//        if ([tabs.pressedButtonKey isEqualToString:KEY_STATS]) {
//            // change to stats tab
//            [self removeItemFromScene:skillPanel];
////            [self removeItemFromScene:equipmentPanel];
//
//            [self addItemToScene:statPanel];
//        } else if ([tabs.pressedButtonKey isEqualToString:KEY_SKILLS]) {
//            // change to skills tab
//            [self removeItemFromScene:statPanel];
////            [self removeItemFromScene:equipmentPanel];
//
//            [self addItemToScene:skillPanel];
//        } else if ([tabs.pressedButtonKey isEqualToString:KEY_EQUIPMENT]) {
//            // change to equipment tab
//            [self removeItemFromScene:skillPanel];
//            [self removeItemFromScene:statPanel];
//
////            [self addItemToScene:equipmentPanel];
//        }
//    }
    
    // check if different unit was selected in rooster
    if (trainRooster.selectionChanged) {
        [statPanel updateToKnightData:[trainRooster getSelectedData]];
        [skillPanel updateToKnightData:[trainRooster getSelectedData]];
//        unitName.text = [trainRooster getSelectedData].name;
//        unitClassName.text = unitClassNames[[trainRooster getSelectedData].type];
        
        if ([trainRooster getSelectedData] != nil) {
            unitName.text = [trainRooster getSelectedData].name;
            unitClassName.text = unitClassNames[[trainRooster getSelectedData].type];
            unitClassName.color = classColors[[trainRooster getSelectedData].damageType];
        } else {
            unitName.text = @"";
            unitClassName.text = @"";
        }
    }
    
    // check if recruit button was pressed
    if (recruitButton.wasReleased) {
        if ([trainRooster getSelectedData]) {
            // move the racruited unit from the training rooster to the battle rooster
            [rooster addItem:[trainRooster getSelectedData]];
            [trainRooster removeItem:[trainRooster getSelectedEntry]];
        }
//
//        [statPanel updateToKnightData:[trainRooster getSelectedData]];
//        [skillPanel updateToKnightData:[trainRooster getSelectedData]];
        
//        if ([trainRooster getSelectedData] != nil) {
//            unitName.text = [trainRooster getSelectedData].name;
//            unitClassName.text = unitClassNames[[trainRooster getSelectedData].type];
//        } else {
//            unitName.text = @"";
//            unitClassName.text = @"";
//        }
    }
    
    // check if different tab was pressed
    if (statButton.wasReleased) {
        [statPanel updateColor:showColor];
        [statPanel updateDepth:showDepth];
        statButton.label.layerDepth -= hideDepth;
        statButton.label.layerDepth += showDepth;
        
        [statPanel updateToKnightData:[trainRooster getSelectedData]];
        
        [skillPanel setEnabled:NO];
        [skillPanel updateDepth:hideDepth];
        [skillPanel updateColor:hideColor];
        skillButton.label.layerDepth -= showDepth;
        skillButton.label.layerDepth += hideDepth;
    }
    
    if (skillButton.wasReleased) {
        [skillPanel setEnabled:YES];
        [skillPanel updateColor:showColor];
        [skillPanel updateDepth:showDepth];
        skillButton.label.layerDepth -= hideDepth;
        skillButton.label.layerDepth += showDepth;
        
        [skillPanel updateToKnightData:[trainRooster getSelectedData]];
        
        [statPanel updateDepth:hideDepth];
        [statPanel updateColor:hideColor];
        statButton.label.layerDepth -= showDepth;
        statButton.label.layerDepth += hideDepth;
    }
}






- (void) dealloc {
    [rooster release];
    [trainRooster release];
    
    [skillPanel release];
    [statPanel release];
    
    [recruitButton release];
    
    [super dealloc];
}

@end
