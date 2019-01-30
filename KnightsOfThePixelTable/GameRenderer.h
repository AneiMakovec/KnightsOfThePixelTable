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
    TurnManager *turnManager;
    Matrix *camera;
    
    int hudOffset;
    
    // background and hud textures
    Texture2D *levelBackgrounds[LevelTypes];
    Texture2D *hud;
    Texture2D *hudWaveCounter;
    
    
    
    
    
    // entity textures
//    Texture2D *allyTextures[KnightTypes];
//    Texture2D *enemyTextures[MonsterTypes];
//    Texture2D *bossIdle;
//    Texture2D *bossMove;
//    Texture2D *bossHit;
//    Texture2D *bossDeath;
//    Texture2D *bossAttack;
//
//    // idle sprites
//    AnimatedSprite *allyIdleSprites[KnightTypes];
//    AnimatedSprite *enemyIdleSprites[CombatPositions];
//
//    // move sprites
//    AnimatedSprite *allyMoveSprites[KnightTypes];
//    AnimatedSprite *enemyMoveSprites[CombatPositions];
//
//    // hit sprites
//    AnimatedSprite *allyHitSprites[KnightTypes];
//    AnimatedSprite *enemyHitSprites[CombatPositions];
//
//    // death sprites
//    AnimatedSprite *allyDeathSprites[KnightTypes];
//    AnimatedSprite *enemyDeathSprites[CombatPositions];
//
//    // attack sprites
//    AnimatedSprite *allyAttackSprites[KnightTypes];
//    AnimatedSprite *enemyAttackSprites[CombatPositions];
    
    
    
    // skill textures
    Texture2D *skillIconsTexture;
    Sprite *basicAttackSprites[KnightTypes];
    Sprite *firstComboSkillSprites[KnightTypes];
    Sprite *secondComboSkillSprites[KnightTypes];
    Sprite *thirdComboSkillSprites[KnightTypes];
    
    // attack textures
    Texture2D *projectileArrow;
    Texture2D *projectileFireBall;
    
    // hp pool textures
    Texture2D *hpPool;
    Texture2D *enemyHpPool;
    
    
    
    
    
    
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

- (id) initWithGame:(Game *)theGame gameplay:(Gameplay *)gameplay turnManager:(TurnManager *)theTurnManager;

@end

NS_ASSUME_NONNULL_END
