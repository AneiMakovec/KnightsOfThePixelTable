//
//  TownSpriteComponent.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Graphics.h"

#import "KOTPTEnums.h"

NS_ASSUME_NONNULL_BEGIN

@interface TownSpriteComponent : GameComponent {
    Texture2D *propTextures[InterfacePropTypes];
    
    SpriteFont *font;
    
    Texture2D *portrait;
}

+ (void) activateWithGame:(Game *)game;

+ (void) deactivate;

+ (Texture2D *) getInterfaceProp:(InterfacePropType)type;

+ (SpriteFont *) getFont;

+ (Texture2D *) getPortraitForUnitType:(KnightType)type;

@end

NS_ASSUME_NONNULL_END