//
//  TextureComponent.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 30/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Graphics.h"

#import "KOTPTEnums.h"

NS_ASSUME_NONNULL_BEGIN

@interface TextureComponent : GameComponent {
    Texture2D *allyTextures[KnightTypes];
    Texture2D *enemyTextures[MonsterTypes];
}

+ (void) activateWithGame:(Game *)game;

+ (void) deactivate;

+ (AnimatedSprite *) getAnimationType:(EntityState)type forAlly:(KnightType)ally;

+ (AnimatedSprite *) getAnimationType:(EntityState)type forEnemy:(MonsterType)enemy;

@end

NS_ASSUME_NONNULL_END
