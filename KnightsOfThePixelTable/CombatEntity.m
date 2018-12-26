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

- (id) initWithHealth:(int)hp damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius {
    self = [super initWithHealth:hp damageStrength:theDamageStrength];
    if (self != nil) {
        radius = 1;
        maxRadius = theMaxRadius;
        
        isDead = NO;
        
        state = EntityStateIdle;
        attackType = NoAttack;
        
        stats = [[NSMutableArray alloc] initWithCapacity:StatTypes];
        attackDamage = [[NSMutableArray alloc] initWithCapacity:AttackTypes];
        attackDuration = [[NSMutableArray alloc] initWithCapacity:AttackTypes];
        combo = [[NSMutableArray alloc] initWithCapacity:ComboItems];
        
//        for (int i = 0; i < ComboItems; i++) {
//            combo[i] = [[ComboSlot alloc] init];
//        }
        
//        origin = [[BattlePosition alloc] initWithRadius:5];
//        [origin.position set:position];
    }
    return self;
}

@synthesize radius, maxRadius, isDead, state, attackType, combatPosition, entityArea, stats, origin, attackDamage, attackDuration, target, combo;


- (void) setCombatPosition:(CombatPosition)theCombatPosition ally:(BOOL)isAlly {
    combatPosition = theCombatPosition;
    
    // calc position
    position = [[Vector2 alloc] initWithX:[Constants positionXOfAlly:combatPosition] y:[Constants positionYOfAlly:combatPosition]];
    [[ScreenComponent getScale:@"battlefield"] scalePosition:position];
    
    if (!isAlly) {
        position.x = [ScreenComponent getScreenBounds].width - position.x;
    }
    
    // calc battle position
    origin = [[BattlePosition alloc] initWithRadius:5];
    [origin.position set:position];
}



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
            attackType = NoAttack;
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
    attackType = BasicAttack;
    
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
    // Override this in child implementations.
    return false;
}

- (Dice *) removeCombo:(ComboItem)theItem {
    if (theItem < [combo count]) {
        ComboSlot *comboSlot = [combo objectAtIndex:theItem];
        Dice *dice = [comboSlot.item retain];
        
        [combo removeObject:comboSlot];
        
        for (ComboSlot *slot in combo) {
            [slot changeToSlot:[combo indexOfObject:slot]];
        }
        
        return dice;
    } else {
        return nil;
    }
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    
    // check if is still alive
    if (currentHealthPoints <= 0) {
        isDead = YES;
    }
    
    // update movement
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

- (void) dealloc {
    [entityArea release];
    [origin release];
    
    [stats release];
    [attackDamage release];
    [attackDuration release];
    [combo release];
    
    [super dealloc];
}

@end
