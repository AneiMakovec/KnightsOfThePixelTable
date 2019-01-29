//
//  Projectile.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "Projectile.h"

@implementation Projectile

- (id) initWithSender:(CombatEntity *)theSender target:(CombatEntity *)theTarget skill:(Skill *)theSkill damage:(int)theDamage position:(Vector2 *)thePosition velocity:(Vector2 *)theVelocity radius:(float)theRadius wasCrit:(BOOL)crit missed:(BOOL)miss {
    self = [super init];
    if (self != nil) {
        sender = theSender;
        target = [theTarget retain];
        skill = [theSkill retain];
        damage = theDamage;
        position = [thePosition retain];
        velocity = [theVelocity retain];
        radius = theRadius;
        wasCrit = crit;
        missed = miss;
    }
    return self;
}

@synthesize scene, sender, target, damage, position, velocity, radius, wasCrit, missed, skill;


- (void) removedFromScene:(id<IScene>)scene {
    [target release];
    [skill release];
}


- (void) dealloc {
    [position release];
    [velocity release];
    
    [super dealloc];
}

@end
