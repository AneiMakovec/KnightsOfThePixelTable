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

@protocol IDice <IParticle, IRotatable, IAngularMass, ICoefficientOfRestitution, ICoefficientOfFriction>

@property (nonatomic) float altitude;
@property (nonatomic) float altitudeVelocity;
@property (nonatomic) DiceState state;
@property (nonatomic) DiceType type;
@property (nonatomic) DiceType frameType;

@end
