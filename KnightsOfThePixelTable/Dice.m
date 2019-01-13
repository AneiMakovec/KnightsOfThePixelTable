//
//  Dice.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Dice.h"
#import "Pixlron.Knights.h"

@implementation Dice

- (id) init {
    self = [super init];
    if (self) {
        position = [[Vector2 alloc] init];
        velocity = [[Vector2 alloc] init];
        rotationAngle = 0.0f;
        angularVelocity = 15;
        angularMass = 16.0f * 16.0f * M_PI;
        altitude = 2.0f;
        radius = 16.0f * altitude;
        altitudeVelocity = 0.2f;
        mass = 16.0f * 16.0f * M_PI;
        coefficientOfRestitution = 0.1f;
        coefficientOfFriction = 0.05f;
        
        ignoreCollision = NO;
        
        origin = nil;
    }
    return self;
}

@synthesize altitude, altitudeVelocity, state, type, frameType, angularVelocity, angularMass, position, velocity, radius, rotationAngle, mass, coefficientOfRestitution, coefficientOfFriction, ignoreCollision, origin, target;

- (void) updateRadius {
    radius = 16.0f * altitude;
}

- (void) rememberOrigin {
    origin = [[Vector2 alloc] initWithX:position.x y:position.y];
}

- (void) resetPositionToOrigin:(BOOL)reset {
    if (reset) {
        [position set:origin];
    }
    
    [origin release];
    origin = nil;
}

- (void) moveToTarget:(Monster *)theTarget withDicepool:(Dicepool *)pool {
    target = theTarget;
    dicepool = pool;
    [self rememberOrigin];
    
    [target newDiceComming];
    
    velocity.x = (target.position.x - position.x);
    velocity.y = (target.position.y - position.y);
    coefficientOfFriction = 0.0f;
    
    //NSLog(@"Velocity X: %f, Y: %f!", velocity.x, velocity.y);
    state = DiceStateMoving;
}

- (void) resetTarget {
    target = nil;
    [dicepool removeDice:self];
    dicepool = nil;
    [velocity set:[Vector2 zero]];
    coefficientOfFriction = 0.05f;
    state = DiceStateStopped;
}

- (void) dealloc {
    [position release];
    [velocity release];
    if (origin) {
        [origin release];
    }
    
    [super dealloc];
}

@end
