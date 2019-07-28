//
//  CamelotTextureComponent.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "CamelotTextureComponent.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Constants.h"

CamelotTextureComponent *camelotinstance;

@implementation CamelotTextureComponent

+ (void) activateWithGame:(Game *)game {
    camelotinstance = [[CamelotTextureComponent alloc] initWithGame:game];
    [game.components addComponent:camelotinstance];
}

+ (void) deactivate {
    [camelotinstance.game.components removeComponent:camelotinstance];
    [camelotinstance release];
}

+ (Texture2D *) getInterfaceProp:(InterfacePropType)type {
    return [camelotinstance getInterfaceProp:type];
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
    propTextures[InterfacePropPaneScrollLine] = [self.game.content load:INTERFACE_PANE_SCROLL_LINE];
    propTextures[InterfacePropPaneStats] = [self.game.content load:INTERFACE_PANE_STATS];
    propTextures[InterfacePropPane] = [self.game.content load:INTERFACE_PANE];
    
    // slots
    propTextures[InterfacePropSlotBronze] = [self.game.content load:INTERFACE_SLOT_BRONZE];
    propTextures[InterfacePropSlotGold] = [self.game.content load:INTERFACE_SLOT_GOLD];
    propTextures[InterfacePropSlotGreen] = [self.game.content load:INTERFACE_SLOT_GREEN];
    propTextures[InterfacePropSlotDice] = [self.game.content load:INTERFACE_SLOT_DICE];
    
    // tab
    propTextures[InterfacePropTab] = [self.game.content load:INTERFACE_TAB];
}

- (Texture2D *) getInterfaceProp:(InterfacePropType)type {
    return propTextures[type];
}



- (void) dealloc {
    for (int i = 0; i < InterfacePropTypes; i++) {
        [propTextures[i] release];
    }
    
    [super dealloc];
}

@end
