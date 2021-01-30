//
//  IDice.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 27/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PixEngine.Scene.Objects.h"
#import "KOTPTEnums.h"
#import "PixEngine.Graphics.h"
//#import "Monster.h"
//#import "Dicepool.h"

@protocol IDice <IParticle, IRotatable, IAngularMass, ICoefficientOfRestitution, ICoefficientOfFriction>

@property (nonatomic) float altitude;
@property (nonatomic) float altitudeVelocity;
@property (nonatomic) DiceState state;
@property (nonatomic) StatType type;
@property (nonatomic) BOOL ignoreCollision;
@property (nonatomic, retain) Vector2 *origin;
@property (nonatomic, retain) Monster *target;
@property (nonatomic, retain) Sprite *border;
@property (nonatomic, retain) Sprite *sprite;
@property (nonatomic, retain) AnimatedSprite *animation;

- (void) updateRadius;

- (void) rememberOrigin;

- (void) resetPositionToOrigin:(BOOL)reset;

- (void) moveToTarget:(Monster *)theTarget;

- (void) resetTarget;

@end
