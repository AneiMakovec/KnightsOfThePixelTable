//
//  Renderer.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.h"
#import "PixEngine.Graphics.h"

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameRenderer : DrawableGameComponent {
    // core
    SpriteBatch *spriteBatch;
    Gameplay *gameplay;
    Matrix *camera;
    
    int hudOffset;
    
    // background and hud textures
    Texture2D *levelBackgrounds[LevelTypes];
    Texture2D *hud;
    
    
    
    
    
    // entities idle animations
    Texture2D *hpPool;
    Texture2D *allyTexturesIdle[CombatPositions];
    AnimatedSprite *allySprites[CombatPositions];
    
    // skill textures
    Texture2D *basicMeleeSkill;
    
    
    
    
    
    
    // dice textures
    Texture2D *diceSymbolTexture;
    Texture2D *diceGoodAnimTexture;
    Texture2D *diceEvilAnimTexture;
    
    // dice animations and sprites
    Sprite *diceSymbols[StatTypes];
    Sprite *diceFrames[DiceFrameTypes];
    AnimatedSprite *diceGoodAnim;
    AnimatedSprite *diceEvilAnim;
    
    // portraits
    Texture2D *portraitTexture;
    Sprite *portraits[CombatPositions];
}

@property (nonatomic, readonly) Matrix *camera;

- (id) initWithGame:(Game *)theGame gameplay:(Gameplay *)gameplay;

@end

NS_ASSUME_NONNULL_END
