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

- (id) initWithPosition:(Vector2 *)thePosition health:(int)hp damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius {
    self = [super initWithHealth:hp damageStrength:theDamageStrength];
    if (self != nil) {
        position = thePosition;
        radius = 1;
        maxRadius = theMaxRadius;
        
        state = EntityStateIdle;
        stats = [[NSMutableArray alloc] initWithCapacity:StatTypes];
        attackDamage = [[NSMutableArray alloc] initWithCapacity:AttackTypes];
        attackDuration = [[NSMutableArray alloc] initWithCapacity:AttackTypes];
        combo = [[NSMutableArray alloc] initWithCapacity:ComboItems];
        
//        for (int i = 0; i < ComboItems; i++) {
//            combo[i] = [[ComboSlot alloc] init];
//        }
        
        origin = [[BattlePosition alloc] initWithRadius:5];
        [origin.position set:position];
    }
    return self;
}

@synthesize radius, maxRadius, state, attackType, stats, origin, attackDamage, attackDuration, target, combo;

- (BOOL) collidingWithItem:(id)item {
    
    // wait for collision with target
    if (state == EntityStateApproaching) {
        Entity *entity = [item isKindOfClass:[Entity class]] ? (Entity *)item : nil;
        if (entity && entity == target) {
            state = EntityStateAttacking;
            [velocity set:[Vector2 zero]];
        }
    }
    
    // or wait for collision with start position
    if (state == EntityStateRetreating) {
        BattlePosition *start = [item isKindOfClass:[BattlePosition class]] ? (BattlePosition *)item : nil;
        if (start && start == origin) {
            state = EntityStateIdle;
            [velocity set:[Vector2 zero]];
            target = nil;
        }
    }
    
    // ignore all
    return NO;
}



- (void) attackTarget:(Entity *)theTarget {
    // remember target
    target = theTarget;
    
    // move towards the target
    state = EntityStateApproaching;
    // TODO: change radius to bigger radius
    radius = 60;
    velocity.x = (target.position.x - position.x) * 2;
    velocity.y = (target.position.y - position.y) * 2;
}


- (void) dealDamageToTarget {
    AttackValue *attack = [attackDamage objectAtIndex:attackType];
    StatValue *stat = [stats objectAtIndex:attack.statUsed];
    
    if (attack && stat) {
        int damage = damageStrength * stat.value * attack.value;
        [self dealDamageToTarget:target damage:-damage];
    }
}


- (BOOL) addComboItem:(Dice *)theItem {
    if ([combo count] < ComboItems) {
        [combo addObject:theItem];
        return YES;
    } else {
        return NO;
    }
}

- (Dice *) removeCombo:(ComboItem)theItem {
    if ([combo count] > theItem) {
        Dice *dice = [combo objectAtIndex:theItem];
        //[dice retain];
        
        [combo removeObjectAtIndex:theItem];
        return dice;
    }
    
    return nil;
}

- (void) setComboAreas:(Rectangle *)area {
    for (ComboSlot *slot in combo) {
        slot.area = area;
    }
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    if (state == EntityStateAttacking) {
        
        ResetableLifetime *attackTime = [attackDuration objectAtIndex:attackType];
        
        // wait for attack to end
        if (attackTime) {
            if (!attackTime.isAlive) {
                // and then deal the damage to target
                [self dealDamageToTarget];
                
                // then reset the attack lifetime
                [attackTime reset];
                
                // and retreat to idle position
                state = EntityStateRetreating;
                radius = 1;
                velocity.x = (origin.position.x - position.x) * 2;
                velocity.y = (origin.position.y - position.y) * 2;
            } else {
                [attackTime updateWithGameTime:gameTime];
            }
        }
    }
}

@end
