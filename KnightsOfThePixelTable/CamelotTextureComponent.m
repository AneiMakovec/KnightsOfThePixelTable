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

+ (Texture2D *) getInterfaceBackground {
    return [camelotinstance getInterfaceBackground];
}

+ (Texture2D *) getCloseButtonBackground {
    return [camelotinstance getCloseButtonBackground];
}




- (void) initialize {
    // load textures
    
    // interface background
    interfaceBackground = [self.game.content load:INTERFACE_BACKGROUND_MIDDLE_CENTER];
    
    // close button
    closeButtonBackground = [self.game.content load:BUTTON_DENY];
}

- (Texture2D *) getInterfaceBackground {
    return interfaceBackground;
}

- (Texture2D *) getCloseButtonBackground {
    return closeButtonBackground;
}



- (void) dealloc {
    [interfaceBackground release];
    [closeButtonBackground release];
    
    [super dealloc];
}

@end
