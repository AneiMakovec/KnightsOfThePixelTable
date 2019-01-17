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

- (id) initWithBattlefield:(Battlefield*)theBattlefield gameHud:(GameHud*)theHud entityType:(StatType)theType health:(int)hp damageType:(DamageType)theDamageType damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius {
    self = [super initWithHealth:hp damageStrength:theDamageStrength];
    if (self != nil) {
        radius = 1;
        maxRadius = theMaxRadius;
        
        hud = theHud;
        battlefield = theBattlefield;
        
        stunned = NO;
        isDead = NO;
        finishedAttacking = NO;
        isTargeted = NO;
        
        entityType = theType;
        state = EntityStateIdle;
        damageType = theDamageType;
        skillType = NoSkill;
        
        combo = [[NSMutableArray alloc] initWithCapacity:ComboItems];
        
        statEffects = [[NSMutableArray alloc] init];
        targets = [[NSMutableArray alloc] init];
    }
    return self;
}

@synthesize radius, maxRadius, isDead, isTargeted, finishedAttacking, entityType, state, damageType, skillType, combatPosition, entityArea, origin, target, combo, hud;


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
        BattlePosition *end = [item isKindOfClass:[BattlePosition class]] ? (BattlePosition *)item : nil;
        if (end && end == target) {
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
            skillType = NoSkill;
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



- (void) attackTarget:(CombatEntity *)theTarget ally:(BOOL)isAlly {
    if (!stunned && !finishedAttacking) {
        // remove combo items
        [combo removeAllObjects];

        // check if its healing skill
        if (skills[skillType].function == SkillFunctionHeal)
            isAlly = !isAlly;
        
        // check skill targeting
        switch (skills[skillType].target) {
            case SkillTargetSingle:
                // single target
                if (!theTarget) {
                    CombatEntity *entity = [self getRandomTargetForAlly:isAlly];
                    target = [entity.origin retain];
                    [targets addObject:entity];
                } else {
                    target = [theTarget.origin retain];
                    [targets addObject:theTarget];
                }
                break;
                
            case SkillTargetFrontRow:
                // front row
                if (isAlly) {
                    target = battlefield.enemyFrontRow;
                    [targets addObject:[battlefield getEnemyAtPosition:FirstCombatPosition]];
                    [targets addObject:[battlefield getEnemyAtPosition:SecondCombatPosition]];
                } else {
                    target = battlefield.allyFrontRow;
                    [targets addObject:[battlefield getAllyAtPosition:FirstCombatPosition]];
                    [targets addObject:[battlefield getAllyAtPosition:SecondCombatPosition]];
                }
                break;
                
            case SkillTargetBackRow:
                // back row
                if (isAlly) {
                    target = battlefield.enemyBackRow;
                    [targets addObject:[battlefield getEnemyAtPosition:ThirdCombatPosition]];
                    [targets addObject:[battlefield getEnemyAtPosition:FourthCombatPosition]];
                } else {
                    target = battlefield.allyBackRow;
                    [targets addObject:[battlefield getAllyAtPosition:ThirdCombatPosition]];
                    [targets addObject:[battlefield getAllyAtPosition:FourthCombatPosition]];
                }
                break;
                
            case SkillTargetAll:
                // all
                if (isAlly) {
                    target = battlefield.enemyFrontRow;
                    [targets addObject:[battlefield getEnemyAtPosition:FirstCombatPosition]];
                    [targets addObject:[battlefield getEnemyAtPosition:SecondCombatPosition]];
                    [targets addObject:[battlefield getEnemyAtPosition:ThirdCombatPosition]];
                    [targets addObject:[battlefield getEnemyAtPosition:FourthCombatPosition]];
                } else {
                    target = battlefield.allyFrontRow;
                    [targets addObject:[battlefield getAllyAtPosition:FirstCombatPosition]];
                    [targets addObject:[battlefield getAllyAtPosition:SecondCombatPosition]];
                    [targets addObject:[battlefield getAllyAtPosition:ThirdCombatPosition]];
                    [targets addObject:[battlefield getAllyAtPosition:FourthCombatPosition]];
                }
                break;
                
            default:
                // single target
                if (!theTarget) {
                    CombatEntity *entity = [self getRandomTargetForAlly:isAlly];
                    target = [entity.origin retain];
                    [targets addObject:entity];
                } else {
                    target = [theTarget.origin retain];
                    [targets addObject:theTarget];
                }
                break;
        }
        
        // if attacking with melee skill
        if (skills[skillType].range == SkillRangeMelee) {
            // move towards the target
            state = EntityStateApproaching;
            
            radius = 60;
            velocity.x = (target.position.x - position.x) * 2;
            velocity.y = (target.position.y - position.y) * 2;
        // or if attacking with ranged skill
        } else if (skills[skillType].range == SkillRangeRanged) {
            // attack from origin
            state = EntityStateAttacking;
        }
    }
}


- (void) dealDamageToTarget:(CombatEntity *)theTarget {
    NSLog(@"My Strength stat is: %d", stats[Strength].statValue);
    
    // calculate if attack will miss
    if ([self calcChanceForSuccess:stats[Agility].statValue fail:[theTarget getStat:Insight].statValue]) {
        // hit
        NSLog(@"HIT");
        
        // calculate damage: damage = strength stat * percentage of skill - target defence
        int damage = skills[skillType].damage * stats[Strength].statValue; //- [target getStat:Defence].statValue;
        NSLog(@"DAMAGE: %d", damage);
        
        BOOL criticalHit;
        // calculate if damage is critical
        if ([self calcChanceForSuccess:stats[Cunning].statValue fail:[theTarget getStat:Sturdiness].statValue]) {
            // critical
            damage *= 2;
            
            criticalHit = YES;
            NSLog(@"CRITICAL DAMAGE: %d", damage);
        } else {
            criticalHit = NO;
        }
        
        // first deal damage
        [self dealDamageToTarget:theTarget damage:damage];
        
        // add damage indicator
        [hud addDamageIndicatorAt:theTarget.position amount:damage isCrit:criticalHit];
        
        // then apply status effects
        for (StatEffect *effect in skills[skillType].statEffects) {
            [theTarget addStatEffect:effect];
        }
    } else {
        // miss
        [hud addMissIndicatorAt:theTarget.position];
        NSLog(@"MISS");
    }
}

- (void) healTarget:(CombatEntity *)theTarget {
    // calculate heal: heal = strength stat * percentage of skill - target defence
    int healAmount = skills[skillType].damage * stats[Strength].statValue; //- [target getStat:Defence].statValue;
    NSLog(@"HEALING: %d", healAmount);
        
    BOOL criticalHit;
    // calculate if heal is critical
    if ([self calcChanceForSuccess:stats[Cunning].statValue fail:[theTarget getStat:Sturdiness].statValue]) {
        // critical
        healAmount *= 2;
            
        criticalHit = YES;
        NSLog(@"CRITICAL HEAL: %d", healAmount);
    } else {
        criticalHit = NO;
    }
        
    // first heal
    [self healTarget:theTarget amount:healAmount];
        
    // add hela indicator
    [hud addHealIndicatorAt:theTarget.position amount:healAmount isCrit:criticalHit];
    
    // then apply status effects
    for (StatEffect *effect in skills[skillType].statEffects) {
        [theTarget addStatEffect:effect];
    }
}


- (BOOL) calcChanceForSuccess:(int)success fail:(int)fail {
    int sum = success + fail;
    float pSuccess = (float)success / (float)sum;
    
    int threshold = 100 * pSuccess;
    int hit = [Random  intLessThan:100];
    
    if (hit <= threshold)
        return YES;
    else
        return NO;
}

- (CombatEntity *) getRandomTargetForAlly:(BOOL)isAlly {
    CombatEntity *entity;
    if (isAlly) {
        entity = [battlefield getEnemyAtPosition:[Random intLessThan:CombatPositions]];
        while (!entity) {
            entity = [battlefield getEnemyAtPosition:[Random intLessThan:CombatPositions]];
        }
    } else {
        entity = [battlefield getAllyAtPosition:[Random intLessThan:CombatPositions]];
        while (!entity) {
            entity = [battlefield getAllyAtPosition:[Random intLessThan:CombatPositions]];
        }
    }
    
    return entity;
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
        [self updateSkillType];
        
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
        
        Skill *skill = skills[skillType];
        
        // wait for attack to end
        if (!skill.duration.isAlive) {
            // and then deal the damage to targets and tell them to stop defending
            for (CombatEntity *entity in targets) {
                // check if skill heals
                if (skill.function == SkillFunctionHeal) {
                    [self healTarget:entity];
                } else if (skill.function == SkillFunctionDamage) {
                    [self dealDamageToTarget:entity];
                    [entity stopDefending];
                }
            }
            
            // release targets
            [target release];
            target = nil;
            [targets removeAllObjects];
                
            // then reset the attack lifetime
            [skill.duration reset];
            
            // if attacking with melee skill
            if (skills[skillType].range == SkillRangeMelee) {
                // and retreat to idle position
                state = EntityStateRetreating;
                radius = 1;
                velocity.x = (origin.position.x - position.x) * 2;
                velocity.y = (origin.position.y - position.y) * 2;
            // or if attacking with ranged skill
            } else if (skills[skillType].range == SkillRangeRanged) {
                // end attack
                state = EntityStateIdle;
            }
        } else {
            [skill.duration updateWithGameTime:gameTime];
        }
    }
}


- (void) stopDefending {
    state = EntityStateIdle;
}


- (void) updateSkillType {
    // MARK: TODO - change checking combo logic
    
    int mainTypeCount = 0;
    int skillTypeCount = 0;
    
    switch ([combo count]) {
        case 1:
            skillType = BasicAttack;
            break;
        case 2:
            for (ComboSlot *slot in combo) {
                if (slot.item.type == entityType) {
                    mainTypeCount++;
                }
                
                if (slot.item.type == comboSkillTypes[FirstComboSkill]) {
                    skillTypeCount++;
                }
            }
            
            if (mainTypeCount == 1 && skillTypeCount >= 1) {
                skillType = FirstComboSkill;
            } else {
                skillType = BasicAttack;
            }
            break;
        case 3:
            for (ComboSlot *slot in combo) {
                if (slot.item.type == entityType) {
                    mainTypeCount++;
                }
                
                if (slot.item.type == comboSkillTypes[SecondComboSkill]) {
                    skillTypeCount++;
                }
            }
            
            if (mainTypeCount == 2 && skillTypeCount >= 1) {
                skillType = SecondComboSkill;
            } else {
                skillType = BasicAttack;
            }
            break;
        case 4:
            for (ComboSlot *slot in combo) {
                if (slot.item.type == entityType) {
                    mainTypeCount++;
                }
                
                if (slot.item.type == comboSkillTypes[ThirdComboSkill]) {
                    skillTypeCount++;
                }
            }
            
            if (mainTypeCount == 3 && skillTypeCount == 1) {
                skillType = ThirdComboSkill;
            } else {
                skillType = BasicAttack;
            }
            break;
            
        default:
            skillType = NoSkill;
            break;
    }
}

- (void) updateStatEffects {
    // update status effects and check if any is disactivated
    NSMutableArray *deactivated = [[NSMutableArray alloc] init];
    for (StatEffect *effect in statEffects) {
        [effect update];
        if (!effect.active) {
            [deactivated addObject:effect];
        }
    }
    
    // if is deactivated remove it
    for (StatEffect *effect in deactivated) {
        [statEffects removeObject:effect];
    }
    
    [deactivated release];
}

- (StatType) getAttackValueForAttack:(SkillType)theAttack {
    // MARK: TODO: change the attack type to attack value in attack damages
    return comboSkillTypes[theAttack];
}


//- (void) addStat:(Stat *)stat type:(StatType)type {
//    [stat retain];
//    stats[type] = stat;
//}
//
//- (void) addSkill:(Skill *)skill type:(SkillType)type {
//    [skill retain];
//    skills[type] = skill;
//}

- (Stat*) getStat:(StatType)type {
    return stats[type];
}


- (void) addStatEffect:(StatEffect *)effect {
    [statEffects addObject:effect];
    [effect activateWithTarget:self];
}

- (void) buffStat:(StatType)type amount:(float)amount {
    [stats[type] increaseByPercentage:amount];
}

- (void) debuffStat:(StatType)type amount:(float)amount {
    [stats[type] decreaseByPercentage:amount];
}

- (void) resetStat:(StatType)type {
    [stats[type] reset];
}


- (BOOL) isStunned {
    return stunned;
}

- (void) stun {
    stunned = YES;
}

- (void) recoverFromStun {
    stunned = NO;
}



- (void) dealloc {
    [entityArea release];
    [origin release];
    
    if (target)
        [target release];
    
    for (int i = 0; i < StatTypes; i++) {
        [stats[i] release];
    }
    
    for (int i = 0; i < SkillTypes; i++) {
        [skills[i] release];
    }
    
    [combo release];
    [targets release];
    
    [super dealloc];
}

@end
