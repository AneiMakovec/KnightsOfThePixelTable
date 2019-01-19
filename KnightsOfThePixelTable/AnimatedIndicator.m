//
//  AnimatedIndicator.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 18/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "AnimatedIndicator.h"

@implementation AnimatedIndicator

- (id) initWithTexture:(Texture2D *)theTexture position:(Vector2*)thePosition duration:(NSTimeInterval)theDuration {
    self = [super init];
    if (self != nil) {
        texture = [theTexture retain];
        duration = theDuration;
        position = thePosition;
        
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
    
}

- (void) loadStunAnimationWithTarget:(CombatEntity *)target {
    
}

- (void) loadBleedAnimation {
    
}

- (void) loadPoisonAnimation {
    
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

- (void) loadAnimationOfBuff:(StatType)stat {
    
}

- (void) loadAnimationOfDebuff:(StatType)stat {
    
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
}

- (void) dealloc {
    [animation release];
    [texture release];
    
    if (target)
        [target release];
    
    [super dealloc];
}

@end
