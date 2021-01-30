//
//  Projectile.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "Projectile.h"

#import "Pixlron.Knights.h"

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
        
        rotationAngle = 0.0f;
        angularVelocity = 0.0f;
        
        
        sprite = nil;
        animation = nil;
        switch (skill.projectileType) {
            case ProjectileArrowBleed:
                sprite = [GraphicsComponent getSpriteWithKey:GAMEPLAY_MENU_PROPS_PROJECTILES_ARROW_BLEED];
                break;
                
            case ProjectileArrowFrost:
                animation = [GraphicsComponent getAnimatedSpriteWithKey:GAMEPLAY_MENU_PROPS_PROJECTILES_ARROW_FROST_ANIMATION];
                break;
                
            case ProjectileAxeBurn:
                sprite = [GraphicsComponent getSpriteWithKey:GAMEPLAY_MENU_PROPS_PROJECTILES_AXE_BURN];
                angularVelocity = 5.0f;
                break;
                
            case ProjectileAxePoison:
                sprite = [GraphicsComponent getSpriteWithKey:GAMEPLAY_MENU_PROPS_PROJECTILES_AXE_POISON];
                angularVelocity = 5.0f;
                break;
                
            case ProjectileBomb:
                sprite = [GraphicsComponent getSpriteWithKey:GAMEPLAY_MENU_PROPS_PROJECTILES_BOMB];
                break;
                
            case ProjectileDagger:
                sprite = [GraphicsComponent getSpriteWithKey:GAMEPLAY_MENU_PROPS_PROJECTILES_DAGGER];
                angularVelocity = 5.0f;
                break;
                
            case ProjectileDartBurn:
                animation = [GraphicsComponent getAnimatedSpriteWithKey:GAMEPLAY_MENU_PROPS_PROJECTILES_DART_BURN_ANIMATION];
                break;
                
            case ProjectileDartPoison:
                animation = [GraphicsComponent getAnimatedSpriteWithKey:GAMEPLAY_MENU_PROPS_PROJECTILES_DART_POISON_ANIMATION];
                break;
                
            case ProjectileDartStun:
                sprite = [GraphicsComponent getSpriteWithKey:GAMEPLAY_MENU_PROPS_PROJECTILES_DART_STUN];
                break;
                
            case ProjectileFireball:
                animation = [GraphicsComponent getAnimatedSpriteWithKey:GAMEPLAY_MENU_PROPS_PROJECTILES_FIREBALL_ANIMATION];
                break;
                
            case ProjectileSlingFrost:
                sprite = [GraphicsComponent getSpriteWithKey:GAMEPLAY_MENU_PROPS_PROJECTILES_SLING_FROST];
                break;
                
            case ProjectileSlingSling:
                sprite = [GraphicsComponent getSpriteWithKey:GAMEPLAY_MENU_PROPS_PROJECTILES_SLING_SLING];
                break;
                
            default:
                break;
        }
    }
    return self;
}

@synthesize scene, sender, target, damage, position, velocity, radius, wasCrit, missed, skill, angularVelocity, rotationAngle;


- (void) removedFromScene:(id<IScene>)scene {
    [target release];
    [skill release];
}


- (id) getSprite {
    if (sprite) {
        return sprite;
    } else {
        return animation;
    }
}


- (void) dealloc {
    [position release];
    [velocity release];
    
    [super dealloc];
}

@end
