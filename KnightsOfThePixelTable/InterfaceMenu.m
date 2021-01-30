//
//  InterfaceMenu.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 17/01/2021.
//  Copyright © 2021 Anei Makovec. All rights reserved.
//

#import "InterfaceMenu.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Pixlron.Knights.h"

@implementation InterfaceMenu

- (void) initialize {
    [super initialize];
    
    background = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_BACKGROUND atPosition:[Vector2 vectorWithX:0 y:0] width:[Constants backgroundWidth] height:[Constants battlefieldHeight] + [Constants hudHeight]];
    background.layerDepth = 0.3;
    [scene addItem:background];
    
    [scene addItem:back];
}

@end
