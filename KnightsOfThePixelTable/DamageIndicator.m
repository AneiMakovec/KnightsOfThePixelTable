//
//  DamageIndicator.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 16/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "DamageIndicator.h"

@implementation DamageIndicator

- (id) initWithAmount:(int)amount position:(Vector2 *)position font:(SpriteFont*)font isCrit:(BOOL)isCrit {
    self = [super init];
    if (self != nil) {
        indicator = [[Label alloc] initWithFont:font text:[NSString stringWithFormat:@"%d", amount] position:position];
        indicator.verticalAlign = VerticalAlignMiddle;
        indicator.horizontalAlign = HorizontalAlignCenter;
        
        if (isCrit)
            indicator.color = [Color orange];
        else
            indicator.color = [Color lightGoldenrodYellow];
        
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
        
        indicator.color = [Color gray];
        
        duration = [[Lifetime alloc] initWithStart:0 duration:0.5f];
    }
    return self;
}

@synthesize scene;

- (void) addedToScene:(id<IScene>)theScene {
    NSLog(@"Added to scene");
    [theScene addItem:indicator];
}

- (void) removedFromScene:(id<IScene>)theScene {
    [theScene removeItem:indicator];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [duration updateWithGameTime:gameTime];
    if (!duration.isAlive) {
        [scene removeItem:self];
    }
}

@end
