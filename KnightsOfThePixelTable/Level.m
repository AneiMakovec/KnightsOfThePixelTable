//
//  Level.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Level.h"
#import "Pixlron.Knights.h"

@implementation Level

- (id) initWithGame:(Game *)theGame numDices:(int)numDices {
    self = [super initWithGame:theGame];
    if (self != nil) {
        scene = [[SimpleScene alloc] initWithGame:theGame];
        scene.updateOrder = 4;
        [self.game.components addComponent:scene];
        
        num_of_dices = numDices;
    }
    return self;
}

@synthesize scene, battlefield, bounds, dicepool, num_of_dices;

- (void) initialize {
    // calculate the right dimensions of the display area
    float aspectRatio = (float)self.game.gameWindow.clientBounds.width / (float)self.game.gameWindow.clientBounds.height;
    bounds = [[Rectangle alloc] initWithX:0 y:0 width:1000 height:1000/aspectRatio];

    music_played = NO;
    
    [self reset];
}

- (void) reset {
    // remove everything from scene
    [scene clear];
    
    // add objects to scene
    
    // dicepool objects
    dicepool = [[Dicepool alloc] initWithLevel:self];
    
    // entities
    battlefield = [[Battlefield alloc] initWithLevel:self];
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    if (!music_played) {
        [SoundEngine play:SoundEffectTypeBackground];
        music_played = YES;
    }
    
    for (id item in scene) {
        id<ICustomUpdate> updatable = [item conformsToProtocol:@protocol(ICustomUpdate)] ? (id<ICustomUpdate>) item : nil;
        if (updatable) {
            [updatable updateWithGameTime:gameTime];
        }
    }
}


- (void) dealloc {
    [scene release];
    [bounds release];
    [battlefield release];
    [dicepool release];
    [super dealloc];
}

@end
