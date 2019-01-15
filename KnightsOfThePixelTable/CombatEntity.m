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

- (id) initWithEntityType:(StatType)theType health:(int)hp damageType:(DamageType)theDamageType damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius {
    self = [super initWithHealth:hp damageStrength:theDamageStrength];
    if (self != nil) {
        radius = 1;
        maxRadius = theMaxRadius;
        
        isDead = NO;
        finishedAttacking = NO;
        
        entityType = theType;
        state = EntityStateIdle;
        damageType = theDamageType;
        attackType = NoAttack;
        
        stats = [[NSMutableArray alloc] initWithCapacity:StatTypes];
        skills = [[NSMutableArray alloc] initWithCapacity:AttackTypes];
        combo = [[NSMutableArray alloc] initWithCapacity:ComboItems];
    }
    return self;
}

@synthesize radius, maxRadius, isDead, finishedAttacking, entityType, state, damageType, attackType, combatPosition, entityArea, origin, target, combo;


- (void) setCombatPosition:(CombatPosition)theCombatPosition ally:(BOOL)isAlly {
    combatPosition = theCombatPosition;
    
    // calc position
    position = [[Vector2 alloc] initWithX:[Constants positionXOfAlly:combatPosition] y:[Constants positionYOfAlly:combatPosition]];
    //[[ScreenComponent getScale:@"battlefield"] scalePosition:position];
    
    if (!isAlly) {
        //position.x = [ScreenComponent getScreenBounds].width - position.x;
        position.x = [Constants backgroundWidth] - position.x;
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
            // no more attacking this turn
            finishedAttacking = YES;
            state = EntityStateIdle;
            attackType = NoAttack;
            [velocity set:[Vector2 zero]];
        }
    }
    
    // or wait for collision with attacking entity
    if (state == EntityStateIdle) {
        CombatEntity *entity = [item isKindOfClass:[CombatEntity class]] ? (CombatEntity *)item : nil;
        if (entity) {
            if (entity.state == EntityStateAttacking) {
                state = EntityStateDefending;
            }
        }
    }
    
    // ignore all
    return NO;
}



- (void) attackTarget:(CombatEntity *)theTarget {
    if (!finishedAttacking) {
        // remember target
        target = [theTarget retain];
        
        // remove combo items
        [combo removeAllObjects];
        
        // move towards the target
        state = EntityStateApproaching;
        // TODO: change radius to bigger radius
        radius = 60;
        velocity.x = (target.position.x - position.x) * 2;
        velocity.y = (target.position.y - position.y) * 2;
    }
}


- (void) dealDamageToTarget {
    // MARK: TODO - change attack logic
    Skill *skill = [skills objectAtIndex:attackType];
    Stat *stat = [stats objectAtIndex:Strength];
    
    if (skill && stat) {
        //int damage = stat.value;
        int damage = 100;
        [self dealDamageToTarget:target damage:-damage];
    }
}



- (BOOL) addComboItem:(Dice *)theItem {
    // Override this in child implementations.
    return false;
}

- (Dice *) removeCombo:(ComboItem)theItem {
    if (theItem < [combo count]) {
        // remember the combo dice
        ComboSlot *comboSlot = [combo objectAtIndex:theItem];
        Dice *dice = [comboSlot.item retain];
        
        // remove combo item
        [combo removeObject:comboSlot];
        
        // shift combo items after the removed one to the left
        for (ComboSlot *slot in combo) {
            ComboItem slotPosition = (ComboItem) [combo indexOfObject:slot];
            [slot changeToSlot:slotPosition];
        }
        
        // update attack/skill
        [self updateAttackType];
        
        // return combo dice
        return dice;
    } else {
        return nil;
    }
}


- (void) resetAttack {
    finishedAttacking = NO;
}



- (void) updateWithGameTime:(GameTime *)gameTime {
    
    // check if is still alive
    if (currentHealthPoints <= 0) {
        isDead = YES;
    }

    
    // update movement
    if (state == EntityStateAttacking) {
        
        Skill *skill = [skills objectAtIndex:attackType];
        
        // wait for attack to end
        if (skill) {
            if (!skill.duration.isAlive) {
                // and then deal the damage to target and tell it to stop defending
                [self dealDamageToTarget];
                [target stopDefending];
                [target release];
                target = nil;
                
                // then reset the attack lifetime
                [skill.duration reset];
                
                // and retreat to idle position
                state = EntityStateRetreating;
                radius = 1;
                velocity.x = (origin.position.x - position.x) * 2;
                velocity.y = (origin.position.y - position.y) * 2;
            } else {
                [skill.duration updateWithGameTime:gameTime];
            }
        }
    }
}


- (void) stopDefending {
    state = EntityStateIdle;
}


- (void) updateAttackType {
    // MARK: TODO - change checking combo logic
    
    int mainTypeCount = 0;
    int attackTypeCount = 0;
    
    switch ([combo count]) {
        case 1:
            attackType = BasicAttack;
            break;
        case 2:
            for (ComboSlot *slot in combo) {
                if (slot.item.type == entityType) {
                    mainTypeCount++;
                }
                
                if (slot.item.type == comboAttackTypes[FirstComboAttack]) {
                    attackTypeCount++;
                }
            }
            
            if (mainTypeCount == 1 && attackTypeCount >= 1) {
                attackType = FirstComboAttack;
            } else {
                attackType = BasicAttack;
            }
            break;
        case 3:
            for (ComboSlot *slot in combo) {
                if (slot.item.type == entityType) {
                    mainTypeCount++;
                }
                
                if (slot.item.type == comboAttackTypes[SecondComboAttack]) {
                    attackTypeCount++;
                }
            }
            
            if (mainTypeCount == 2 && attackTypeCount >= 1) {
                attackType = SecondComboAttack;
            } else {
                attackType = BasicAttack;
            }
            break;
        case 4:
            for (ComboSlot *slot in combo) {
                if (slot.item.type == entityType) {
                    mainTypeCount++;
                }
                
                if (slot.item.type == comboAttackTypes[ThirdComboAttack]) {
                    attackTypeCount++;
                }
            }
            
            if (mainTypeCount == 3 && attackTypeCount == 1) {
                attackType = ThirdComboAttack;
            } else {
                attackType = BasicAttack;
            }
            break;
            
        default:
            attackType = NoAttack;
            break;
    }
}

- (StatType) getAttackValueForAttack:(AttackType)theAttack {
    // MARK: TODO: change the attack type to attack value in attack damages
    return comboAttackTypes[theAttack];
}


- (void) dealloc {
    [entityArea release];
    [origin release];
    
    if (target)
        [target release];
    
    [stats release];
    [skills release];
    [combo release];
    
    [super dealloc];
}

@end
