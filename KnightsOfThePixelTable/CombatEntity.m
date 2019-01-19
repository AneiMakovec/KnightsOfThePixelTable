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
    
    if (!isAlly) {
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
    // check if there are any enemies
    if ([battlefield hasAnyEnemyForAlly:isAlly]) {
        
        // check if not finished attacking
        if (!finishedAttacking) {
            // remove combo items
            [combo removeAllObjects];

            // check if it is healing skill or if skill is used on allies
            if (skills[skillType].function == SkillFunctionHeal || skills[skillType].useOn == SkillUseOnAlly)
                isAlly = !isAlly;
            
            // check skill targeting
            switch (skills[skillType].target) {
                case SkillTargetSelf:
                    [targets addObject:self];
                    state = EntityStateAttacking;
                    break;
                    
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
}


- (void) dealDamageToTarget:(CombatEntity *)theTarget {
    NSLog(@"My Strength stat is: %d", stats[Strength].statValue);
    
    // calculate if attack will miss
    if ([self calcChanceForSuccess:stats[Agility].statValue fail:[theTarget getStat:Insight].statValue]) {
        // hit
        NSLog(@"HIT");
        
        // calculate damage
        
        // Debug
//        int damage = 1000;  // HAX
        int damage = [self calcDamageOnTarget:theTarget];
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
        
        // add damage and hit indicators
        [hud addDamageIndicatorAt:theTarget.position amount:damage isCrit:criticalHit];
        [hud addHitIndicatorAt:theTarget.position];
        
        // apply skill effects
        [self applySkillEffectsToTarget:theTarget];
        
        // then apply skill status effects
        [self applyStatEffectsToTarget:theTarget];
    } else {
        // miss
        [hud addMissIndicatorAt:theTarget.position];
        NSLog(@"MISS");
        
        // Debug
//        [self dealDamageToTarget:theTarget damage:1000]; // HAX
    }
}

- (void) healTarget:(CombatEntity *)theTarget {
    // heal target
    int amount = [self healPercentTarget:theTarget amount:skills[skillType].damage];
        
    // add heal indicator
    [hud addHealIndicatorAt:theTarget.position amount:amount];
    
    // apply skill effects
    [self applySkillEffectsToTarget:theTarget];
    
    // then apply status effects
    [self applyStatEffectsToTarget:theTarget];
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

- (int) calcDamageOnTarget:(CombatEntity*)theTarget {
    double baseDamage = ((double)(stats[Strength].statValue * stats[Strength].statValue) / 32.0f + 32.0f) * skills[skillType].damage;
    
    double defenceReduction = (730.0f - ((double)[theTarget getStat:Defence].statValue * 51.0f - (double)([theTarget getStat:Defence].statValue * [theTarget getStat:Defence].statValue) / 11.0f) / 10.0f) / 730.0f;
    
    int finalDamage = baseDamage * defenceReduction;
    return finalDamage;
}

- (CombatEntity *) getRandomTargetForAlly:(BOOL)isAlly {
    CombatEntity *entity = nil;
    if (isAlly) {
        if ([battlefield.enemyEntities count] > 0) {
            entity = [battlefield getEnemyAtPosition:[Random intLessThan:CombatPositions]];
            while (!entity) {
                entity = [battlefield getEnemyAtPosition:[Random intLessThan:CombatPositions]];
            }
        }
    } else {
        if ([battlefield.allyEntities count] > 0) {
            entity = [battlefield getAllyAtPosition:[Random intLessThan:CombatPositions]];
            while (!entity) {
                entity = [battlefield getAllyAtPosition:[Random intLessThan:CombatPositions]];
            }
        }
    }
    
    return entity;
}

- (void) applyStatEffectsToTarget:(CombatEntity*)theTarget {
    for (StatEffect *effect in skills[skillType].statEffects) {
        if ([Random intLessThan:100] < effect.chance)
            [theTarget addStatEffect:effect];
    }
}

- (void) applySkillEffectsToTarget:(CombatEntity*)theTarget {
    for (int i = 0; i < SkillEffects; i++) {
        if ([skills[skillType] hasEffect:i]) {
            [self applySkillEffect:i toTarget:theTarget];
        }
    }
}

- (void) applySkillEffect:(SkillEffect)effect toTarget:(CombatEntity*)theTarget {
    Class statEffect;
    switch (effect) {
        case SkillEffectRemoveBuffs:
            statEffect = [Buff class];
            [self removeStatEffect:statEffect fromTarget:theTarget];
            break;
            
        case SkillEffectRemoveDebuffs:
            statEffect = [Debuff class];
            [self removeStatEffect:statEffect fromTarget:theTarget];
            break;
            
        case SkillEffectRemoveConditions:
            statEffect = [Condition class];
            [self removeStatEffect:statEffect fromTarget:theTarget];
            break;
            
        case SkillEffectIncreaseBuff:
            statEffect = [Buff class];
            [self changeDurationOfStatEffect:statEffect forTarget:theTarget increase:YES];
            break;
            
        case SkillEffectIncreaseDebuff:
            statEffect = [Debuff class];
            [self changeDurationOfStatEffect:statEffect forTarget:theTarget increase:YES];
            break;
            
        case SkillEffectDecreaseBuff:
            statEffect = [Buff class];
            [self changeDurationOfStatEffect:statEffect forTarget:theTarget increase:NO];
            break;
            
        case SkillEffectDecreaseDebuff:
            statEffect = [Debuff class];
            [self changeDurationOfStatEffect:statEffect forTarget:theTarget increase:NO];
            break;
            
        default:
            break;
    }
}

- (void) removeStatEffect:(Class)effect fromTarget:(CombatEntity*)theTarget {
    for (StatEffect *statEffect in theTarget.statEffects) {
        if ([statEffect isKindOfClass:effect]) {
            [statEffect deactivate];
        }
    }
}

- (void) changeDurationOfStatEffect:(Class)effect forTarget:(CombatEntity*)theTarget increase:(BOOL)increase {
    for (StatEffect *statEffect in theTarget.statEffects) {
        if ([statEffect isKindOfClass:effect]) {
            if (increase)
                [statEffect increaseDuration];
            else
                [statEffect decreaseDuration];
        }
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
        [self updateSkillType];
        
        // return combo dice
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
        
        Skill *skill = skills[skillType];
        
        // wait for attack to end
        if (!skill.duration.isAlive) {
            // and then deal the damage to targets and tell them to stop defending
            for (CombatEntity *entity in targets) {
                // check if skill heals
                if (skill.function == SkillFunctionHeal) {
                    [self healTarget:entity];
                } else {
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
                finishedAttacking = YES;
                skillType = NoSkill;
            }
        } else {
            [skill.duration updateWithGameTime:gameTime];
        }
    }
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

- (void) resetAttack {
    if (!stunned)
        finishedAttacking = NO;
}

- (void) stopDefending {
    state = EntityStateIdle;
}


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

- (BOOL) isOnlyStunnEffect:(Condition *)condition {
    for (StatEffect *effect in statEffects) {
        Condition *cond = [effect isKindOfClass:[Condition class]] ? (Condition *)effect : nil;
        if (cond && cond.type == ConditionTypeStun && cond != condition) {
            return false;
        }
    }
    
    return true;
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
