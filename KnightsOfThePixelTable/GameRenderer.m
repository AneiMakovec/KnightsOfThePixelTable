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

- (id) initWithGame:(Game *)theGame gameplay:(Gameplay *)theGameplay {
    self = [super initWithGame:theGame];
    if (self != nil) {
        gameplay = theGameplay;
    }
    return self;
}

@synthesize camera;



/*
    INITIALIZE
*/
- (void) initialize {
//    // create the camera on which the graphics will be displayed
//    float scaleX = (float)self.game.gameWindow.clientBounds.width / (float)[TextureStretcher getScreenBounds].width;
//    float scaleY = (float)self.game.gameWindow.clientBounds.height / (float)[TextureStretcher getScreenBounds].height;
//    camera = [[Matrix createScale:[Vector3 vectorWithX:scaleX y:scaleY z:1]] retain];
    
    camera = [ScreenComponent getCamera];
    
    
//    // calculate hud offset and init the stretchers
    hudOffset = [ScreenComponent getScreenBounds].height * 0.625;
//    backgroundStretch = [[TextureStretcher alloc] initFromWidth:256.0f fromHeight:80.0f toWidth:(float)gameplay.currentLevel.bounds.width toHeight:(float)hudOffset xOffset:0 yOffset:0];
//    hudStretch = [[TextureStretcher alloc] initFromWidth:256.0f fromHeight:48.0f toWidth:(float)gameplay.currentLevel.bounds.width toHeight:(float)gameplay.currentLevel.bounds.height - (float) hudOffset xOffset:0 yOffset:hudOffset];
    
    
//    // set and stretch the position of portraits
//    for (int i = 0; i < CombatPositions; i++) {
//        portraitAreas[i] = [[Rectangle alloc] initWithX:[Constants portraitXOfAlly:i] y:[Constants portraitYOfAlly:i] width:[Constants portraitSize] height:[Constants portraitSize]];
//        [hudStretch scaleRectangle:portraitAreas[i]];
//    }
//    Vector2 *portraitSize = [[Vector2 alloc] init];
//    portraitSize.x = 14;
//    portraitSize.y = 14;
//    [hudStretch scaleSize:portraitSize];
//
//    portraitPositions[FirstCombatPosition].x = 85;
//    portraitPositions[FirstCombatPosition].y = 6;
//    [hudStretch scalePosition:portraitPositions[FirstCombatPosition]];
//
//    portraitPositions[SecondCombatPosition].x = 85;
//    portraitPositions[SecondCombatPosition].y = 28;
//    [hudStretch scalePosition:portraitPositions[SecondCombatPosition]];
//
//    portraitPositions[ThirdCombatPosition].x = 7;
//    portraitPositions[ThirdCombatPosition].y = 6;
//    [hudStretch scalePosition:portraitPositions[ThirdCombatPosition]];
//
//    portraitPositions[FourthCombatPosition].x = 7;
//    portraitPositions[FourthCombatPosition].y = 28;
//    [hudStretch scalePosition:portraitPositions[FourthCombatPosition]];

    
//    // release the stretchers as we dont need them anymore
//    [backgroundStretch release];
//    [hudStretch release];
    
    [super initialize];
}




/*
    LOAD CONTENT
*/
- (void) loadContent {
    spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
    
    // Backgrounds
    //levelBackgrounds[LevelTypeFinal] = [self.game.content load:AREA_FARMLANDS];
    //levelBackgrounds[LevelTypeSeashore] = [self.game.content load:AREA_FARMLANDS];
    levelBackgrounds[LevelTypeFarmlands] = [self.game.content load:AREA_FARMLANDS];
    levelBackgrounds[LevelTypeMountains] = [self.game.content load:AREA_MOUNTAINS];
    levelBackgrounds[LevelTypePinewoods] = [self.game.content load:AREA_PINEWOODS];
    
    // HUD
    hud = [self.game.content load:HUD];
    
    // Hp and Exp pool
    hpPool = [self.game.content load:HP_POOL];
    
    // Dice textures
    diceSymbolTexture = [self.game.content load:DICE_SYMBOLS];
    diceGoodAnimTexture = [self.game.content load:DICE_ANIM_GOOD];
    diceEvilAnimTexture = [self.game.content load:DICE_ANIM_EVIL];
    
    // Dice symbols
    diceFrames[DiceFrameTypeGood] =[[Sprite alloc] init];
    diceFrames[DiceFrameTypeGood].texture = diceSymbolTexture;
    diceFrames[DiceFrameTypeGood].sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:32 height:32];
    diceFrames[DiceFrameTypeGood].origin = [Vector2 vectorWithX:16 y:16];
    
    diceFrames[DiceFrameTypeEvil] =[[Sprite alloc] init];
    diceFrames[DiceFrameTypeEvil].texture = diceSymbolTexture;
    diceFrames[DiceFrameTypeEvil].sourceRectangle = [Rectangle rectangleWithX:32 y:0 width:32 height:32];
    diceFrames[DiceFrameTypeEvil].origin = [Vector2 vectorWithX:16 y:16];
    
    diceSymbols[Agility] =[[Sprite alloc] init];
    diceSymbols[Agility].texture = diceSymbolTexture;
    diceSymbols[Agility].sourceRectangle = [Rectangle rectangleWithX:64 y:0 width:32 height:32];
    diceSymbols[Agility].origin = [Vector2 vectorWithX:16 y:16];
    
    diceSymbols[Cunning] =[[Sprite alloc] init];
    diceSymbols[Cunning].texture = diceSymbolTexture;
    diceSymbols[Cunning].sourceRectangle = [Rectangle rectangleWithX:96 y:0 width:32 height:32];
    diceSymbols[Cunning].origin = [Vector2 vectorWithX:16 y:16];
    
    diceSymbols[Insight] =[[Sprite alloc] init];
    diceSymbols[Insight].texture = diceSymbolTexture;
    diceSymbols[Insight].sourceRectangle = [Rectangle rectangleWithX:0 y:32 width:32 height:32];
    diceSymbols[Insight].origin = [Vector2 vectorWithX:16 y:16];
    
    diceSymbols[Intelligence] =[[Sprite alloc] init];
    diceSymbols[Intelligence].texture = diceSymbolTexture;
    diceSymbols[Intelligence].sourceRectangle = [Rectangle rectangleWithX:32 y:32 width:32 height:32];
    diceSymbols[Intelligence].origin = [Vector2 vectorWithX:16 y:16];
    
    diceSymbols[Strength] =[[Sprite alloc] init];
    diceSymbols[Strength].texture = diceSymbolTexture;
    diceSymbols[Strength].sourceRectangle = [Rectangle rectangleWithX:64 y:32 width:32 height:32];
    diceSymbols[Strength].origin = [Vector2 vectorWithX:16 y:16];
    
    diceSymbols[Sturdiness] =[[Sprite alloc] init];
    diceSymbols[Sturdiness].texture = diceSymbolTexture;
    diceSymbols[Sturdiness].sourceRectangle = [Rectangle rectangleWithX:96 y:32 width:32 height:32];
    diceSymbols[Sturdiness].origin = [Vector2 vectorWithX:16 y:16];
    
    // Dice good animation
    diceGoodAnim = [[AnimatedSprite alloc] initWithDuration:1];
    diceGoodAnim.looping = NO;
    
    for (int i = 0; i < 8; i++) {
        int x = i % 4;
        int y = i / 4;
        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
        frameSprite.texture = diceGoodAnimTexture;
        frameSprite.sourceRectangle = [Rectangle rectangleWithX:32 * x y:32 * y width:32 height:32];
        frameSprite.origin = [Vector2 vectorWithX:16 y:16];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:diceGoodAnim.duration * (float) i / 8];
        [diceGoodAnim addFrame:frame];
    }
    
    diceGoodAnim.looping = YES;
    
    // Dice evil animation
    diceEvilAnim = [[AnimatedSprite alloc] initWithDuration:1];
    diceEvilAnim.looping = NO;
    
    for (int i = 0; i < 8; i++) {
        int x = i % 4;
        int y = i / 4;
        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
        frameSprite.texture = diceEvilAnimTexture;
        frameSprite.sourceRectangle = [Rectangle rectangleWithX:32 * x y:32 * y width:32 height:32];
        frameSprite.origin = [Vector2 vectorWithX:16 y:16];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:diceEvilAnim.duration * (float) i / 8];
        [diceEvilAnim addFrame:frame];
    }
    
    diceEvilAnim.looping = YES;
    
    
    // characters - GOOD textures
    allyTexturesIdle[FirstCombatPosition] = [self.game.content load:LANCELOT_IDLE];
    allyTexturesIdle[SecondCombatPosition] = [self.game.content load:PALADIN_IDLE];
    allyTexturesIdle[ThirdCombatPosition] = [self.game.content load:KNIGHT_IDLE];
    allyTexturesIdle[FourthCombatPosition] = [self.game.content load:LANCELOT_IDLE];
    
    // chareacters - GOOD animations
    // first ally
    allySprites[FirstCombatPosition] = [[AnimatedSprite alloc] initWithDuration:0.7f];
    allySprites[FirstCombatPosition].looping = NO;
    
    for (int i = 0; i < 6; i++) {
        int x = i % 2;
        int y = i / 2;
        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
        frameSprite.texture = allyTexturesIdle[FirstCombatPosition];
        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:allySprites[FirstCombatPosition].duration * (float) i / 6];
        [allySprites[FirstCombatPosition] addFrame:frame];
    }
    
    allySprites[FirstCombatPosition].looping = YES;
    
    // second ally
    allySprites[SecondCombatPosition] = [[AnimatedSprite alloc] initWithDuration:0.7f];
    allySprites[SecondCombatPosition].looping = NO;
    
    for (int i = 0; i < 3; i++) {
        int x = i % 2;
        int y = i / 2;
        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
        frameSprite.texture = allyTexturesIdle[SecondCombatPosition];
        frameSprite.sourceRectangle = [Rectangle rectangleWithX:32 * x y:32 * y width:32 height:32];
        frameSprite.origin = [Vector2 vectorWithX:16 y:16];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:allySprites[SecondCombatPosition].duration * (float) i / 3];
        [allySprites[SecondCombatPosition] addFrame:frame];
    }
    
    allySprites[SecondCombatPosition].looping = YES;
    
    // third ally
    allySprites[ThirdCombatPosition] = [[AnimatedSprite alloc] initWithDuration:0.7f];
    allySprites[ThirdCombatPosition].looping = NO;
    
    for (int i = 0; i < 4; i++) {
        int x = i % 2;
        int y = i / 2;
        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
        frameSprite.texture = allyTexturesIdle[ThirdCombatPosition];
        frameSprite.sourceRectangle = [Rectangle rectangleWithX:32 * x y:32 * y width:32 height:32];
        frameSprite.origin = [Vector2 vectorWithX:16 y:16];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:allySprites[ThirdCombatPosition].duration * (float) i / 4];
        [allySprites[ThirdCombatPosition] addFrame:frame];
    }
    
    allySprites[ThirdCombatPosition].looping = YES;
    
    // fourth ally
    allySprites[FourthCombatPosition] = [[AnimatedSprite alloc] initWithDuration:0.7f];
    allySprites[FourthCombatPosition].looping = NO;
    
    for (int i = 0; i < 6; i++) {
        int x = i % 2;
        int y = i / 2;
        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
        frameSprite.texture = allyTexturesIdle[FourthCombatPosition];
        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:allySprites[FourthCombatPosition].duration * (float) i / 6];
        [allySprites[FourthCombatPosition] addFrame:frame];
    }
    
    allySprites[FourthCombatPosition].looping = YES;
    
    // portraits
    portraitTexture = [self.game.content load:@"ui_icons"];
    
    for (int i = 0; i < CombatPositions; i++) {
        portraits[i] = [[Sprite alloc] init];
        portraits[i].texture = portraitTexture;
        portraits[i].sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:32 height:32];
        portraits[i].origin = [Vector2 vectorWithX:0 y:0];
        
    }
}





/*
    DRAW
*/
- (void) drawWithGameTime:(GameTime *)gameTime {
    [self.graphicsDevice clearWithColor:[Color darkRed]];
    
    [spriteBatch beginWithSortMode:SpriteSortModeTexture BlendState:nil SamplerState:[SamplerState pointClamp]
                 DepthStencilState:nil RasterizerState:nil Effect:nil TransformMatrix:camera];
    
    // backgorund
    [spriteBatch draw:levelBackgrounds[LevelTypeFarmlands] toRectangle:[Rectangle rectangleWithX:0 y:0 width:[ScreenComponent getScreenBounds].width height:hudOffset] tintWithColor:[Color white]];
    
    // hud
    [spriteBatch draw:hud toRectangle:[Rectangle rectangleWithX:0 y:hudOffset width:[ScreenComponent getScreenBounds].width height:[ScreenComponent getScreenBounds].height - hudOffset] tintWithColor:[Color white]];
    
    
    // scene items
    for (id item in gameplay.currentLevel.scene) {
        // check if is dice
        id<IDice> diceItem = [item conformsToProtocol:@protocol(IDice)] ? item : nil;
        
        if (diceItem) {
            AnimatedSprite *diceAnim = nil;
            Sprite *diceSymbol = nil;
            Sprite *diceBorder = nil;
            Dice *dice = nil;
            
            if ([diceItem isKindOfClass:[Dice class]]) {
                dice = (Dice *) diceItem;
                // check if dice is still rolling
                if (dice.state == DiceStateMoving) {
                    diceAnim = diceGoodAnim;
                } else {
                    diceSymbol = diceSymbols[dice.type];
                    diceBorder = diceFrames[dice.frameType];
                }
            }
            
            if (diceAnim) {
                // rolling
                Sprite *currentSprite = [diceAnim spriteAtTime:gameTime.totalGameTime];
                [spriteBatch draw:currentSprite.texture to:dice.position fromRectangle:currentSprite.sourceRectangle tintWithColor:[Color white]
                         rotation:dice.rotationAngle origin:currentSprite.origin scaleUniform:dice.altitude effects:SpriteEffectsNone layerDepth:0];
            } else if (diceSymbol && diceBorder) {
                // not rolling
                [spriteBatch draw:diceBorder.texture to:dice.position fromRectangle:diceBorder.sourceRectangle tintWithColor:[Color white]
                         rotation:dice.rotationAngle origin:diceBorder.origin scaleUniform:dice.altitude effects:SpriteEffectsNone layerDepth:0];
                
                [spriteBatch draw:diceSymbol.texture to:dice.position fromRectangle:diceSymbol.sourceRectangle tintWithColor:[Color white]
                         rotation:dice.rotationAngle origin:diceSymbol.origin scaleUniform:dice.altitude effects:SpriteEffectsNone layerDepth:0];
            }
        }
        
        // check if is knight entity
        Knight *knight = [item isKindOfClass:[Knight class]] ? (Knight *)item : nil;
        if (knight) {
            if (knight.type == KnightTypeLancelot) {
                // portrait
                Sprite *portrait = portraits[FirstCombatPosition];
                [spriteBatch draw:portrait.texture toRectangle:knight.portraitArea fromRectangle:portrait.sourceRectangle tintWithColor:[Color white]];
                
                // sprite
                Sprite *drawable = [allySprites[FirstCombatPosition] spriteAtTime:gameTime.totalGameTime];
                [spriteBatch draw:drawable.texture to:knight.position fromRectangle:drawable.sourceRectangle tintWithColor:[Color white] rotation:0 origin:drawable.origin scaleUniform:3.5f effects:SpriteEffectsNone layerDepth:0];
                
                // hp exp pool
                [spriteBatch draw:hpPool toRectangle:knight.hpPoolArea tintWithColor:[Color white]];
                
                // combo
                for (ComboSlot *comboSlot in knight.combo) {
                    if (comboSlot.item) {
                        [spriteBatch draw:diceSymbols[comboSlot.item.type].texture toRectangle:comboSlot.area fromRectangle:diceSymbols[comboSlot.item.type].sourceRectangle tintWithColor:[Color white]
                                 rotation:0 origin:diceSymbols[comboSlot.item.type].origin effects:SpriteEffectsNone layerDepth:0];
                    }
                }
            }
        }
        
        // check if is monster entity
        Monster *monster = [item isKindOfClass:[Monster class]] ? (Monster *)item : nil;
        if (monster) {
            // sprite
            Sprite *drawable = [allySprites[FirstCombatPosition] spriteAtTime:gameTime.totalGameTime];
            [spriteBatch draw:drawable.texture to:monster.position fromRectangle:drawable.sourceRectangle tintWithColor:[Color white] rotation:0 origin:drawable.origin scaleUniform:3.5f effects:SpriteEffectsFlipHorizontally layerDepth:0];
        }
    }
    
    [spriteBatch end];
}





/*
    UNLOAD CONTENT
*/
- (void) unloadContent {
    [spriteBatch release];
    
    for (int i = 0; i < CombatPositions; i++) {
        [allySprites[i] release];
        [portraits[i] release];
    }
    
    for (int i = 0; i < LevelTypes; i++) {
        [levelBackgrounds[i] release];
    }
    
    [hud release];
    [diceSymbolTexture release];
    [diceGoodAnimTexture release];
    [diceEvilAnimTexture release];
    
    for (int i = 0; i < StatTypes; i++) {
        [diceSymbols[i] release];
    }
    
    for (int i = 0; i < DiceFrameTypes; i++) {
        [diceFrames[i] release];
    }
    
    [diceGoodAnim release];
    [diceEvilAnim release];
    
    [portraitTexture release];
}



/*
    DEALLOC
*/
- (void) dealloc {
    [super dealloc];
}

@end
