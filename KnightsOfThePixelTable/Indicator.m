//
//  Indicator.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 16/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "Indicator.h"

@implementation Indicator

- (id) initWithText:(NSString *)text position:(Vector2 *)position font:(SpriteFont *)font color:(Color *)color duration:(float)theDuration {
    self = [super init];
    if (self != nil) {
        indicator = [[Label alloc] initWithFont:font text:text position:position];
        indicator.verticalAlign = VerticalAlignMiddle;
        indicator.horizontalAlign = HorizontalAlignCenter;
        
        indicator.color = color;
        
        scale = 1.0f;
        opacity = 1.0f;
        
        [indicator setScaleUniform:scale];
        
        duration = [[Lifetime alloc] initWithStart:0 duration:theDuration];
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
