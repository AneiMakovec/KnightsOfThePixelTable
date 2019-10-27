//
//  WarbandCampInterface.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "WarbandCampInterface.h"

#import "Pixlron.Knights.h"

#define FIRST_SLOT @"first"
#define SECOND_SLOT @"second"
#define THIRD_SLOT @"third"
#define FOURTH_SLOT @"fourth"

@implementation WarbandCampInterface

- (id) initWithLayerDepth:(float)depth rooster:(Rooster *)theRooster {
    self = [super init];
    if (self != nil) {
        // retain rooster
        rooster = [theRooster retain];
        [items addObject:rooster];
        
        backImage = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_BACK_IMAGE_WARBAND_CAMP atPosition:[Constants getPositionDataForKey:POSITION_INTERFACE_BACK_IMAGE]];
        backImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        [items addObject:backImage];
        
        // init warband slots
//        warbandSlots[FirstWarbandSlot] = [[TouchImage alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotGreen] toRectangle:[Rectangle rectangleWithX:area.x + 455 y:area.y + 150 width:42 height:42]];
//        warbandSlots[FirstWarbandSlot].layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:warbandSlots[FirstWarbandSlot]];
//
//        warbandSlots[SecondWarbandSlot] = [[TouchImage alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotGreen] toRectangle:[Rectangle rectangleWithX:area.x + 415 y:area.y + 300 width:42 height:42]];
//        warbandSlots[SecondWarbandSlot].layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:warbandSlots[SecondWarbandSlot]];
//
//        warbandSlots[ThirdWarbandSlot] = [[TouchImage alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotGreen] toRectangle:[Rectangle rectangleWithX:area.x + 305 y:area.y + 150 width:42 height:42]];
//        warbandSlots[ThirdWarbandSlot].layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:warbandSlots[ThirdWarbandSlot]];
//
//        warbandSlots[FourthWarbandSlot] = [[TouchImage alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropSlotGreen] toRectangle:[Rectangle rectangleWithX:area.x + 265 y:area.y + 300 width:42 height:42]];
//        warbandSlots[FourthWarbandSlot].layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        [items addObject:warbandSlots[FourthWarbandSlot]];
        
        slots = [[RadioButtonGroup alloc] init];
        
        NSString *slotPosKey = POSITION_INTERFACE_WARBAND_CAMP_SLOTS;
        NSString *slotRegKeys[CombatPositions] = {FIRST_SLOT, SECOND_SLOT, THIRD_SLOT, FOURTH_SLOT};
        for (int i = 0; i < CombatPositions; i++) {
            BOOL down = NO;
            if (i == FirstCombatPosition)
                down = YES;
            
            warbandSlots[i] = [GraphicsComponent getImageRadioButtonWithKey:TOWN_MENU_INTERFACE_SLOTS_GREEN atPosition:[Constants getPositionDataForKey:[slotPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] isDown:down];
            warbandSlots[i].backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
            warbandSlots[i].backgroundHoverColor = [Color lightGreen];
            [slots registerRadioButton:warbandSlots[i] forKey:slotRegKeys[i]];
            [items addObject:warbandSlots[i]];
        }
        
//        warbandSlots[1] = [GraphicsComponent getImageRadioButtonWithKey:TOWN_MENU_INTERFACE_SLOTS_GREEN atPosition:[Vector2 vectorWithX:128 + 395 y:64 + 280] isDown:NO];
//        warbandSlots[1].backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        warbandSlots[1].backgroundHoverColor = [Color lightGreen];
//        [slots registerRadioButton:warbandSlots[1] forKey:SECOND_SLOT];
//        [items addObject:warbandSlots[1]];
//
//        warbandSlots[2] = [GraphicsComponent getImageRadioButtonWithKey:TOWN_MENU_INTERFACE_SLOTS_GREEN atPosition:[Vector2 vectorWithX:128 + 325 y:64 + 170] isDown:NO];
//        warbandSlots[2].backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        warbandSlots[2].backgroundHoverColor = [Color lightGreen];
//        [slots registerRadioButton:warbandSlots[2] forKey:THIRD_SLOT];
//        [items addObject:warbandSlots[2]];
//
//        warbandSlots[3] = [GraphicsComponent getImageRadioButtonWithKey:TOWN_MENU_INTERFACE_SLOTS_GREEN atPosition:[Vector2 vectorWithX:128 + 245 y:64 + 280] isDown:NO];
//        warbandSlots[3].backgroundImage.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
//        warbandSlots[3].backgroundHoverColor = [Color lightGreen];
//        [slots registerRadioButton:warbandSlots[3] forKey:FOURTH_SLOT];
//        [items addObject:warbandSlots[3]];
        
        [items addObject:slots];
        
//        selectedSlot = FirstWarbandSlot;
//        warbandSlots[selectedSlot].color = selectedColor;
        
        
        
        // load knight animations
        NSString *animKeys[KnightTypes] = {GAMEPLAY_MENU_ENTITIES_ALLIES_BRAWLER_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_PALADIN_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_BARD_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_LONGBOWMAN_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_CROSSBOWMAN_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_SCOUT_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_BATTLEMAGE_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_WIZARD_IDLE, GAMEPLAY_MENU_ENTITIES_ALLIES_MONK_IDLE};
        NSString *animPosKey = POSITION_INTERFACE_WARBAND_CAMP_KNIGHTS;
        for (int i = 0; i < CombatPositions; i++) {
            for (int j = 0; j < KnightTypes; j++) {
                knightAnimations[i][j] = [GraphicsComponent getAnimatedImageWithKey:animKeys[j] atPosition:[Constants getPositionDataForKey:[animPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
                [knightAnimations[i][j] setLayerDepth:depth + INTERFACE_LAYER_DEPTH_BACK];
                [knightAnimations[i][j] setScaleUniform:3.0f];
            }
        }
        
        // init knight IDs
        for (int i = 0; i < CombatPositions; i++) {
            knightIDs[i] = @"";
        }
    }
    return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // check if slots were selected
//    for (int i = 0; i < WarbandSlotTypes; i++) {
//        if (warbandSlots[i].wasReleased && selectedSlot != i) {
//            // reset color of previous selected slot
//            warbandSlots[selectedSlot].color = defaultColor;
//            selectedSlot = i;
//
//            // set color of currently selected slot
//            warbandSlots[selectedSlot].color = selectedColor;
//        }
//    }
    
    if (slots.pressedButtonChanged) {
        [slots reset];
        
        NSString *slotRegKeys[CombatPositions] = {FIRST_SLOT, SECOND_SLOT, THIRD_SLOT, FOURTH_SLOT};
        for (int i = 0; i < CombatPositions; i++) {
            if ([slots.pressedButtonKey isEqualToString:slotRegKeys[i]]) {
                KnightData *data = [GameProgress getKnightOnCombatPosition:i];
                if (data) {
                    [rooster setSelectedEntry:data.keyID];
                } else {
                    [rooster deselect];
                }
            }
        }
    }
    
    if (rooster.selectionChanged) {
        NSString *slotRegKeys[CombatPositions] = {FIRST_SLOT, SECOND_SLOT, THIRD_SLOT, FOURTH_SLOT};
        for (int i = 0; i < CombatPositions; i++) {
            if ([slots.pressedButtonKey isEqualToString:slotRegKeys[i]]) {
                KnightData *data = [rooster getSelectedData];
                if (data.fatigue > 100) {
                    // check if unit is assigned to other slots
                    for (int j = 0; j < CombatPositions; j++) {
                        KnightData *curData = [GameProgress getKnightOnCombatPosition:j];
                        if (curData && [data.keyID isEqualToString:curData.keyID]) {
                            // then remove it
                            [GameProgress removeKnightOnCombatPosition:j];
                            [self removeItemFromScene:knightAnimations[j][currentTypes[j]]];
                        }
                    }
                    
                    // remove animation from slected slot
                    [self removeItemFromScene:knightAnimations[i][currentTypes[i]]];
                    currentTypes[i] = data.type;
                    [self addItemToScene:knightAnimations[i][currentTypes[i]]];
                    
                    [GameProgress setKnight:data onCombatPosition:i];
                }
            }
        }
    }
}

- (void) update {
    NSString *slotRegKeys[CombatPositions] = {FIRST_SLOT, SECOND_SLOT, THIRD_SLOT, FOURTH_SLOT};
    for (int i = 0; i < CombatPositions; i++) {
        if ([slots.pressedButtonKey isEqualToString:slotRegKeys[i]]) {
            KnightData *data = [GameProgress getKnightOnCombatPosition:i];
            if (data) {
                [rooster setSelectedEntry:data.keyID];
            } else {
                [rooster deselect];
            }
        }
    }
}

- (void) reset {
    [rooster reselect];
}


- (void) dealloc {
    [rooster release];
    
    
    
    [super dealloc];
}

@end
