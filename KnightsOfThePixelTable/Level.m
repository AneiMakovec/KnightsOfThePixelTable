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
        scene.updateOrder = 3;
        [self.game.components addComponent:scene];
        
        num_of_dices = numDices;
    }
    return self;
}

@synthesize scene, bounds, dicePool, num_of_dices;

- (void) initialize {
    // calculate the right dimensions of the display area
    float aspectRatio = (float)self.game.gameWindow.clientBounds.width / (float)self.game.gameWindow.clientBounds.height;
    bounds = [[Rectangle alloc] initWithX:0 y:0 width:1000 height:1000/aspectRatio];
    dicePool = [[Rectangle alloc] init];
    
    music_played = NO;
    
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
    
    // dices
    /*
    for (int i = 0; i < num_of_dices; i++) {
        Dice *dice = [[[Dice alloc] init] autorelease];
        dice.position.x = [Random intGreaterThanOrEqual:(int)leftWall+(int)dice.radius lessThan:(int)rightWall-(int)dice.radius];
        dice.position.y = [Random intGreaterThanOrEqual:(int)topWall+(int)dice.radius lessThan:(int)bottomWall-(int)dice.radius];;
        dice.velocity.x = [Random intGreaterThanOrEqual:-500 lessThan:500];
        dice.velocity.y = [Random intGreaterThanOrEqual:-500 lessThan:500];
        [scene addItem:dice];
    }
     */
    
    // allies
    
    
    // enemies
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    if (!music_played) {
        [SoundEngine play:SoundEffectTypeBackground];
        music_played = YES;
    }
}


- (void) dealloc {
    [scene release];
    [bounds release];
    [super dealloc];
}

@end
