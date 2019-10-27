//
//  RoosterEntry.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 08/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "RoosterEntry.h"

#import "Pixlron.Knights.h"

@implementation RoosterEntry

- (id) initWithKnightData:(KnightData *)knightData toPosition:(Vector2 *)thePosition layerDepth:(float)depth {
    self = [super init];
    if (self != nil) {
        // store knight data
        data = [knightData retain];
        
        // init a new position
        position = [thePosition retain];
        
        // init line background
//        roosterLine = [[TouchImage alloc] initWithTexture:[TownSpriteComponent getInterfaceProp:InterfacePropPaneScrollLine] toRectangle:rectangle];
        roosterLine = [GraphicsComponent getTouchImageWithKey:TOWN_MENU_INTERFACE_PANE_SCROLL_LINE atPosition:position];
        roosterLine.position = position;
        roosterLine.layerDepth = depth;
        [items addObject:roosterLine];
        
        // init unit portrait
//        portrait = [[Image alloc] initWithTexture:[TownSpriteComponent getPortraitForUnitType:data.type] position:[Vector2 vectorWithX:position.x + 3 y:position.y + 3]];
        NSString *portraitKeys[KnightTypes] = {GAMEPLAY_MENU_ENTITIES_ALLIES_BRAWLER_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_PALADIN_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_BARD_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_LONGBOWMAN_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_CROSSBOWMAN_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_SCOUT_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_BATTLEMAGE_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_WIZARD_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_MONK_PORTRAIT};
        for (int i = 0; i < KnightTypes; i++) {
            portraits[i] = [GraphicsComponent getImageWithKey:portraitKeys[i] atPosition:[Vector2 vectorWithX:position.x + 1 y:position.y]];
            portraits[i].layerDepth = depth - INTERFACE_LAYER_DEPTH_ALMOSTGROUND;
            [portraits[i] setScaleUniform:2.0f];
        }
        
        currentType = data.type;
        [items addObject:portraits[currentType]];
        
        // init unit name
        name = [GraphicsComponent getLabelWithText:data.name atPosition:[Vector2 vectorWithX:position.x + 40 y:position.y + 16]];
        name.verticalAlign = VerticalAlignMiddle;
        name.horizontalAlign = HorizontalAlignLeft;
        name.layerDepth = depth - INTERFACE_LAYER_DEPTH_ALMOSTGROUND;
        [name setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:name];
        
        // int fatigue
        fatigue = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:@"%d%%", data.fatigue] atPosition:[Vector2 vectorWithX:position.x + 150 y:position.y + 16]];
        fatigue.verticalAlign = VerticalAlignMiddle;
        fatigue.horizontalAlign = HorizontalAlignRight;
        fatigue.layerDepth = depth - INTERFACE_LAYER_DEPTH_ALMOSTGROUND;
        [fatigue setScaleUniform:FONT_SCALE_SMALL];
        [items addObject:fatigue];
    }
    return self;
}

@synthesize data, position;



- (BOOL) wasSelected {
    return roosterLine.wasReleased;
}

- (void) setSelectedColor {
    [roosterLine setColor:[Color darkGray]];
    [portraits[currentType] setColor:[Color darkGray]];
    [name setColor:[Color darkGray]];
}

- (void) setNormalColor {
    [roosterLine setColor:[Color white]];
    [portraits[currentType] setColor:[Color white]];
    [name setColor:[Color white]];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // update fatigue
    fatigue.text = [NSString stringWithFormat:@"%d%%", data.fatigue];
    
    if (data.fatigue == 100) {
        fatigue.color = [Color red];
    } else {
        fatigue.color = [Color white];
    }
}



- (void) moveY:(float)distance {
    // move all items
    for (id item in items) {
        id<ICustomMovable> moveItem = [item conformsToProtocol:@protocol(ICustomMovable)] ? item : nil;
        if (moveItem) {
            [moveItem moveY:distance];
            // skip checking for protocol IPosition to avoid double movements
            continue;
        }
        
        id<IPosition> posItem = [item conformsToProtocol:@protocol(IPosition)] ? item : nil;
        if (posItem) {
            posItem.position.y += distance;
        }
    }
}

- (void) moveX:(float)distance {
    // do nothing
}

- (void) dealloc {
    [data release];
    [position release];
    [roosterLine release];
    [name release];
    
    [super dealloc];
}

@end
