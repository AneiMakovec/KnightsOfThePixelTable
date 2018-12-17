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

@synthesize scene, battlefield, bounds, dicePool, num_of_dices;

- (void) initialize {
    // calculate the right dimensions of the display area
    float aspectRatio = (float)self.game.gameWindow.clientBounds.width / (float)self.game.gameWindow.clientBounds.height;
    bounds = [[Rectangle alloc] initWithX:0 y:0 width:1000 height:1000/aspectRatio];
    dicePool = [[Rectangle alloc] init];
    
    music_played = NO;
    
    battlefield = [[Battlefield alloc] initWithWidth:bounds.width height:bounds.height firstAlly:0 secondAlly:0 thirdAlly:0 fourthAlly:0 firstEnemy:0 secondEnemy:0 thirdEnemy:0 fourthEnemy:0];
    
    [self reset];
}

- (void) reset {
    // remove everything from scene
    [scene clear];
    
    // add objects to scene
    
    // obstacles
    int hudOffset = bounds.height * 0.625;
    float leftWall = [TextureStretcher scaleX:162.0f fromWidth:256.0f toWidth:(float)bounds.width];
    float rightWall = [TextureStretcher scaleX:250.0f fromWidth:256.0f toWidth:(float)bounds.width];
    float topWall = [TextureStretcher scaleY:5.0f fromHeight:48.0f toHeight:(float)bounds.height - (float)hudOffset];
    float bottomWall = [TextureStretcher scaleY:42.0f fromHeight:48.0f toHeight:(float)bounds.height - (float)hudOffset];
    
    dicePool.x = leftWall;
    dicePool.y = topWall + hudOffset;
    dicePool.width = rightWall - leftWall;
    dicePool.height = bottomWall - topWall;
    
    [scene addItem:[[[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveX distance:leftWall]] autorelease]];
    [scene addItem:[[[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeX distance:-rightWall]] autorelease]];
    [scene addItem:[[[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveY distance:topWall + hudOffset]] autorelease]];
    [scene addItem:[[[DicepoolLimit alloc] initWithLimit:[AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeY distance:-bottomWall - hudOffset]] autorelease]];
    
    // allies
    for (int i = 0; i < CombatPositions; i++) {
        Knight *entity = [battlefield getAllyAtPosition:i];
        if (entity) {
            [scene addItem:entity];
            [scene addItem:entity.origin];
        }
        
        entity = [battlefield getEnemyAtPosition:i];
        if (entity) {
            [scene addItem:entity];
            [scene addItem:entity.origin];
        }
    }
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
    [super dealloc];
}

@end
