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
        
        allies = [NSMutableArray arrayWithCapacity:CombatPositions];
        enemies = [NSMutableArray arrayWithCapacity:CombatPositions];
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
    
    // allies
    Knight *lancelot = [[[Knight alloc] initWithKnightType:KnightTypeLancelot health:100 damageStrength:0.85 maxRadius:60] autorelease];
    lancelot.stats = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:30], nil];
    lancelot.attackDamage = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:30], nil];
    lancelot.attackDuration = [[NSArray alloc] initWithObjects:[[ResetableLifetime alloc] initWithStart:0 duration:2], nil];
    lancelot.position = allyPositions[FirstCombatPosition];
    
    BattlePosition *position = [[BattlePosition alloc] initWithRadius:1];
    position.position = allyPositions[FirstCombatPosition];
    
    lancelot.origin = position;
    
    [scene addItem:lancelot];
    [scene addItem:position];
    
    // enemies
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    if (!music_played) {
        [SoundEngine play:SoundEffectTypeBackground];
        music_played = YES;
    }
}



- (void) setAllyPosition:(CombatPosition)theAllyPosition toPosition:(Vector2 *)thePosition {
    allyPositions[theAllyPosition] = thePosition;
}

- (void) setEnemyPosition:(CombatPosition)theEnemyPosition toPosition:(Vector2 *)thePosition {
    enemyPositions[theEnemyPosition] = thePosition;
}


- (void) dealloc {
    [scene release];
    [bounds release];
    [super dealloc];
}

@end
