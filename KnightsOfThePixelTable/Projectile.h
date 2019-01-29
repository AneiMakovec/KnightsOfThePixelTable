//
//  Projectile.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Scene.Objects.h"
#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface Projectile : NSObject<IParticleCollider, IMovable, ISceneUser> {
    id<IScene> scene;
    
    Vector2 *position;
    Vector2 *velocity;
    float radius;
    
    int damage;
    CombatEntity *sender;
    CombatEntity *target;
    
    BOOL wasCrit;
    BOOL missed;
    
    Skill *skill;
}

@property (nonatomic, readonly) int damage;
@property (nonatomic, retain) CombatEntity *sender;
@property (nonatomic, retain) CombatEntity *target;
@property (nonatomic, readonly) BOOL wasCrit;
@property (nonatomic, readonly) BOOL missed;
@property (nonatomic, retain) Skill *skill;

- (id) initWithSender:(CombatEntity *)theSender target:(CombatEntity *)theTarget skill:(Skill *)theSkill damage:(int)theDamage position:(Vector2 *)thePosition velocity:(Vector2 *)theVelocity radius:(float)theRadius wasCrit:(BOOL)crit missed:(BOOL)miss;

@end

NS_ASSUME_NONNULL_END
