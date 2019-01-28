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
    Texture2D *hudWaveCounter;
    
    
    
    
    
    // entity textures
    Texture2D *hpPool;
    Texture2D *allyTextures[CombatPositions];
    Texture2D *enemyTextures[MonsterTypes];
    
    // idle sprites
    AnimatedSprite *allyIdleSprites[CombatPositions];
    AnimatedSprite *enemyIdleSprites[MonsterTypes];
    
    // move sprites
    AnimatedSprite *allyMoveSprites[CombatPositions];
    AnimatedSprite *enemyMoveSprites[MonsterTypes];
    
    // hit sprites
    AnimatedSprite *allyHitSprites[CombatPositions];
    AnimatedSprite *enemyHitSprites[MonsterTypes];
    
    // death sprites
    AnimatedSprite *allyDeathSprites[CombatPositions];
    AnimatedSprite *enemyDeathSprites[MonsterTypes];
    
    // attack sprites
    AnimatedSprite *allyAttackSprites[CombatPositions];
    AnimatedSprite *enemyAttackSprites[MonsterTypes];
    
    
    
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
