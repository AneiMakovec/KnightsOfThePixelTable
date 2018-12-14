//
//  CombatEntity.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "CombatEntity.h"

#import "Pixlron.Knights.h"

@implementation CombatEntity

- (id) initWithHealth:(int)hp damageStrength:(float)theDamageStrength {
    self = [super initWithHealth:hp damageStrength:theDamageStrength];
    if (self != nil) {
        radius = 1;
        
        state = EntityStateIdle;
        stats = [NSMutableArray arrayWithCapacity:StatTypes];
        attackDamage = [NSMutableArray arrayWithCapacity:AttackTypes];
        attackDuration = [NSMutableArray arrayWithCapacity:AttackTypes];
        //targets = [NSMutableArray arrayWithCapacity:EnemyPositions];
    }
    return self;
}

@synthesize radius, state, attackType, stats, origin, attackDamage, attackDuration, target;

- (BOOL) collidingWithItem:(id)item {
    
    // wait for collision with target
    Entity *entity = [item isKindOfClass:[Entity class]] ? (Entity *)item : nil;
    if (entity && entity == target) {
        state = EntityStateAttacking;
        velocity.x = 0;
        velocity.y = 0;
    }
    
    // or wait for collision with start position
    BattlePosition *start = [item isKindOfClass:[BattlePosition class]] ? (BattlePosition *)item : nil;
    if (start && start == origin) {
        state = EntityStateIdle;
        velocity.x = 0;
        velocity.y = 0;
    }
    
    // ignore all
    return NO;
}



- (void) attackTarget:(Entity *)theTarget {
    // remember target
    target = theTarget;
    
    // move towards the target
    state = EntityStateApproaching;
    velocity.x = (target.position.x - position.x) / 5;
    velocity.y = (target.position.y - position.y) / 5;
}


- (void) dealDamageToTarget:(id<IDamageable>)target {
    id stat = stats[Strength];
    NSNumber *strength = [stat isKindOfClass:[NSNumber class]] ? (NSNumber *) stat : nil;
    
    if (strength) {
        int damage = damageStrength * strength.intValue;
        [self dealDamageToTarget:target damage:damage];
    }
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    if (state == EntityStateAttacking) {
        id item = attackDuration[attackType];
        
        ResetableLifetime *duration = [item isKindOfClass:[ResetableLifetime class]] ? (ResetableLifetime *)item : nil;
        
        // wait for attack to end
        if (duration) {
            if (!duration.isAlive) {
                // and then deal the damage to target
                [self dealDamageToTarget:target];
                
                // then reset the attack lifetime
                [duration reset];
                
                // and retreat to idle position
                state = EntityStateRetreating;
                velocity.x = (origin.position.x - position.x) / 5;
                velocity.y = (origin.position.y - position.y) / 5;
            } else {
                [duration updateWithGameTime:gameTime];
            }
        }
    }
}

@end
