//
//  Renderer.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Pixlron.Knights.h"
#import "GameRenderer.h"

@implementation GameRenderer

@synthesize camera;

/*
 MARK: INITIALIZE
*/
- (void) initialize {
    [super initialize];
    // set display camera
    //camera = [ScreenComponent getCamera];
    
//    float scaleX = (float)self.game.gameWindow.clientBounds.width / [Constants backgroundWidth];
//    float scaleY = (float)self.game.gameWindow.clientBounds.height / ([Constants battlefieldHeight] + [Constants hudHeight]);
//    camera = [[Matrix createScale:[Vector3 vectorWithX:scaleX y:scaleY z:1]] retain];
    
    camera = [[ScreenComponent getCamera] retain];
    
    // calculate hud offset
    //hudOffset = [ScreenComponent getScreenBounds].height * 0.625;
//    hudOffset = [Constants battlefieldHeight];
}




/*
 MARK: LOAD CONTENT
*/
- (void) loadContent {
    spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
    
    // Backgrounds
//    levelBackgrounds[LevelTypeSeashore] = [self.game.content load:AREA_SEASHORE];
//    levelBackgrounds[LevelTypeFarmlands] = [self.game.content load:AREA_FARMLANDS];
//    levelBackgrounds[LevelTypeMountains] = [self.game.content load:AREA_MOUNTAINS];
//    levelBackgrounds[LevelTypePinewoods] = [self.game.content load:AREA_PINEWOODS];
    
    // HUD
//    hud = [self.game.content load:HUD];
//    hudWaveCounter = [self.game.content load:HUD_WAVE_COUNTER];
//
//    // Hp pool
//    hpPool = [self.game.content load:HP_POOL];
//    enemyHpPool = [self.game.content load:HP_ENEMY_POOL];
//
//    // Skills
//    skillIconsTexture = [self.game.content load:SKILL_ICONS];
//
//    // Attacks
//    projectileArrow = [self.game.content load:PROJECTILE_ARROW];
//    projectileFireBall = [self.game.content load:PROJECTILE_FIREBALL];
//
//    // Dice textures
//    diceSymbolTexture = [self.game.content load:DICE_SYMBOLS];
//    diceGoodAnimTexture = [self.game.content load:DICE_ANIM_GOOD];
//    diceEvilAnimTexture = [self.game.content load:DICE_ANIM_EVIL];
//
//    // Dice symbols
//    diceFrames[DiceFrameTypeGood] =[[Sprite alloc] init];
//    diceFrames[DiceFrameTypeGood].texture = diceSymbolTexture;
//    diceFrames[DiceFrameTypeGood].sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:32 height:32];
//    diceFrames[DiceFrameTypeGood].origin = [Vector2 vectorWithX:16 y:16];
//
//    diceFrames[DiceFrameTypeEvil] =[[Sprite alloc] init];
//    diceFrames[DiceFrameTypeEvil].texture = diceSymbolTexture;
//    diceFrames[DiceFrameTypeEvil].sourceRectangle = [Rectangle rectangleWithX:32 y:0 width:32 height:32];
//    diceFrames[DiceFrameTypeEvil].origin = [Vector2 vectorWithX:16 y:16];
//
//    diceSymbols[Agility] =[[Sprite alloc] init];
//    diceSymbols[Agility].texture = diceSymbolTexture;
//    diceSymbols[Agility].sourceRectangle = [Rectangle rectangleWithX:64 y:0 width:32 height:32];
//    diceSymbols[Agility].origin = [Vector2 vectorWithX:16 y:16];
//
//    diceSymbols[Cunning] =[[Sprite alloc] init];
//    diceSymbols[Cunning].texture = diceSymbolTexture;
//    diceSymbols[Cunning].sourceRectangle = [Rectangle rectangleWithX:96 y:0 width:32 height:32];
//    diceSymbols[Cunning].origin = [Vector2 vectorWithX:16 y:16];
//
//    diceSymbols[Accuracy] =[[Sprite alloc] init];
//    diceSymbols[Accuracy].texture = diceSymbolTexture;
//    diceSymbols[Accuracy].sourceRectangle = [Rectangle rectangleWithX:0 y:32 width:32 height:32];
//    diceSymbols[Accuracy].origin = [Vector2 vectorWithX:16 y:16];
//
//    diceSymbols[Defence] =[[Sprite alloc] init];
//    diceSymbols[Defence].texture = diceSymbolTexture;
//    diceSymbols[Defence].sourceRectangle = [Rectangle rectangleWithX:32 y:32 width:32 height:32];
//    diceSymbols[Defence].origin = [Vector2 vectorWithX:16 y:16];
//
//    diceSymbols[Strength] =[[Sprite alloc] init];
//    diceSymbols[Strength].texture = diceSymbolTexture;
//    diceSymbols[Strength].sourceRectangle = [Rectangle rectangleWithX:64 y:32 width:32 height:32];
//    diceSymbols[Strength].origin = [Vector2 vectorWithX:16 y:16];
//
//    diceSymbols[Sturdiness] =[[Sprite alloc] init];
//    diceSymbols[Sturdiness].texture = diceSymbolTexture;
//    diceSymbols[Sturdiness].sourceRectangle = [Rectangle rectangleWithX:96 y:32 width:32 height:32];
//    diceSymbols[Sturdiness].origin = [Vector2 vectorWithX:16 y:16];
//
//    // Dice good animation
//    diceGoodAnim = [[AnimatedSprite alloc] initWithDuration:1];
//    diceGoodAnim.looping = NO;
    
//    for (int i = 0; i < 8; i++) {
//        int x = i % 4;
//        int y = i / 4;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = diceGoodAnimTexture;
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:32 * x y:32 * y width:32 height:32];
//        frameSprite.origin = [Vector2 vectorWithX:16 y:16];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:diceGoodAnim.duration * (float) i / 8];
//        [diceGoodAnim addFrame:frame];
//    }
//
//    diceGoodAnim.looping = YES;
    
    // Dice evil animation
//    diceEvilAnim = [[AnimatedSprite alloc] initWithDuration:1];
//    diceEvilAnim.looping = NO;
//
//    for (int i = 0; i < 8; i++) {
//        int x = i % 4;
//        int y = i / 4;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = diceEvilAnimTexture;
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:32 * x y:32 * y width:32 height:32];
//        frameSprite.origin = [Vector2 vectorWithX:16 y:16];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:diceEvilAnim.duration * (float) i / 8];
//        [diceEvilAnim addFrame:frame];
//    }
//
//    diceEvilAnim.looping = YES;
//
//
//
//    // skill sprites
//    for (int i = 0; i < KnightTypes; i++) {
//        basicAttackSprites[i] = [[Sprite alloc] init];
//        basicAttackSprites[i].texture = skillIconsTexture;
//        basicAttackSprites[i].sourceRectangle = [Rectangle rectangleWithX:32 * 0 y:32 * i width:32 height:32];
//        basicAttackSprites[i].origin = [Vector2 vectorWithX:16 y:16];
//
//        firstComboSkillSprites[i] = [[Sprite alloc] init];
//        firstComboSkillSprites[i].texture = skillIconsTexture;
//        firstComboSkillSprites[i].sourceRectangle = [Rectangle rectangleWithX:32 * 1 y:32 * i width:32 height:32];
//        firstComboSkillSprites[i].origin = [Vector2 vectorWithX:16 y:16];
//
//        secondComboSkillSprites[i] = [[Sprite alloc] init];
//        secondComboSkillSprites[i].texture = skillIconsTexture;
//        secondComboSkillSprites[i].sourceRectangle = [Rectangle rectangleWithX:32 * 2 y:32 * i width:32 height:32];
//        secondComboSkillSprites[i].origin = [Vector2 vectorWithX:16 y:16];
//
//        thirdComboSkillSprites[i] = [[Sprite alloc] init];
//        thirdComboSkillSprites[i].texture = skillIconsTexture;
//        thirdComboSkillSprites[i].sourceRectangle = [Rectangle rectangleWithX:32 * 3 y:32 * i width:32 height:32];
//        thirdComboSkillSprites[i].origin = [Vector2 vectorWithX:16 y:16];
//    }
    
    
    // characters - ALLY textures
//    for (int i = 0; i < KnightTypes; i++) {
// //        Knight *knight = [gameplay.currentLevel.battlefield getAllyAtPosition:i];
//
//        switch (i) {
//            case KnightTypeBrawler:
//                allyTextures[i] = [self.game.content load:CHARACTER_BRAWLER];
//                break;
//
//            case KnightTypeLongbowman:
//                allyTextures[i] = [self.game.content load:CHARACTER_BOWMAN];
//                break;
//
//            case KnightTypePaladin:
//                allyTextures[i] = [self.game.content load:CHARACTER_PALADIN];
//                break;
//
//            case KnightTypeWizard:
//                allyTextures[i] = [self.game.content load:CHARACTER_FIRE_ENCHANTRESS];
//                break;
//
//            default:
//                break;
//        }
//
//        [self loadAnimationsOfAlly:i];
//    }
    
    
//    // load enemy sprites
//    for (int i = 0; i < MonsterTypeBossKnight; i++) {
//        [self loadTextureOfEnemy:i];
//    }
//
//    for (int i = 0; i < CombatPositions; i++) {
//        Monster *monster = [gameplay.currentLevel.battlefield getEnemyAtPosition:i];
//        if (monster) {
//            if (monster.type == MonsterTypeBossKnight) {
//                [self loadAnimationsOfEnemyBossAtPosition:i];
//            } else {
//                [self loadAnimationsOfEnemy:monster combatPosition:i];
//            }
//        }
//    }
    
    
    
    
    
    // portraits
//    portraitTexture = [self.game.content load:@"ui_icons"];
//
//    for (int i = 0; i < CombatPositions; i++) {
//        portraits[i] = [[Sprite alloc] init];
//        portraits[i].texture = portraitTexture;
//        portraits[i].sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:32 height:32];
//        portraits[i].origin = [Vector2 vectorWithX:0 y:0];
//
//    }
}






/*
 MARK: DRAW
*/
- (void) drawWithGameTime:(GameTime *)gameTime {
//    float allyDepth, enemyDepth;
//    if (turnManager.playersTurn) {
//        allyDepth = 0;
//        enemyDepth = 0.1f;
//    } else {
//        allyDepth = 0.1f;
//        enemyDepth = 0;
//    }
    
    
    // begin
    [spriteBatch beginWithSortMode:SpriteSortModeBackToFront BlendState:nil SamplerState:[SamplerState pointClamp]
                 DepthStencilState:nil RasterizerState:nil Effect:nil TransformMatrix:camera];
    
    // backgorund
    //[spriteBatch draw:levelBackgrounds[LevelTypeFarmlands] toRectangle:[Rectangle rectangleWithX:0 y:0 width:[ScreenComponent getScreenBounds].width height:hudOffset] tintWithColor:[Color white]];
//    [spriteBatch draw:levelBackgrounds[LevelTypeFarmlands] toRectangle:[Rectangle rectangleWithX:0 y:0 width:[Constants backgroundWidth] height:hudOffset] tintWithColor:[Color white]];
//    [spriteBatch draw:levelBackgrounds[gameplay.currentLevel.levelType] toRectangle:[Rectangle rectangleWithX:0 y:0 width:[Constants backgroundWidth] height:hudOffset] fromRectangle:nil tintWithColor:[Color white] rotation:0 origin:nil effects:SpriteEffectsNone layerDepth:0.1];
    
    // hud
    //[spriteBatch draw:hud toRectangle:[Rectangle rectangleWithX:0 y:hudOffset width:[ScreenComponent getScreenBounds].width height:[ScreenComponent getScreenBounds].height - hudOffset] tintWithColor:[Color white]];
//    [spriteBatch draw:hud toRectangle:[Rectangle rectangleWithX:0 y:hudOffset width:[Constants backgroundWidth] height:[Constants hudHeight]] tintWithColor:[Color white]];
    
//    [spriteBatch draw:hudWaveCounter to:[Vector2 vectorWithX:0 y:0] tintWithColor:[Color white]];
    
    
    // scene items
    for (id item in [Level scene]) {
        
        // check if is knight entity
        Knight *knight = [item isKindOfClass:[Knight class]] ? (Knight *)item : nil;
        if (knight) {
//            CombatPosition pos = [gameplay.currentLevel.battlefield getCombatPositionOfAlly:knight];
//
//            // portrait
//            Color *portraitColor;
//            if (knight.finishedAttacking)
//                portraitColor = [Color darkGray];
//            else
//                portraitColor = [Color white];
//
//            Sprite *portrait = portraits[pos];
//            [spriteBatch draw:portrait.texture toRectangle:knight.portraitArea fromRectangle:portrait.sourceRectangle tintWithColor:portraitColor];
            
            // sprite
//            Sprite *drawable;
//            SpriteEffects effect;
//            switch (knight.state) {
//                case EntityStateIdle:
//                    if (knight.isDead) {
//                        drawable = [allyDeathSprites[knight.type] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                        if (![allyDeathSprites[knight.type] isAlive]) {
//                            [allyDeathSprites[knight.type] reset];
//                        }
//                    } else {
//                        drawable = [allyIdleSprites[knight.type] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    }
//
//                    effect = SpriteEffectsNone;
//                    break;
//
//                case EntityStateApproaching:
//                    drawable = [allyMoveSprites[knight.type] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    effect = SpriteEffectsNone;
//                    break;
//
//                case EntityStateRetreating:
//                    drawable = [allyMoveSprites[knight.type] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    effect = SpriteEffectsFlipHorizontally;
//                    break;
//
//                case EntityStateAttacking:
//                    drawable = [allyAttackSprites[knight.type] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    effect = SpriteEffectsNone;
//                    break;
//
//                case EntityStateDefending:
//                    if (![allyHitSprites[knight.type] isAlive]) {
//                        [allyHitSprites[knight.type] reset];
//                        [knight stopDefending];
//                        drawable = [allyIdleSprites[knight.type] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    } else {
//                        drawable = [allyHitSprites[knight.type] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    }
//
//                    effect = SpriteEffectsNone;
//                    break;
//
//                default:
//                    drawable = [allyIdleSprites[knight.type] spriteWithElapsedTime:gameTime.elapsedGameTime];
//
//                    effect = SpriteEffectsNone;
//                    break;
//            }
//            SpriteEffects effect = SpriteEffectsNone;
//            if (knight.state == EntityStateRetreating)
//                effect = SpriteEffectsFlipHorizontally;
            
            Sprite *drawable = [[knight getCurrentAnimation] spriteWithElapsedTime:gameTime.elapsedGameTime];
            [spriteBatch draw:drawable.texture to:knight.position fromRectangle:drawable.sourceRectangle tintWithColor:[Color white] rotation:0 origin:drawable.origin scaleUniform:3.5f effects:SpriteEffectsNone layerDepth:0.8f];
                
            // hp exp pool
//            [spriteBatch draw:hpPool toRectangle:knight.hpPoolArea fromRectangle:nil tintWithColor:[Color white] rotation:0 origin:nil effects:SpriteEffectsNone layerDepth:0.1];
            
            // skill
//            Color *skillColor = [Color white];
//            if (knight.skillType == BasicAttack) {
//                skillColor = [Color white];
//            } else if (knight.skillType == FirstComboSkill) {
//                skillColor = [Color red];
//            } else if (knight.skillType == SecondComboSkill) {
//                skillColor = [Color green];
//            } else if (knight.skillType == ThirdComboSkill) {
//                skillColor = [Color yellow];
//            }
            
            
//            if (knight.skillType != NoSkill) {
//                Sprite *skill = nil;
//                switch (knight.skillType) {
//                    case BasicAttack:
//                        skill = basicAttackSprites[knight.type];
//                        break;
//
//                    case FirstComboSkill:
//                        skill = firstComboSkillSprites[knight.type];
//                        break;
//
//                    case SecondComboSkill:
//                        skill = secondComboSkillSprites[knight.type];
//                        break;
//
//                    case ThirdComboSkill:
//                        skill = thirdComboSkillSprites[knight.type];
//                        break;
//
//                    default:
//                        break;
//                }
//
//                if (skill)
//                    [spriteBatch draw:skill.texture toRectangle:knight.skillArea fromRectangle:skill.sourceRectangle tintWithColor:[Color white] rotation:0 origin:skill.origin effects:SpriteEffectsNone layerDepth:0];
//            }
            
                
                
            // combo
//            for (ComboSlot *comboSlot in knight.combo) {
//                if (comboSlot.item) {
//                [spriteBatch draw:diceSymbols[comboSlot.item.type].texture toRectangle:comboSlot.area fromRectangle:diceSymbols[comboSlot.item.type].sourceRectangle tintWithColor:[Color white] rotation:0 origin:diceSymbols[comboSlot.item.type].origin effects:SpriteEffectsNone layerDepth:0];
//                }
//            }
        }
        
        // check if is monster entity
        Monster *monster = [item isKindOfClass:[Monster class]] ? (Monster *)item : nil;
        if (monster) {
            // sprite
//            Sprite *drawable;
//            SpriteEffects effect;
//            switch (monster.state) {
//                case EntityStateIdle:
//                    if (monster.isDead) {
//                        drawable = [enemyDeathSprites[pos] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    } else {
//                        drawable = [enemyIdleSprites[pos] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    }
//
//                    effect = SpriteEffectsFlipHorizontally;
//                    break;
//
//                case EntityStateApproaching:
//                    drawable = [enemyMoveSprites[pos] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    effect = SpriteEffectsFlipHorizontally;
//                    break;
//
//                case EntityStateRetreating:
//                    drawable = [enemyMoveSprites[pos] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    effect = SpriteEffectsNone;
//                    break;
//
//                case EntityStateAttacking:
//                    drawable = [enemyAttackSprites[pos] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    effect = SpriteEffectsFlipHorizontally;
//                    break;
//
//                case EntityStateDefending:
//                    if (![enemyHitSprites[pos] isAlive]) {
//                        [enemyHitSprites[pos] reset];
//                        [monster stopDefending];
//                        drawable = [enemyIdleSprites[pos] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    } else {
//                        drawable = [enemyHitSprites[pos] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    }
//
//                    effect = SpriteEffectsFlipHorizontally;
//                    break;
//
//                default:
//                    drawable = [enemyIdleSprites[pos] spriteWithElapsedTime:gameTime.elapsedGameTime];
//                    effect = SpriteEffectsFlipHorizontally;
//                    break;
//            }
            
            // color changes if monster is targeted
//            Color *color;
//            if (monster.isTargeted)
//                color = [Color red];
//            else
//                color = [Color white];
//
//            SpriteEffects effect = SpriteEffectsFlipHorizontally;
//            if (monster.state == EntityStateRetreating)
//                effect = SpriteEffectsNone;
            
            Sprite *drawable = [[monster getCurrentAnimation] spriteWithElapsedTime:gameTime.elapsedGameTime];
            [spriteBatch draw:drawable.texture to:monster.position fromRectangle:drawable.sourceRectangle tintWithColor:[Color white] rotation:0 origin:drawable.origin scaleUniform:3.5f effects:SpriteEffectsNone layerDepth:0.8f];
            
            // hp pool
//            if (monster.state != EntityStateStart) {
//                [spriteBatch draw:enemyHpPool toRectangle:monster.hpPoolArea fromRectangle:nil tintWithColor:[Color white] rotation:0 origin:nil effects:SpriteEffectsNone layerDepth:0];
//                [spriteBatch draw:hpPool toRectangle:monster.hpArea fromRectangle:nil tintWithColor:[Color white] rotation:0 origin:nil effects:SpriteEffectsNone layerDepth:0];
//            }
        }
        
        // check if is projectile
//        Projectile *projectile = [item isKindOfClass:[Projectile class]] ? (Projectile *)item : nil;
//        if (projectile) {
//            if ([projectile.sender isKindOfClass:[KnightBowman class]])
//                [spriteBatch draw:projectileArrow to:projectile.position fromRectangle:nil tintWithColor:[Color white] rotation:0 origin:[Vector2 vectorWithX:16 y:16] scaleUniform:2.0f effects:SpriteEffectsNone layerDepth:allyDepth];
//            else if ([projectile.sender isKindOfClass:[KnightFireEnchantress class]])
//                [spriteBatch draw:projectileFireBall to:projectile.position fromRectangle:nil tintWithColor:[Color white] rotation:0 origin:[Vector2 vectorWithX:16 y:16] scaleUniform:2.0f effects:SpriteEffectsNone layerDepth:allyDepth];
//        }
        
        // check if is dice
        Dice *diceItem = [item isKindOfClass:[Dice class]] ? (Dice *) item : nil;
        
        if (diceItem) {
            
            if (diceItem.state == DiceStateRolling) {
                Sprite *tempSprite = [diceItem.animation spriteWithElapsedTime:gameTime.elapsedGameTime];
                [spriteBatch draw:tempSprite.texture to:diceItem.position fromRectangle:tempSprite.sourceRectangle tintWithColor:[Color white] rotation:diceItem.rotationAngle origin:tempSprite.origin scaleUniform:diceItem.altitude effects:SpriteEffectsNone layerDepth:0];
            } else {
                [spriteBatch draw:diceItem.sprite.texture to:diceItem.position fromRectangle:diceItem.sprite.sourceRectangle tintWithColor:[Color white] rotation:diceItem.rotationAngle origin:diceItem.sprite.origin scaleUniform:diceItem.altitude effects:SpriteEffectsNone layerDepth:0];
                
                [spriteBatch draw:diceItem.border.texture to:diceItem.position fromRectangle:diceItem.border.sourceRectangle tintWithColor:[Color white] rotation:diceItem.rotationAngle origin:diceItem.border.origin scaleUniform:diceItem.altitude effects:SpriteEffectsNone layerDepth:0];
            }
            
//            AnimatedSprite *diceAnim = nil;
//            Sprite *diceSymbol = nil;
//            Sprite *diceBorder = nil;
//            Dice *dice = nil;
            
//            if ([diceItem isKindOfClass:[Dice class]]) {
//                dice = (Dice *) diceItem;
//                // check if dice is still rolling
//                if (dice.state == DiceStateRolling) {
//                    if (dice.frameType == DiceFrameTypeGood) {
//                        diceAnim = diceGoodAnim;
//                    } else if (dice.frameType == DiceFrameTypeEvil) {
//                        diceAnim = diceEvilAnim;
//                    }
//                } else {
//                    diceSymbol = diceSymbols[dice.type];
//                    diceBorder = diceFrames[dice.frameType];
//                }
//            }
            
//            if (diceAnim) {
//                // rolling
//                Sprite *currentSprite = [diceAnim spriteAtTime:gameTime.totalGameTime];
//                [spriteBatch draw:currentSprite.texture to:dice.position fromRectangle:currentSprite.sourceRectangle tintWithColor:[Color white]
//                         rotation:dice.rotationAngle origin:currentSprite.origin scaleUniform:dice.altitude effects:SpriteEffectsNone layerDepth:0];
//            } else if (diceSymbol && diceBorder) {
//                // not rolling
//                [spriteBatch draw:diceBorder.texture to:dice.position fromRectangle:diceBorder.sourceRectangle tintWithColor:[Color white]
//                         rotation:dice.rotationAngle origin:diceBorder.origin scaleUniform:dice.altitude effects:SpriteEffectsNone layerDepth:0];
//
//                [spriteBatch draw:diceSymbol.texture to:dice.position fromRectangle:diceSymbol.sourceRectangle tintWithColor:[Color white]
//                         rotation:dice.rotationAngle origin:diceSymbol.origin scaleUniform:dice.altitude effects:SpriteEffectsNone layerDepth:0];
//            }
        }
    }
    
    // end
    [spriteBatch end];
    
//    // check if entities are dead
//    for (int i = 0; i < CombatPositions; i++) {
//        BOOL reseted = NO;
//        Knight *knight = [gameplay.currentLevel.battlefield getAllyAtPosition:i];
//        if (knight && knight.isDead) {
//            if (![allyDeathSprites[knight.type] isAlive]) {
//                reseted = YES;
//                [gameplay.currentLevel.battlefield removeAlly:knight];
//                break;
//            }
//        }
//
//        if (reseted)
//            [allyDeathSprites[knight.type] reset];
//
//        reseted = NO;
//
//        Monster *monster = [gameplay.currentLevel.battlefield getEnemyAtPosition:i];
//        if (monster && monster.isDead) {
//            if (![enemyDeathSprites[i] isAlive]) {
//                reseted = YES;
//                [gameplay.currentLevel.battlefield removeEnemy:monster];
//                break;
//            }
//        }
//
//        if (reseted)
//            [enemyDeathSprites[i] reset];
//    }
}





//- (void) loadAnimationsOfAlly:(KnightType)ally {
//    int idleFrames = 6, moveFrames = 14, hitFrames = 20, deathFrames = 31, attackFrames = 0;
//    int idleDuration = 6, moveDuration = 8, hitDuration = 6, deathDuration = 11, attackDuration = 0;
//    switch (ally) {
//        case KnightTypeBrawler:
//            attackFrames = 37;
//            attackDuration = 6;
//            break;
//
//        case KnightTypeLongbowman:
//            attackFrames = 37;
//            attackDuration = 6;
//            break;
//
//        case KnightTypePaladin:
//            attackFrames = 36;
//            attackDuration = 5;
//            break;
//
//        case KnightTypeWizard:
//            moveFrames = 6;
//            moveDuration = 1;
//            hitFrames = 12;
//            deathFrames = 23;
//            attackFrames = 34;
//            attackDuration = 11;
//            break;
//
//        default:
//            break;
//    }
//
//    int num = 0;
//
//    // idle animation
//    allyIdleSprites[ally] = [[AnimatedSprite alloc] initWithDuration:0.5f];
//    allyIdleSprites[ally].looping = NO;
//
//    for (int i = 0; i < idleFrames; i++) {
//        int x = i % 8;
//        int y = i / 8;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = allyTextures[ally];
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
//        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:allyIdleSprites[ally].duration * (float) num / idleDuration];
//        [allyIdleSprites[ally] addFrame:frame];
//
//        num++;
//    }
//
//    allyIdleSprites[ally].looping = YES;
//    num = 0;
//
//    // move animation
//    allyMoveSprites[ally] = [[AnimatedSprite alloc] initWithDuration:0.5f];
//    allyMoveSprites[ally].looping = NO;
//
//    for (int i = idleFrames; i < moveFrames; i++) {
//        int x = i % 8;
//        int y = i / 8;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = allyTextures[ally];
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
//        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:allyMoveSprites[ally].duration * (float) num / moveDuration];
//        [allyMoveSprites[ally] addFrame:frame];
//
//        num++;
//    }
//
//    allyMoveSprites[ally].looping = YES;
//    num = 0;
//
//    // hit animation
//    allyHitSprites[ally] = [[AnimatedSprite alloc] initWithDuration:0.4f];
//    allyHitSprites[ally].looping = NO;
//
//    for (int i = moveFrames; i < hitFrames; i++) {
//        int x = i % 8;
//        int y = i / 8;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = allyTextures[ally];
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
//        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:allyHitSprites[ally].duration * (float) num / hitDuration];
//        [allyHitSprites[ally] addFrame:frame];
//
//        num++;
//    }
//    num = 0;
//
//    // death animation
//    allyDeathSprites[ally] = [[AnimatedSprite alloc] initWithDuration:1];
//    allyDeathSprites[ally].looping = NO;
//
//    for (int i = hitFrames; i < deathFrames; i++) {
//        int x = i % 8;
//        int y = i / 8;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = allyTextures[ally];
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
//        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:allyDeathSprites[ally].duration * (float) num / deathDuration];
//        [allyDeathSprites[ally] addFrame:frame];
//
//        num++;
//    }
//    num = 0;
//
//    // attack animation
//    allyAttackSprites[ally] = [[AnimatedSprite alloc] initWithDuration:1];
//    allyAttackSprites[ally].looping = NO;
//
//    for (int i = deathFrames; i < attackFrames; i++) {
//        int x = i % 8;
//        int y = i / 8;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = allyTextures[ally];
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
//        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:allyAttackSprites[ally].duration * (float) num / attackDuration];
//        [allyAttackSprites[ally] addFrame:frame];
//
//        num++;
//    }
//
//    allyAttackSprites[ally].looping = YES;
//    num = 0;
//}
//
//
//- (void) loadTextureOfEnemy:(MonsterType)enemy {
//    switch (enemy) {
//        case MonsterTypeWarrior:
//            enemyTextures[enemy] = [self.game.content load:ENEMY_SWORDSMAN];
//            break;
//
//        case MonsterTypeBrute:
//            enemyTextures[enemy] = [self.game.content load:ENEMY_BRUTE];
//            break;
//
//        case MonsterTypeBossViking:
//            enemyTextures[enemy] = [self.game.content load:ENEMY_VIKING_BOSS];
//            break;
//
//        default:
//            break;
//    }
//}
//
//- (void) loadAnimationsOfEnemy:(Monster *)enemy combatPosition:(CombatPosition)pos {
//    int idleFrames = 0, moveFrames = 0, hitFrames = 0, deathFrames = 0, attackFrames = 0;
//    int idleDuration = 0, moveDuration = 0, hitDuration = 0, deathDuration = 0, attackDuration = 0;
//    switch (enemy.type) {
//        case MonsterTypeWarrior:
//            idleFrames = 4;
//            idleDuration = 4;
//            moveFrames = 12;
//            moveDuration = 8;
//            hitFrames = 16;
//            hitDuration = 4;
//            deathFrames = 39;
//            deathDuration = 23;
//            attackFrames = 47;
//            attackDuration = 8;
//            break;
//
//        case MonsterTypeBrute:
//            idleFrames = 6;
//            idleDuration = 6;
//            moveFrames = 14;
//            moveDuration = 8;
//            hitFrames = 18;
//            hitDuration = 4;
//            deathFrames = 37;
//            deathDuration = 19;
//            attackFrames = 47;
//            attackDuration = 10;
//            break;
//
//        case MonsterTypeBossViking:
//            idleFrames = 4;
//            idleDuration = 4;
//            moveFrames = 12;
//            moveDuration = 8;
//            hitFrames = 17;
//            hitDuration = 5;
//            deathFrames = 34;
//            deathDuration = 17;
//            attackFrames = 45;
//            attackDuration = 11;
//            break;
//
//        default:
//            break;
//    }
//
//    int num = 0;
//
//    // idle animation
//    enemyIdleSprites[pos] = [[AnimatedSprite alloc] initWithDuration:0.7f];
//    enemyIdleSprites[pos].looping = NO;
//
//    for (int i = 0; i < idleFrames; i++) {
//        int x = i % 8;
//        int y = i / 8;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = enemyTextures[enemy.type];
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
//        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:enemyIdleSprites[pos].duration * (float) num / idleDuration];
//        [enemyIdleSprites[pos] addFrame:frame];
//
//        num++;
//    }
//
//    enemyIdleSprites[pos].looping = YES;
//    num = 0;
//
//    // move animation
//    enemyMoveSprites[pos] = [[AnimatedSprite alloc] initWithDuration:0.7f];
//    enemyMoveSprites[pos].looping = NO;
//
//    for (int i = idleFrames; i < moveFrames; i++) {
//        int x = i % 8;
//        int y = i / 8;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = enemyTextures[enemy.type];
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
//        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:enemyMoveSprites[pos].duration * (float) num / moveDuration];
//        [enemyMoveSprites[pos] addFrame:frame];
//
//        num++;
//    }
//
//    enemyMoveSprites[pos].looping = YES;
//    num = 0;
//
//    // hit animation
//    enemyHitSprites[pos] = [[AnimatedSprite alloc] initWithDuration:0.4f];
//    enemyHitSprites[pos].looping = NO;
//
//    for (int i = moveFrames; i < hitFrames; i++) {
//        int x = i % 8;
//        int y = i / 8;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = enemyTextures[enemy.type];
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
//        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:enemyHitSprites[pos].duration * (float) num / hitDuration];
//        [enemyHitSprites[pos] addFrame:frame];
//
//        num++;
//    }
//    num = 0;
//
//    // death animation
//    enemyDeathSprites[pos] = [[AnimatedSprite alloc] initWithDuration:2];
//    enemyDeathSprites[pos].looping = NO;
//
//    for (int i = hitFrames; i < deathFrames; i++) {
//        int x = i % 8;
//        int y = i / 8;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = enemyTextures[enemy.type];
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
//        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:enemyDeathSprites[pos].duration * (float) num / deathDuration];
//        [enemyDeathSprites[pos] addFrame:frame];
//
//        num++;
//    }
//    num = 0;
//
//    // attack animation
//    enemyAttackSprites[pos] = [[AnimatedSprite alloc] initWithDuration:1];
//    enemyAttackSprites[pos].looping = NO;
//
//    for (int i = deathFrames; i < attackFrames; i++) {
//        int x = i % 8;
//        int y = i / 8;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = enemyTextures[enemy.type];
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
//        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:enemyAttackSprites[pos].duration * (float) num / attackDuration];
//        [enemyAttackSprites[pos] addFrame:frame];
//
//        num++;
//    }
//
//    enemyAttackSprites[pos].looping = YES;
//    num = 0;
//}
//
//
//- (void) loadAnimationsOfEnemyBossAtPosition:(CombatPosition)pos {
//    // load boss sprites
//    bossIdle = [self.game.content load:@"boss_idle"];
//    bossMove = [self.game.content load:@"boss_move"];
//    bossHit = [self.game.content load:@"boss_hit"];
//    bossDeath = [self.game.content load:@"boss_death"];
//    bossAttack = [self.game.content load:@"boss_attack"];
//
//    // idle boss
//    enemyIdleSprites[pos] = [[AnimatedSprite alloc] initWithDuration:1];
//    enemyIdleSprites[pos].looping = NO;
//
//    for (int i = 0; i < 4; i++) {
//        int x = i % 4;
//        int y = i / 4;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = bossIdle;
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:42 * x y:42 * y width:42 height:42];
//        frameSprite.origin = [Vector2 vectorWithX:21 y:21];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:enemyIdleSprites[pos].duration * (float) i / 4];
//        [enemyIdleSprites[pos] addFrame:frame];
//    }
//
//    enemyIdleSprites[pos].looping = YES;
//
//    // move boss
//    enemyMoveSprites[pos] = [[AnimatedSprite alloc] initWithDuration:0.7f];
//    enemyMoveSprites[pos].looping = NO;
//
//    for (int i = 0; i < 8; i++) {
//        int x = i % 8;
//        int y = i / 8;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = bossMove;
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:42 * x y:42 * y width:42 height:42];
//        frameSprite.origin = [Vector2 vectorWithX:21 y:21];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:enemyMoveSprites[pos].duration * (float) i / 8];
//        [enemyMoveSprites[pos] addFrame:frame];
//    }
//
//    enemyMoveSprites[pos].looping = YES;
//
//    // hit boss
//    enemyHitSprites[pos] = [[AnimatedSprite alloc] initWithDuration:0.3f];
//    enemyHitSprites[pos].looping = NO;
//
//    for (int i = 0; i < 7; i++) {
//        int x = i % 7;
//        int y = i / 7;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = bossHit;
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:42 * x y:42 * y width:42 height:42];
//        frameSprite.origin = [Vector2 vectorWithX:21 y:21];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:enemyHitSprites[pos].duration * (float) i / 7];
//        [enemyHitSprites[pos] addFrame:frame];
//    }
//
//    // death boss
//    enemyDeathSprites[pos] = [[AnimatedSprite alloc] initWithDuration:2];
//    enemyDeathSprites[pos].looping = NO;
//
//    for (int i = 0; i < 9; i++) {
//        int x = i % 9;
//        int y = i / 9;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = bossDeath;
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:42 * x y:42 * y width:42 height:42];
//        frameSprite.origin = [Vector2 vectorWithX:21 y:21];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:enemyDeathSprites[pos].duration * (float) i / 9];
//        [enemyDeathSprites[pos] addFrame:frame];
//    }
//
//
//    // attack boss
//    enemyAttackSprites[pos] = [[AnimatedSprite alloc] initWithDuration:1];
//    enemyAttackSprites[pos].looping = NO;
//
//    for (int i = 0; i < 10; i++) {
//        int x = i % 10;
//        int y = i / 10;
//        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
//        frameSprite.texture = bossAttack;
//        frameSprite.sourceRectangle = [Rectangle rectangleWithX:80 * x y:42 * y width:80 height:42];
//        frameSprite.origin = [Vector2 vectorWithX:40 y:21];
//
//        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:enemyAttackSprites[pos].duration * (float) i / 10];
//        [enemyAttackSprites[pos] addFrame:frame];
//    }
//
//    enemyAttackSprites[pos].looping = YES;
//}



/*
    UNLOAD CONTENT
*/
- (void) unloadContent {
    [spriteBatch release];
    
//    for (int i = 0; i < KnightTypes; i++) {
//        [allyTextures[i] release];
//        [allyIdleSprites[i] release];
//        [allyHitSprites[i] release];
//        [allyMoveSprites[i] release];
//        [allyDeathSprites[i] release];
//        [allyAttackSprites[i] release];
//        [portraits[i] release];
//        [basicAttackSprites[i] release];
//        [firstComboSkillSprites[i] release];
//        [secondComboSkillSprites[i] release];
//        [thirdComboSkillSprites[i] release];
//    }
    
    
    
//    for (int i = 0; i < MonsterTypes; i++) {
//        [enemyTextures[i] release];
//        [enemyIdleSprites[i] release];
//        [enemyHitSprites[i] release];
//        [enemyMoveSprites[i] release];
//        [enemyDeathSprites[i] release];
//        [enemyAttackSprites[i] release];
//    }
//
//    for (int i = 0; i < LevelTypes; i++) {
//        [levelBackgrounds[i] release];
//    }
//
//    [hud release];
//    [hudWaveCounter release];
//    [diceSymbolTexture release];
//    [diceGoodAnimTexture release];
//    [diceEvilAnimTexture release];
//
//    for (int i = 0; i < StatTypes; i++) {
//        [diceSymbols[i] release];
//    }
//
//    for (int i = 0; i < DiceFrameTypes; i++) {
//        [diceFrames[i] release];
//    }
//
//    [diceGoodAnim release];
//    [diceEvilAnim release];
//
//    [portraitTexture release];
}



/*
    DEALLOC
*/
- (void) dealloc {
    [camera release];
    
    [super dealloc];
}

@end
