//
//  Indicator.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 16/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "Indicator.h"

@implementation Indicator

- (id) initWithDamage:(int)amount position:(Vector2 *)position font:(SpriteFont*)font isCrit:(BOOL)isCrit {
    self = [super init];
    if (self != nil) {
        indicator = [[Label alloc] initWithFont:font text:[NSString stringWithFormat:@"%d", amount] position:position];
        indicator.verticalAlign = VerticalAlignMiddle;
        indicator.horizontalAlign = HorizontalAlignCenter;
        
        if (isCrit)
            indicator.color = [Color whiteSmoke];
        else
            indicator.color = [Color red];
        
        scale = 1.0f;
        opacity = 1.0f;
        
        [indicator setScaleUniform:scale];
        
        duration = [[Lifetime alloc] initWithStart:0 duration:0.5f];
    }
    return self;
}

- (id) initWithHeal:(int)amount position:(Vector2 *)position font:(SpriteFont *)font isCrit:(BOOL)isCrit {
    self = [super init];
    if (self != nil) {
        indicator = [[Label alloc] initWithFont:font text:[NSString stringWithFormat:@"%d", amount] position:position];
        indicator.verticalAlign = VerticalAlignMiddle;
        indicator.horizontalAlign = HorizontalAlignCenter;
        
        if (isCrit)
            indicator.color = [Color darkGreen];
        else
            indicator.color = [Color green];
        
        scale = 1.0f;
        opacity = 1.0f;
        
        [indicator setScaleUniform:scale];
        
        duration = [[Lifetime alloc] initWithStart:0 duration:0.5f];
    }
    return self;
}

- (id) initMissAtPosition:(Vector2 *)position font:(SpriteFont *)font {
    self = [super init];
    if (self != nil) {
        indicator = [[Label alloc] initWithFont:font text:@"MISS" position:position];
        indicator.verticalAlign = VerticalAlignMiddle;
        indicator.horizontalAlign = HorizontalAlignCenter;
        
        indicator.color = [Color lightGray];
        
        scale = 1.0f;
        opacity = 1.0f;
        
        [indicator setScaleUniform:scale];
        
        duration = [[Lifetime alloc] initWithStart:0 duration:0.5f];
    }
    return self;
}

- (id) initWithExp:(int)amount position:(Vector2 *)position font:(SpriteFont *)font {
    self = [super init];
    if (self != nil) {
        indicator = [[Label alloc] initWithFont:font text:[NSString stringWithFormat:@"+ %d EXP", amount] position:position];
        indicator.verticalAlign = VerticalAlignMiddle;
        indicator.horizontalAlign = HorizontalAlignCenter;
        
        indicator.color = [Color blue];
        
        scale = 1.0f;
        opacity = 1.0f;
        
        [indicator setScaleUniform:scale];
        
        duration = [[Lifetime alloc] initWithStart:0 duration:0.5f];
    }
    return self;
}

- (id) initWithGold:(int)amount position:(Vector2 *)position font:(SpriteFont *)font {
    self = [super init];
    if (self != nil) {
        indicator = [[Label alloc] initWithFont:font text:[NSString stringWithFormat:@"+ %d G", amount] position:position];
        indicator.verticalAlign = VerticalAlignMiddle;
        indicator.horizontalAlign = HorizontalAlignCenter;
        
        indicator.color = [Color lightGoldenrodYellow];
        
        scale = 1.0f;
        opacity = 1.0f;
        
        [indicator setScaleUniform:scale];
        
        duration = [[Lifetime alloc] initWithStart:0 duration:0.5f];
    }
    return self;
}


@synthesize scene;

- (void) addedToScene:(id<IScene>)theScene {
    [theScene addItem:indicator];
}

- (void) removedFromScene:(id<IScene>)theScene {
    [theScene removeItem:indicator];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [duration updateWithGameTime:gameTime];
    if (!duration.isAlive) {
        // if duration expired, remove from scene
        [scene removeItem:self];
    } else {
        // update size
        float sizeChange = gameTime.elapsedGameTime * 2;
        scale += sizeChange;
        [indicator setScaleUniform:scale];
        
        // update color
        float change = gameTime.elapsedGameTime / 7;
        opacity -= change;
        [indicator.color set:[Color multiply:indicator.color withScalar:opacity]];
    }
}

@end
