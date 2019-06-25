//
//  TextureComponent.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 30/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "TextureComponent.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Constants.h"

TextureComponent *instance;

@implementation TextureComponent

+ (void) activateWithGame:(Game *)game {
    instance = [[TextureComponent alloc] initWithGame:game];
    [game.components addComponent:instance];
}

+ (void) deactivate {
    [instance.game.components removeComponent:instance];
    [instance release];
}

+ (AnimatedSprite *) getAnimationType:(EntityState)type forAlly:(KnightType)ally {
    return [instance getAnimationType:type forAlly:ally];
}

+ (AnimatedSprite *) getAnimationType:(EntityState)type forEnemy:(MonsterType)enemy {
    return [instance getAnimationType:type forEnemy:enemy];
}




- (void) initialize {
    // load textures
    
    //allies
    allyTextures[KnightTypeBrawler] = [self.game.content load:CHARACTER_BRAWLER];
    allyTextures[KnightTypeBowman] = [self.game.content load:CHARACTER_BOWMAN];
    allyTextures[KnightTypePaladin] = [self.game.content load:CHARACTER_PALADIN];
    allyTextures[KnightTypeFireEnchantress] = [self.game.content load:CHARACTER_FIRE_ENCHANTRESS];
    
    // enemies
    enemyTextures[MonsterTypeWarrior] = [self.game.content load:ENEMY_SWORDSMAN];
    enemyTextures[MonsterTypeBrute] = [self.game.content load:ENEMY_BRUTE];
    enemyTextures[MonsterTypeBossViking] = [self.game.content load:ENEMY_VIKING_BOSS];
}

- (AnimatedSprite *) getAnimationType:(EntityState)type forAlly:(KnightType)ally {
    AnimationType animType = -1;
    switch (type) {
        case EntityStateIdle:
            animType = AnimationTypeIdle;
            break;
            
        case EntityStateApproaching:
            animType = AnimationTypeMove;
            break;
            
        case EntityStateRetreating:
            animType = AnimationTypeMove;
            break;
            
        case EntityStateDefending:
            animType = AnimationTypeHit;
            break;
            
        case EntityStateDead:
            animType = AnimationTypeDeath;
            break;
            
        case EntityStateAttacking:
            animType = AnimationTypeAttack;
            break;
            
        case EntityStateStart:
            animType = AnimationTypeMove;
            break;
            
        default:
            break;
    }
    
    // calculate frame positions in spritesheet
    
    // start frame position
    int startFrame = [Constants framePositionForAnimation:animType - 1 ally:ally];
    if (startFrame < 0)
        startFrame = 0;
    
    // end frame position
    int endFrame = [Constants framePositionForAnimation:animType ally:ally];
    
    // number of frames in animation
    int numFrames = [Constants numFramesInAnimation:animType ally:ally];
    
    // duration of animation
    float duration = [Constants durationOfAnimation:animType ally:ally];
    
    // width of spritesheet in frames
    int spritesheetWidth = [Constants spritesheetWidthOfAlly:ally];
    
    // width and height of frame
    int frameWidth = [Constants frameWidthOfAnimation:animType ally:ally];
    int frameHeight = [Constants frameHeightOfAnimation:animType ally:ally];
    
    // serial frame number
    int num = 0;
    
    // idle animation
    AnimatedSprite *animation = [[[AnimatedSprite alloc] initWithDuration:duration] autorelease];
    animation.looping = NO;
    
    for (int i = startFrame; i < endFrame; i++) {
        int x = i % spritesheetWidth;
        int y = i / spritesheetWidth;
        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
        frameSprite.texture = allyTextures[ally];
        frameSprite.sourceRectangle = [Rectangle rectangleWithX:frameWidth * x y:frameHeight * y width:frameWidth height:frameHeight];
        frameSprite.origin = [Vector2 vectorWithX:frameWidth/2 y:frameHeight/2];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:animation.duration * (float) num / numFrames];
        [animation addFrame:frame];
        
        num++;
    }
    
    if (animType == AnimationTypeIdle || animType == AnimationTypeMove)
        animation.looping = YES;
    
    return animation;
}

- (AnimatedSprite *) getAnimationType:(EntityState)type forEnemy:(MonsterType)enemy {
    AnimationType animType = -1;
    switch (type) {
        case EntityStateIdle:
            animType = AnimationTypeIdle;
            break;
            
        case EntityStateApproaching:
            animType = AnimationTypeMove;
            break;
            
        case EntityStateRetreating:
            animType = AnimationTypeMove;
            break;
            
        case EntityStateDefending:
            animType = AnimationTypeHit;
            break;
            
        case EntityStateDead:
            animType = AnimationTypeDeath;
            break;
            
        case EntityStateAttacking:
            animType = AnimationTypeAttack;
            break;
            
        case EntityStateStart:
            animType = AnimationTypeMove;
            break;
            
        default:
            break;
    }
    
    // calculate frame positions in spritesheet
    
    // start frame position
    int startFrame = [Constants framePositionForAnimation:animType - 1 enemy:enemy];
    if (startFrame < 0)
        startFrame = 0;
    
    // end frame position
    int endFrame = [Constants framePositionForAnimation:animType enemy:enemy];
    
    // number of frames in animation
    int numFrames = [Constants numFramesInAnimation:animType enemy:enemy];
    
    // duration of animation
    float duration = [Constants durationOfAnimation:animType enemy:enemy];
    
    // width of spritesheet in frames
    int spritesheetWidth = [Constants spritesheetWidthOfEnemy:enemy];
    
    // width and height of frame
    int frameWidth = [Constants frameWidthOfAnimation:animType enemy:enemy];
    int frameHeight = [Constants frameHeightOfAnimation:animType enemy:enemy];
    
    // serial frame number
    int num = 0;
    
    // idle animation
    AnimatedSprite *animation = [[[AnimatedSprite alloc] initWithDuration:duration] autorelease];
    animation.looping = NO;
    
    for (int i = startFrame; i < endFrame; i++) {
        int x = i % spritesheetWidth;
        int y = i / spritesheetWidth;
        Sprite *frameSprite = [[[Sprite alloc] init] autorelease];
        frameSprite.texture = enemyTextures[enemy];
        frameSprite.sourceRectangle = [Rectangle rectangleWithX:frameWidth * x y:frameHeight * y width:frameWidth height:frameHeight];
        frameSprite.origin = [Vector2 vectorWithX:frameWidth/2 y:frameHeight/2];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:animation.duration * (float) num / numFrames];
        [animation addFrame:frame];
        
        num++;
    }
    
    if (animType == AnimationTypeIdle || animType == AnimationTypeMove)
        animation.looping = YES;
    
    return animation;
}


- (void) dealloc {
    for (int i = 0; i < KnightTypes; i++) {
        [allyTextures[i] release];
    }
    
    for (int i = 0; i < MonsterTypes; i++) {
        [enemyTextures[i] release];
    }
    
    [super dealloc];
}

@end
