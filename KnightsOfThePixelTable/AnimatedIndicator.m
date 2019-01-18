//
//  AnimatedIndicator.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 18/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "AnimatedIndicator.h"

@implementation AnimatedIndicator

- (id) initWithTexture:(Texture2D *)theTexture position:(Vector2*)position duration:(NSTimeInterval)theDuration {
    self = [super init];
    if (self != nil) {
        texture = theTexture;
        duration = theDuration;
        
        animation = [[AnimatedSprite alloc] initWithDuration:duration];
        
        image = [[Image alloc] initWithTexture:texture position:position];
        
        target = nil;
    }
    return self;
}

@synthesize scene;



- (void) loadHitAnimation {
    
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
    
}

- (void) loadFrostbiteAnimation {
    
}

- (void) loadAnimationOfBuff:(StatType)stat {
    
}

- (void) loadAnimationOfDebuff:(StatType)stat {
    
}




- (void) addedToScene:(id<IScene>)scene {
    
}

- (void) removedFromScene:(id<IScene>)scene {
    
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    
}

@end
