//
//  TownSpriteComponent.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "TownSpriteComponent.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

#import "Constants.h"

TownSpriteComponent *camelotinstance;

@implementation TownSpriteComponent

+ (void) activateWithGame:(Game *)game {
    camelotinstance = [[TownSpriteComponent alloc] initWithGame:game];
    [game.components addComponent:camelotinstance];
}

+ (void) deactivate {
    [camelotinstance.game.components removeComponent:camelotinstance];
    [camelotinstance release];
}

+ (Texture2D *) getInterfaceProp:(InterfacePropType)type {
    return [camelotinstance getInterfaceProp:type];
}

+ (SpriteFont *) getFont {
    return [camelotinstance getFont];
}

+ (Texture2D *) getPortraitForUnitType:(KnightType)type {
    return [camelotinstance getPortraitForUnitType:type];
}




- (void) initialize {
    // load textures
    
    // interface
    // background
    propTextures[InterfacePropBackground] = [self.game.content load:INTERFACE_BACKGROUND];
    
    // buttons
    propTextures[InterfacePropButtonClosePressed] = [self.game.content load:INTERFACE_BUTTON_CLOSE_PRESSED];
    propTextures[InterfacePropButtonCloseNotPressed] = [self.game.content load:INTERFACE_BUTTON_CLOSE_NOT_PRESSED];
    propTextures[InterfacePropButtonPressed] = [self.game.content load:INTERFACE_BUTTON_PRESSED];
    propTextures[InterfacePropButtonNotPressed] = [self.game.content load:INTERFACE_BUTTON_NOT_PRESSED];
    
    // panes
    propTextures[InterfacePropPaneScroll] = [self.game.content load:INTERFACE_PANE_SCROLL];
    propTextures[InterfacePropPaneScrollBorder] = [self.game.content load:INTERFACE_PANE_SCROLL_BORDER];
    propTextures[InterfacePropPaneScrollLine] = [self.game.content load:INTERFACE_PANE_SCROLL_LINE];
    propTextures[InterfacePropPaneSkills] = [self.game.content load:INTERFACE_PANE_SKILLS];
    propTextures[InterfacePropPane] = [self.game.content load:INTERFACE_PANE];
    
    // slots
    propTextures[InterfacePropSlotBronze] = [self.game.content load:INTERFACE_SLOT_BRONZE];
    propTextures[InterfacePropSlotGold] = [self.game.content load:INTERFACE_SLOT_GOLD];
    propTextures[InterfacePropSlotGreen] = [self.game.content load:INTERFACE_SLOT_GREEN];
    propTextures[InterfacePropSlotDice] = [self.game.content load:INTERFACE_SLOT_DICE];
    
    // tab
    propTextures[InterfacePropTab] = [self.game.content load:INTERFACE_TAB];
    
    
    // font
    FontTextureProcessor *fontProcessor = [[FontTextureProcessor alloc] init];
    font = [self.game.content load:FONT processor:fontProcessor];
    [fontProcessor release];
    
    // unit portraits
    portrait = [self.game.content load:BUTTON_BACKGROUND];
}

- (Texture2D *) getInterfaceProp:(InterfacePropType)type {
    return propTextures[type];
}

- (SpriteFont *) getFont {
    return font;
}

- (Texture2D *) getPortraitForUnitType:(KnightType)type {
    return portrait;
}



- (void) dealloc {
    for (int i = 0; i < InterfacePropTypes; i++) {
        [propTextures[i] release];
    }
    
    [font release];
    
    [super dealloc];
}

@end
