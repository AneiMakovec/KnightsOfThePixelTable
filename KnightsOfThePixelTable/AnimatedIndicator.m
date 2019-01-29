//
//  AnimatedIndicator.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 18/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "AnimatedIndicator.h"

#import "Pixlron.Knights.h"

@implementation AnimatedIndicator

- (id) initWithTexture:(Texture2D *)theTexture position:(Vector2*)thePosition duration:(NSTimeInterval)theDuration {
    self = [super init];
    if (self != nil) {
        texture = [theTexture retain];
        duration = theDuration;
        position = [thePosition retain];
        
        animation = [[AnimatedImage alloc] initWithDuration:duration];

        target = nil;
    }
    return self;
}

@synthesize scene;



- (void) loadHitAnimation {
    animation.looping = NO;
    
    for (int i = 0; i < 5; i++) {
        int x = i % 5;
        int y = i / 5;
        Image *frameImage = [[Image alloc] initWithTexture:texture position:position];
        frameImage.sourceRectangle = [Rectangle rectangleWithX:16 * x y:16 * y width:16 height:16];
        frameImage.origin = [Vector2 vectorWithX:8 y:8];
        [frameImage setScaleUniform:3.0f];
        
        AnimatedImageFrame *frame = [AnimatedImageFrame frameWithImage:frameImage start:animation.duration * (float) i / 5];
        [animation addFrame:frame];
        [frameImage release];
    }
}

- (void) loadHealAnimation {
    animation.looping = NO;
    
    for (int i = 0; i < 7; i++) {
        int x = i % 7;
        int y = i / 7;
        Image *frameImage = [[Image alloc] initWithTexture:texture position:position];
        frameImage.sourceRectangle = [Rectangle rectangleWithX:32 * x y:32 * y width:32 height:32];
        frameImage.origin = [Vector2 vectorWithX:16 y:16];
        [frameImage setScaleUniform:3.0f];
        
        AnimatedImageFrame *frame = [AnimatedImageFrame frameWithImage:frameImage start:animation.duration * (float) i / 7];
        [animation addFrame:frame];
        [frameImage release];
    }
}

- (void) loadStunAnimationWithTarget:(CombatEntity *)theTarget {
    target = theTarget;
    
    animation.looping = NO;
    
    for (int i = 0; i < 3; i++) {
        int x = i % 3;
        int y = i / 3;
        Image *frameImage = [[Image alloc] initWithTexture:texture position:position];
        frameImage.sourceRectangle = [Rectangle rectangleWithX:32 * x y:32 * y width:32 height:32];
        frameImage.origin = [Vector2 vectorWithX:16 y:16];
        [frameImage setScaleUniform:3.0f];
        
        AnimatedImageFrame *frame = [AnimatedImageFrame frameWithImage:frameImage start:animation.duration * (float) i / 3];
        [animation addFrame:frame];
        [frameImage release];
    }
    
    animation.looping = YES;
}

- (void) loadBleedAnimation {
    animation.looping = NO;
    
    for (int i = 0; i < 7; i++) {
        int x = i % 7;
        int y = i / 7;
        Image *frameImage = [[Image alloc] initWithTexture:texture position:position];
        frameImage.sourceRectangle = [Rectangle rectangleWithX:64 * x y:64 * y width:64 height:64];
        frameImage.origin = [Vector2 vectorWithX:32 y:32];
        [frameImage setScaleUniform:2.0f];
        
        AnimatedImageFrame *frame = [AnimatedImageFrame frameWithImage:frameImage start:animation.duration * (float) i / 7];
        [animation addFrame:frame];
        [frameImage release];
    }
}

- (void) loadPoisonAnimation {
    animation.looping = NO;
    
    for (int i = 0; i < 9; i++) {
        int x = i % 9;
        int y = i / 9;
        Image *frameImage = [[Image alloc] initWithTexture:texture position:position];
        frameImage.sourceRectangle = [Rectangle rectangleWithX:32 * x y:32 * y width:32 height:32];
        frameImage.origin = [Vector2 vectorWithX:16 y:16];
        [frameImage setScaleUniform:3.0f];
        
        AnimatedImageFrame *frame = [AnimatedImageFrame frameWithImage:frameImage start:animation.duration * (float) i / 9];
        [animation addFrame:frame];
        [frameImage release];
    }
}

- (void) loadBurnAnimation {
    animation.looping = NO;
    
    for (int i = 0; i < 49; i++) {
        int x = i % 7;
        int y = i / 7;
        Image *frameImage = [[Image alloc] initWithTexture:texture position:position];
        frameImage.sourceRectangle = [Rectangle rectangleWithX:100 * x y:100 * y width:100 height:100];
        frameImage.origin = [Vector2 vectorWithX:50 y:50];
        [frameImage setScaleUniform:1.5f];
        
        AnimatedImageFrame *frame = [AnimatedImageFrame frameWithImage:frameImage start:animation.duration * (float) i / 49];
        [animation addFrame:frame];
        [frameImage release];
    }
}

- (void) loadFrostbiteAnimation {
    animation.looping = NO;
    
    for (int i = 0; i < 86; i++) {
        int x = i % 7;
        int y = i / 7;
        Image *frameImage = [[Image alloc] initWithTexture:texture position:position];
        frameImage.sourceRectangle = [Rectangle rectangleWithX:100 * x y:100 * y width:100 height:100];
        frameImage.origin = [Vector2 vectorWithX:50 y:50];
        
        AnimatedImageFrame *frame = [AnimatedImageFrame frameWithImage:frameImage start:animation.duration * (float) i / 86];
        [animation addFrame:frame];
        [frameImage release];
    }
}

- (void) loadBuffAnimation {
    animation.looping = NO;
    
    for (int i = 0; i < 4; i++) {
        int x = i % 4;
        int y = i / 4;
        Image *frameImage = [[Image alloc] initWithTexture:texture position:position];
        frameImage.sourceRectangle = [Rectangle rectangleWithX:32 * x y:32 * y width:32 height:32];
        frameImage.origin = [Vector2 vectorWithX:16 y:16];
        [frameImage setScaleUniform:3.0f];
        
        AnimatedImageFrame *frame = [AnimatedImageFrame frameWithImage:frameImage start:animation.duration * (float) i / 4];
        [animation addFrame:frame];
        [frameImage release];
    }
}

- (void) loadDebuffAnimation {
    animation.looping = NO;
    
    for (int i = 0; i < 4; i++) {
        int x = i % 4;
        int y = i / 4;
        Image *frameImage = [[Image alloc] initWithTexture:texture position:position];
        frameImage.sourceRectangle = [Rectangle rectangleWithX:32 * x y:32 * y width:32 height:32];
        frameImage.origin = [Vector2 vectorWithX:16 y:16];
        [frameImage setScaleUniform:3.0f];
        
        AnimatedImageFrame *frame = [AnimatedImageFrame frameWithImage:frameImage start:animation.duration * (float) i / 4];
        [animation addFrame:frame];
        [frameImage release];
    }
}




- (void) addedToScene:(id<IScene>)theScene {
    [theScene addItem:animation];
}

- (void) removedFromScene:(id<IScene>)theScene {
    [theScene removeItem:animation];
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    if (![animation isAlive]) {
        // animation finished, remove indicator from scene
        [scene removeItem:self];
    }
    
    if (target != nil && !target.stunned) {
        [scene removeItem:self];
    }
}

- (void) dealloc {
    [animation release];
    [texture release];
    [position release];
    
    if (target)
        [target release];
    
    [super dealloc];
}

@end
