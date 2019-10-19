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

- (id) initWithLevel:(Level*)theLevel gameHud:(GameHud*)theHud entityType:(StatType)theType health:(int)hp damageType:(DamageType)theDamageType maxRadius:(float)theMaxRadius {
    self = [super initWithHealth:hp];
    if (self != nil) {
        position = [[Vector2 alloc] init];
        velocity = [[Vector2 alloc] init];
        
        radius = 20;
        maxRadius = theMaxRadius;
        
        hud = theHud;
        level = theLevel;
        
        stunned = NO;
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

@synthesize position, velocity, radius, maxRadius, isTargeted, finishedAttacking, entityType, state, damageType, skillType, combatPosition, entityArea, origin, target, combo, hud, statEffects, stunned, targets;


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
    
//    // or wait for collision with attacking entity
//    if (state == EntityStateIdle) {
//        CombatEntity *entity = [item isKindOfClass:[CombatEntity class]] ? (CombatEntity *)item : nil;
//        if (entity) {
//            if (entity.state == EntityStateAttacking) {
//                state = EntityStateDefending;
//            }
//        }
//    }
    
    // or wait for collision with projectile
    if (state == EntityStateIdle) {
        Projectile *projectile = [item isKindOfClass:[Projectile class]] ? (Projectile *)item : nil;
        if (projectile) {
            // check if miss
            if (projectile.missed) {
                // miss
                [hud addMissIndicatorAt:position];
            } else {
                // take damage
                [self takeDamage:projectile.damage];
                
                // add damage and hit indicators
                [hud addDamageIndicatorAt:position amount:projectile.damage isCrit:projectile.wasCrit];
                [hud addHitIndicatorAt:position];
                
                // apply skill effects
                [self applySkillEffectsToTarget:self skill:projectile.skill];
                
                // then apply skill status effects
                [self applyStatEffectsToTarget:self skill:projectile.skill];
                
                // show hit animation
                [self startDefending];
            }
            
            // remove projectile from scene
            [level.scene removeItem:projectile];
        }
    }
    
    // ignore all
    return NO;
}



- (void) attackTarget:(CombatEntity *)theTarget ally:(BOOL)isAlly {
    // check if there are any enemies
    if ([level.battlefield hasAnyEnemyForAlly:isAlly]) {
        
        // check if not finished attacking
        if (!finishedAttacking) {
            // remove combo items
            [combo removeAllObjects];

            // check if it is healing skill or if skill is used on allies
            BOOL ignoreTarget = NO;
            if (skills[skillType].function == SkillFunctionHeal || skills[skillType].useOn == SkillUseOnAlly) {
                isAlly = !isAlly;
                ignoreTarget = YES;
            }
            
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
                        if (entity) {
                            target = [entity.origin retain];
                            [self addTarget:entity];
                        }
                    } else {
                        target = [theTarget.origin retain];
                        [self addTarget:theTarget];
                    }
                    break;
                    
                case SkillTargetRow:
                    if (isAlly) {
                        // check if has target
                        if (!ignoreTarget && theTarget) {
                            // check if target is in front row or back row
                            CombatPosition pos = [level.battlefield getCombatPositionOfEnemy:(Monster *)theTarget];
                            if (pos == FirstCombatPosition || pos == SecondCombatPosition) {
                                target = [level.battlefield.enemyFrontRow retain];
                                [self addTarget:[level.battlefield getEnemyAtPosition:FirstCombatPosition]];
                                [self addTarget:[level.battlefield getEnemyAtPosition:SecondCombatPosition]];
                            } else {
                                target = [level.battlefield.enemyBackRow retain];
                                [self addTarget:[level.battlefield getEnemyAtPosition:ThirdCombatPosition]];
                                [self addTarget:[level.battlefield getEnemyAtPosition:FourthCombatPosition]];
                            }
                        } else {
                            // check front row
                            if ([level.battlefield hasAnyEnemyInFrontRowForAlly:isAlly]) {
                                target = [level.battlefield.enemyFrontRow retain];
                                [self addTarget:[level.battlefield getEnemyAtPosition:FirstCombatPosition]];
                                [self addTarget:[level.battlefield getEnemyAtPosition:SecondCombatPosition]];
                            // check back row
                            } else if ([level.battlefield hasAnyEnemyInBackRowForAlly:isAlly]) {
                                target = [level.battlefield.enemyBackRow retain];
                                [self addTarget:[level.battlefield getEnemyAtPosition:ThirdCombatPosition]];
                                [self addTarget:[level.battlefield getEnemyAtPosition:FourthCombatPosition]];
                            }
                        }
                    } else {
                        if (!ignoreTarget && theTarget) {
                            // check if target is in front row or back row
                            CombatPosition pos = [level.battlefield getCombatPositionOfAlly:(Knight *)theTarget];
                            if (pos == FirstCombatPosition || pos == SecondCombatPosition) {
                                target = [level.battlefield.allyFrontRow retain];
                                [self addTarget:[level.battlefield getAllyAtPosition:FirstCombatPosition]];
                                [self addTarget:[level.battlefield getAllyAtPosition:SecondCombatPosition]];
                            } else {
                                target = [level.battlefield.allyBackRow retain];
                                [self addTarget:[level.battlefield getAllyAtPosition:ThirdCombatPosition]];
                                [self addTarget:[level.battlefield getAllyAtPosition:FourthCombatPosition]];
                            }
                        } else {
                            // check front row
                            if ([level.battlefield hasAnyEnemyInFrontRowForAlly:isAlly]) {
                                target = [level.battlefield.allyFrontRow retain];
                                [self addTarget:[level.battlefield getAllyAtPosition:FirstCombatPosition]];
                                [self addTarget:[level.battlefield getAllyAtPosition:SecondCombatPosition]];
                                // check back row
                            } else if ([level.battlefield hasAnyEnemyInBackRowForAlly:isAlly]) {
                                target = [level.battlefield.allyBackRow retain];
                                [self addTarget:[level.battlefield getAllyAtPosition:ThirdCombatPosition]];
                                [self addTarget:[level.battlefield getAllyAtPosition:FourthCombatPosition]];
                            }
                        }
                    }

                    // check back row
//                    if (isAlly) {
//                        target = [level.battlefield.enemyBackRow retain];
//                        [self addTarget:[level.battlefield getEnemyAtPosition:ThirdCombatPosition]];
//                        [self addTarget:[level.battlefield getEnemyAtPosition:FourthCombatPosition]];
//                    } else {
//                        target = [level.battlefield.allyBackRow retain];
//                        [self addTarget:[level.battlefield getAllyAtPosition:ThirdCombatPosition]];
//                        [self addTarget:[level.battlefield getAllyAtPosition:FourthCombatPosition]];
//                    }
                    break;
                    
                case SkillTargetAll:
                    // all
                    if (isAlly) {
                        target = [level.battlefield.enemyFrontRow retain];
                        [self addTarget:[level.battlefield getEnemyAtPosition:FirstCombatPosition]];
                        [self addTarget:[level.battlefield getEnemyAtPosition:SecondCombatPosition]];
                        [self addTarget:[level.battlefield getEnemyAtPosition:ThirdCombatPosition]];
                        [self addTarget:[level.battlefield getEnemyAtPosition:FourthCombatPosition]];
                    } else {
                        target = [level.battlefield.allyFrontRow retain];
                        [self addTarget:[level.battlefield getAllyAtPosition:FirstCombatPosition]];
                        [self addTarget:[level.battlefield getAllyAtPosition:SecondCombatPosition]];
                        [self addTarget:[level.battlefield getAllyAtPosition:ThirdCombatPosition]];
                        [self addTarget:[level.battlefield getAllyAtPosition:FourthCombatPosition]];
                    }
                    break;
                    
                default:
                    // single target
                    if (!theTarget) {
                        CombatEntity *entity = [self getRandomTargetForAlly:isAlly];
                        if (entity) {
                            target = [entity.origin retain];
                            [self addTarget:entity];
                        }
                    } else {
                        target = [theTarget.origin retain];
                        [self addTarget:theTarget];
                    }
                    break;
            }
            
            if ([targets count] != 0) {
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
            } else {
                [self cancelAttack];
            }
        }
    } else {
        [self cancelAttack];
    }
}


- (void) dealDamageToTargets {
    NSLog(@"My Strength stat is: %d", stats[Strength].statValue);
    
    for (CombatEntity *theTarget in targets) {
        // calculate if attack will miss
        if ([self calcChanceForSuccess:stats[Agility].statValue fail:[theTarget getStat:Accuracy].statValue]) {
            // hit
            NSLog(@"HIT");
            
            // calculate damage
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
            
            // check if skill is ranged
            if (skills[skillType].range == SkillRangeRanged) {
                Projectile *projectile = [[Projectile alloc] initWithSender:self target:theTarget skill:skills[skillType] damage:damage position:[Vector2 vectorWithX:position.x + 50 y:position.y] velocity:[Vector2 vectorWithX:(theTarget.position.x - position.x) * 3 y:(theTarget.position.y - position.y) * 3] radius:50 wasCrit:criticalHit missed:NO];
                [level.scene addItem:projectile];
                [projectile release];
            } else {
                // first deal damage
    //        damage = 1000;  // HAX
                [theTarget takeDamage:damage];
                
                // add damage and hit indicators
                [hud addDamageIndicatorAt:theTarget.position amount:damage isCrit:criticalHit];
                [hud addHitIndicatorAt:theTarget.position];
                
                // make the target show hit animation
                [theTarget startDefending];
                
                // apply skill effects
                [self applySkillEffectsToTarget:theTarget skill:skills[skillType]];
                
                // then apply skill status effects
                [self applyStatEffectsToTarget:theTarget skill:skills[skillType]];
            }
        } else {
            // miss
            
            if (skills[skillType].range == SkillRangeRanged) {
                Projectile *projectile = [[Projectile alloc] initWithSender:self target:theTarget skill:skills[skillType] damage:0 position:[Vector2 vectorWithX:position.x + 50 y:position.y] velocity:[Vector2 vectorWithX:(theTarget.position.x - position.x) * 3 y:(theTarget.position.y - position.y) * 3] radius:50 wasCrit:NO missed:YES];
                [level.scene addItem:projectile];
                [projectile release];
                NSLog(@"MISS");
            } else {
                [hud addMissIndicatorAt:theTarget.position];
                NSLog(@"MISS");
            }
            
            // Debug
//             [theTarget takeDamage:1000]; // HAX
        }
    }
}

- (void) healTargets {
    for (CombatEntity *theTarget in targets) {
        // heal target
        [theTarget heal:skills[skillType].damage];
        
        // add heal indicator
        [hud addHealIndicatorAt:theTarget.position amount:skills[skillType].damage];
        
        // apply skill effects
        [self applySkillEffectsToTarget:theTarget skill:skills[skillType]];
        
        // then apply status effects
        [self applyStatEffectsToTarget:theTarget skill:skills[skillType]];
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

- (int) calcDamageOnTarget:(CombatEntity*)theTarget {
    double baseDamage = ((double)(stats[Strength].statValue * stats[Strength].statValue) / 32.0f + 32.0f) * skills[skillType].damage;
    
    double defenceReduction = (730.0f - ((double)[theTarget getStat:Defence].statValue * 51.0f - (double)([theTarget getStat:Defence].statValue * [theTarget getStat:Defence].statValue) / 11.0f) / 10.0f) / 730.0f;
    
    int finalDamage = baseDamage * defenceReduction;
    return finalDamage;
}

- (CombatEntity *) getRandomTargetForAlly:(BOOL)isAlly {
    CombatEntity *entity = nil;
    if (isAlly) {
        if ([level.battlefield.enemyEntities count] > 0) {
            entity = [level.battlefield getEnemyAtPosition:[Random intLessThan:CombatPositions]];
            while (!entity) {
                entity = [level.battlefield getEnemyAtPosition:[Random intLessThan:CombatPositions]];
            }
        }
    } else {
        if ([level.battlefield.allyEntities count] > 0) {
            entity = [level.battlefield getAllyAtPosition:[Random intLessThan:CombatPositions]];
            while (!entity) {
                entity = [level.battlefield getAllyAtPosition:[Random intLessThan:CombatPositions]];
            }
        }
    }
    
    return entity;
}

- (void) applyStatEffectsToTarget:(CombatEntity*)theTarget skill:(Skill *)skill {
    for (StatEffect *effect in skill.statEffects) {
        if ([Random intLessThan:100] < effect.chance) {
            [theTarget addStatEffect:[StatEffectFactory createStatEffect:effect]];
            
            if ([effect isKindOfClass:[Buff class]]) {
                Buff *buff = (Buff *)effect;
                NSString *text = @"";
                switch (buff.type) {
                    case Strength:
                        text = @"Buff Strength";
                        break;
                    
                    case Agility:
                        text = @"Buff Agility";
                        break;
                        
                    case Defence:
                        text = @"Buff Defence";
                        break;
                        
                    case Accuracy:
                        text = @"Buff Accuracy";
                        break;
                        
                    case Cunning:
                        text = @"Buff Cunning";
                        break;
                        
                    case Sturdiness:
                        text = @"Buff Sturdiness";
                        break;
                        
                    default:
                        break;
                }
                
                [hud addTextIndicatorAt:theTarget.position text:text color:[Color cornflowerBlue]];
                [hud addBuffIndicatorAt:theTarget.position];
            } else if ([effect isKindOfClass:[Debuff class]]) {
                Debuff *debuff = (Debuff *)effect;
                NSString *text = @"";
                switch (debuff.type) {
                    case Strength:
                        text = @"Debuff Strength";
                        break;
                        
                    case Agility:
                        text = @"Debuff Agility";
                        break;
                        
                    case Defence:
                        text = @"Debuff Defence";
                        break;
                        
                    case Accuracy:
                        text = @"Debuff Accuracy";
                        break;
                        
                    case Cunning:
                        text = @"BDebuff Cunning";
                        break;
                        
                    case Sturdiness:
                        text = @"Debuff Sturdiness";
                        break;
                        
                    default:
                        break;
                }
                
                [hud addTextIndicatorAt:theTarget.position text:text color:[Color darkRed]];
                [hud addDebuffIndicatorAt:theTarget.position];
            } else if ([effect isKindOfClass:[Condition class]]) {
                Condition *cond = (Condition *)effect;
                NSString *text = @"";
                switch (cond.type) {
                    case ConditionTypeBurn:
                        text = @"Burned";
                        break;
                        
                    case ConditionTypeBleed:
                        text = @"Bleeding";
                        break;
                        
                    case ConditionTypeFrostbite:
                        text = @"Frostbitten";
                        break;
                        
                    case ConditionTypePoison:
                        text = @"Poisoned";
                        break;
                    
                    case ConditionTypeStun:
                        text = @"Stunned";
                        break;
                        
                    default:
                        break;
                }
                
                [hud addTextIndicatorAt:theTarget.position text:text color:[Color darkRed]];
            }
        }
    }
}

- (void) applySkillEffectsToTarget:(CombatEntity*)theTarget skill:(Skill *)skill {
    for (int i = 0; i < SkillEffects; i++) {
        if ([skill hasEffect:i]) {
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
        state = EntityStateDead;
    }

    
    // attack
    if (state == EntityStateAttacking) {
        
        Skill *skill = skills[skillType];
        
        // wait for attack to end
        if (!animations[state].isAlive) {
            // and then deal the damage to targets and tell them to stop defending
            // check if skill heals
            if (skill.function == SkillFunctionHeal) {
                [self healTargets];
            } else {
                [self dealDamageToTargets];
            }
            
            // release targets
            [target release];
            target = nil;
            [targets removeAllObjects];
                
            // then reset the animation
            [animations[state] reset];
            
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
        }
    }
    
    
    // hit
    if (state == EntityStateDefending) {
        if (!animations[state].isAlive) {
            [animations[state] reset];
            [self stopDefending];
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


- (void) addConditionAnimation:(ConditionType)condition {
    switch (condition) {
        case ConditionTypeBurn:
            [hud addBurnIndicatorAt:position];
            break;
            
        case ConditionTypeFrostbite:
            [hud addFrostbiteIndicatorAt:position];
            break;
        
        case ConditionTypeBleed:
            [hud addBleedIndicatorAt:position];
            break;
            
        case ConditionTypeStun:
            [hud addStunIndicatorAt:position target:self];
            break;
            
        case ConditionTypePoison:
            [hud addPoisonIndicatorAt:position];
            break;
            
        default:
            break;
    }
    
    [self startDefending];
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

- (void) startDefending {
    state = EntityStateDefending;
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


- (void) addTarget:(CombatEntity *)entity {
    if (entity && entity.state != EntityStateDead) {
        [targets addObject:entity];
    }
}


- (AnimatedSprite *) getCurrentAnimation {
    return animations[state];
}


- (void) cancelAttack {
    [combo removeAllObjects];
    skillType = NoSkill;
    [targets removeAllObjects];
    if (target) {
        [target release];
        target = nil;
    }
    state = EntityStateIdle;
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
    [statEffects release];
    
    [super dealloc];
}

@end
