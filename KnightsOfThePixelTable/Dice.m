//
//  Dice.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Dice.h"

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
    }
    return self;
}

@synthesize altitude, altitudeVelocity, state, type, frameType, angularVelocity, angularMass, position, velocity, radius, rotationAngle, mass, coefficientOfRestitution, coefficientOfFriction, ignoreCollision;

- (void) updateRadius {
    radius = 16.0f * altitude;
}

- (void) dealloc {
    [position release];
    [velocity release];
    
    [super dealloc];
}

@end
