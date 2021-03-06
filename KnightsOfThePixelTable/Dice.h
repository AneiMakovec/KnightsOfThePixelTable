//
//  Dice.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Scene.Objects.h"
#import "Pixlron.Knights.classes.h"
#import "IDice.h"

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject <IDice> {
    Vector2 *position;
    Vector2 *velocity;
    float rotationAngle;
    float angularVelocity;
    float angularMass;
    float radius;
    float mass;
    float coefficientOfRestitution;
    float coefficientOfFriction;
    
    float altitude;
    float altitudeVelocity;
    DiceState state;
    StatType type;
    BOOL ignoreCollision;
    Vector2 *origin;
    Monster *target;
    
    Sprite *border;
    Sprite *sprite;
    
    AnimatedSprite *animation;
}

- (id) initWithType:(StatType)tType;

@end

NS_ASSUME_NONNULL_END
