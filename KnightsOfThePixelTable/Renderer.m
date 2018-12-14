//
//  Renderer.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Pixlron.Knights.h"
#import "Renderer.h"
#import "Retronator.Xni.Framework.Input.Touch.h"

@implementation Renderer

- (id) initWithGame:(Game *)theGame gameplay:(Gameplay *)theGameplay {
    self = [super initWithGame:theGame];
    if (self != nil) {
        gameplay = theGameplay;
        
        
        for (int i = 0; i < AllyPositions; i++) {
            allyPositions[i] = [[Vector2 alloc] init];
            portraitPositions[i] = [[Vector2 alloc] init];
        }
        portraitSize = [[Vector2 alloc] init];
    }
    return self;
}

@synthesize camera;

- (void) initialize {
    // create the camera on which the graphics will be displayed
    float scaleX = (float)self.game.gameWindow.clientBounds.width / (float)gameplay.currentLevel.bounds.width;
    float scaleY = (float)self.game.gameWindow.clientBounds.height / (float)gameplay.currentLevel.bounds.height;
    camera = [[Matrix createScale:[Vector3 vectorWithX:scaleX y:scaleY z:1]] retain];
    
    
    // calculate hud offset and init the stretchers
    hudOffset = gameplay.currentLevel.bounds.height * 0.625;
    backgroundStretch = [[TextureStretcher alloc] initFromWidth:256.0f fromHeight:80.0f toWidth:(float)gameplay.currentLevel.bounds.width toHeight:(float)hudOffset xOffset:0 yOffset:0];
    hudStretch = [[TextureStretcher alloc] initFromWidth:256.0f fromHeight:48.0f toWidth:(float)gameplay.currentLevel.bounds.width toHeight:(float)gameplay.currentLevel.bounds.height - (float) hudOffset xOffset:0 yOffset:hudOffset];
    
    
    // set and stretch the position of portraits
    portraitSize.x = 14;
    portraitSize.y = 14;
    [hudStretch scaleSize:portraitSize];
    
    portraitPositions[FirstAlly].x = 85;
    portraitPositions[FirstAlly].y = 6;
    [hudStretch scalePosition:portraitPositions[FirstAlly]];
    
    portraitPositions[SecondAlly].x = 85;
    portraitPositions[SecondAlly].y = 28;
    [hudStretch scalePosition:portraitPositions[SecondAlly]];
    
    portraitPositions[ThirdAlly].x = 7;
    portraitPositions[ThirdAlly].y = 6;
    [hudStretch scalePosition:portraitPositions[ThirdAlly]];
    
    portraitPositions[FourthAlly].x = 7;
    portraitPositions[FourthAlly].y = 28;
    [hudStretch scalePosition:portraitPositions[FourthAlly]];
    
    
    // set and stretch the position of ally entities
    allyPositions[FirstAlly].x = 77;
    allyPositions[FirstAlly].y = 46;
    [backgroundStretch scalePosition:allyPositions[FirstAlly]];
    
    allyPositions[SecondAlly].x = 64;
    allyPositions[SecondAlly].y = 62;
    [backgroundStretch scalePosition:allyPositions[SecondAlly]];
    
    allyPositions[ThirdAlly].x = 38;
    allyPositions[ThirdAlly].y = 46;
    [backgroundStretch scalePosition:allyPositions[ThirdAlly]];
    
    allyPositions[FourthAlly].x = 26;
    allyPositions[FourthAlly].y = 62;
    [backgroundStretch scalePosition:allyPositions[FourthAlly]];

    
    // release the stretchers as we dont need them anymore
    [backgroundStretch release];
    [hudStretch release];

    [super initialize];
}

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
    allyTexturesIdle[FirstAlly] = [self.game.content load:LANCELOT_IDLE];
    allyTexturesIdle[SecondAlly] = [self.game.content load:PALADIN_IDLE];
    allyTexturesIdle[ThirdAlly] = [self.game.content load:KNIGHT_IDLE];
    allyTexturesIdle[FourthAlly] = [self.game.content load:LANCELOT_IDLE];
    
    // chareacters - GOOD animations
    // first ally
    allySprites[FirstAlly] = [[AnimatedSprite alloc] initWithDuration:0.7f];
    allySprites[FirstAlly].looping = NO;
    
    for (int i = 0; i < 6; i++) {
        int x = i % 2;
        int y = i / 2;
        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
        frameSprite.texture = allyTexturesIdle[FirstAlly];
        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:allySprites[FirstAlly].duration * (float) i / 6];
        [allySprites[FirstAlly] addFrame:frame];
    }
    
    allySprites[FirstAlly].looping = YES;
    
    // second ally
    allySprites[SecondAlly] = [[AnimatedSprite alloc] initWithDuration:0.7f];
    allySprites[SecondAlly].looping = NO;
    
    for (int i = 0; i < 3; i++) {
        int x = i % 2;
        int y = i / 2;
        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
        frameSprite.texture = allyTexturesIdle[SecondAlly];
        frameSprite.sourceRectangle = [Rectangle rectangleWithX:32 * x y:32 * y width:32 height:32];
        frameSprite.origin = [Vector2 vectorWithX:16 y:16];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:allySprites[SecondAlly].duration * (float) i / 3];
        [allySprites[SecondAlly] addFrame:frame];
    }
    
    allySprites[SecondAlly].looping = YES;
    
    // third ally
    allySprites[ThirdAlly] = [[AnimatedSprite alloc] initWithDuration:0.7f];
    allySprites[ThirdAlly].looping = NO;
    
    for (int i = 0; i < 4; i++) {
        int x = i % 2;
        int y = i / 2;
        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
        frameSprite.texture = allyTexturesIdle[ThirdAlly];
        frameSprite.sourceRectangle = [Rectangle rectangleWithX:32 * x y:32 * y width:32 height:32];
        frameSprite.origin = [Vector2 vectorWithX:16 y:16];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:allySprites[ThirdAlly].duration * (float) i / 4];
        [allySprites[ThirdAlly] addFrame:frame];
    }
    
    allySprites[ThirdAlly].looping = YES;
    
    // fourth ally
    allySprites[FourthAlly] = [[AnimatedSprite alloc] initWithDuration:0.7f];
    allySprites[FourthAlly].looping = NO;
    
    for (int i = 0; i < 6; i++) {
        int x = i % 2;
        int y = i / 2;
        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
        frameSprite.texture = allyTexturesIdle[FourthAlly];
        frameSprite.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
        frameSprite.origin = [Vector2 vectorWithX:32 y:32];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:allySprites[FourthAlly].duration * (float) i / 6];
        [allySprites[FourthAlly] addFrame:frame];
    }
    
    allySprites[FourthAlly].looping = YES;
    
    // portraits
    portraitTexture = [self.game.content load:@"ui_icons"];
    
    for (int i = 0; i < AllyPositions; i++) {
        portraits[i] = [[Sprite alloc] init];
        portraits[i].texture = portraitTexture;
        portraits[i].sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:32 height:32];
        portraits[i].origin = [Vector2 vectorWithX:0 y:0];
        
    }
}

- (void) drawWithGameTime:(GameTime *)gameTime {
    [self.graphicsDevice clearWithColor:[Color darkRed]];
    
    [spriteBatch beginWithSortMode:SpriteSortModeTexture BlendState:nil SamplerState:[SamplerState pointClamp]
                 DepthStencilState:nil RasterizerState:nil Effect:nil TransformMatrix:camera];
    
    // backgorund
    [spriteBatch draw:levelBackgrounds[LevelTypeFarmlands] toRectangle:[Rectangle rectangleWithX:0 y:0 width:gameplay.currentLevel.bounds.width height:hudOffset] tintWithColor:[Color white]];
    
    // hud
    [spriteBatch draw:hud toRectangle:[Rectangle rectangleWithX:0 y:hudOffset width:gameplay.currentLevel.bounds.width height:gameplay.currentLevel.bounds.height - hudOffset] tintWithColor:[Color white]];
    
    // ally entities and portraits
    for (int i = 0; i < AllyPositions; i++) {
        Sprite *drawable = [allySprites[i] spriteAtTime:gameTime.totalGameTime];
        [spriteBatch draw:drawable.texture to:allyPositions[i] fromRectangle:drawable.sourceRectangle tintWithColor:[Color white] rotation:0 origin:drawable.origin scaleUniform:3.5f effects:SpriteEffectsNone layerDepth:0];
        
        [spriteBatch draw:portraits[i].texture toRectangle:[Rectangle rectangleWithX:portraitPositions[i].x y:portraitPositions[i].y width:portraitSize.x height:portraitSize.y] fromRectangle:portraits[i].sourceRectangle tintWithColor:[Color white]
                 rotation:0 origin:portraits[i].origin effects:SpriteEffectsNone layerDepth:0];
    }
    
    // dices
    for (id item in gameplay.currentLevel.scene) {
        id<IDice> diceItem = [item conformsToProtocol:@protocol(IDice)] ? item : nil;
        
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
    
    [spriteBatch end];
}

- (void) unloadContent {
    [spriteBatch release];
    
    for (int i = 0; i < AllyPositions; i++) {
        [allySprites[i] release];
        [portraits[i] release];
        [allyPositions[i] release];
        [portraitPositions[i] release];
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
    [portraitSize release];
}

- (void) dealloc {
    [camera release];
    [super dealloc];
}

@end
