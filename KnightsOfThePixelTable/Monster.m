//
//  Monster.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Pixlron.Knights.h"
#import "Monster.h"

#define BERSERKER @"normal/berserker/"
#define HUSCARL @"normal/huscarl/"
#define HORNBEARER @"normal/hornbearer/"
#define AXETHROWER @"normal/axethrower/"
#define SLAVER @"normal/slaver/"
#define SLINGER @"normal/slinger/"
#define RUNEMASTER @"normal/runemaster/"
#define SORCERER @"normal/sorcerer/"
#define SHAMAN @"normal/shaman/"
#define BOSS_FARMLANDS @"boss/farmlands/"
#define BOSS_PINEWOODS @"boss/pinewoods/"
#define BOSS_MOUNTAINS @"boss/mountains/"
#define BOSS_SEASHORE @"boss/seashore/"

#define ACTION_ANIM @"action/"
#define IDLE_ANIM @"idle/"
#define HIT_ANIM @"hit/"
#define ATTACK_ANIM @"attack/"
#define DEATH_ANIM @"death/"

@implementation Monster

- (id) initWithData:(MonsterData *)data cobatPosition:(CombatPosition)combPos {
    self = [super initWithData:data];
    if (self != nil) {
//        type = theMonster;
//        expType = theExpType;

        dicesComming = 0;
        
        // init animations
        NSString *animKey = GAMEPLAY_MENU_ENTITIES_ENEMIES;
        NSString *entityKeys[MonsterTypes] = {BERSERKER, HUSCARL, HORNBEARER, AXETHROWER, SLAVER, SLINGER, RUNEMASTER, SORCERER, SHAMAN, BOSS_FARMLANDS, BOSS_PINEWOODS, BOSS_MOUNTAINS, BOSS_SEASHORE};
        NSString *animationKeys[AnimationTypes] = {IDLE_ANIM, HIT_ANIM, DEATH_ANIM, ATTACK_ANIM, ACTION_ANIM};
        for (int i = 0; i < AnimationTypes; i++) {
            if (data.type == MonsterTypeAxethrower || data.type == MonsterTypeBerserker || data.type == MonsterTypeRunemaster || data.type == MonsterTypeShaman || data.type == MonsterTypeSorcerer || data.type == MonsterTypeBossMountains) {
                if (i == AnimationTypeAction) {
                    animations[i] = [GraphicsComponent getAnimatedSpriteWithKey:[animKey stringByAppendingString:[entityKeys[data.type] stringByAppendingString:ATTACK_ANIM]]];
                } else {
                    animations[i] = [GraphicsComponent getAnimatedSpriteWithKey:[animKey stringByAppendingString:[entityKeys[data.type] stringByAppendingString:animationKeys[i]]]];
                }
            } else {
                animations[i] = [GraphicsComponent getAnimatedSpriteWithKey:[animKey stringByAppendingString:[entityKeys[data.type] stringByAppendingString:animationKeys[i]]]];
            }
        }
        
        // init position
        NSString *posKey = POSITION_GAMEPLAY_COMBAT_POSITION_ENEMIES;
        position = [[Constants getPositionDataForKey:[posKey stringByAppendingString:[NSString stringWithFormat:@"%d", combPos]]] retain];
        
        // init move points
        origin = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:position.x y:position.y] radius:5];
        attackPosition = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:position.x - 80 y:position.y] radius:5];
    }
    return self;
}

//@synthesize type, hpPoolArea, hpArea;



//- (void) setCombatPosition:(CombatPosition)theCombatPosition {
//    // invoke super method
//    [super setCombatPosition:theCombatPosition ally:NO];
//
//    // calc entity area
//    entityArea = [[Rectangle alloc] initWithX:position.x-56 y:position.y-56 width:112 height:112];
//
//    // calc hpPoolArea
//    hpPoolArea = [[Rectangle alloc] initWithX:origin.position.x - 40 y:origin.position.y - 30 width:80 height:12];
//    hpArea = [[Rectangle alloc] initWithX:origin.position.x - 29 y:origin.position.y - 30 width:69 height:12];
//    maxHpWidth = hpArea.width;
//    
//    // move outside the view
//    position.x += 500;
//    position.y += 50;
//
//    // move to origin
//    state = EntityStateStart;
//    radius = 1;
//    velocity.x = (origin.position.x - position.x) * 2;
//    velocity.y = (origin.position.y - position.y) * 2;
//}


- (BOOL) collidingWithItem:(id)item {
    // check if collision with combo dice
    Dice *dice = [item isKindOfClass:[Dice class]] ? (Dice *)item : nil;
    if (dice) {
        [dice resetTarget];
        [self addComboItem:dice];
        dicesComming--;
    }
    
    // check with collision with origin point
    if (state == EntityStateStart) {
        BattlePosition *start = [item isKindOfClass:[BattlePosition class]] ? (BattlePosition *)item : nil;
        if (start && start == origin) {
            state = EntityStateIdle;
            skillType = NoSkill;
            [velocity set:[Vector2 zero]];
        }
    }
    
    // invoke super method
    return [super collidingWithItem:item];
}


//- (BOOL) addComboItem:(Dice *)theItem {
//    if ([combo count] < ComboItems) {
//        // add combo item
//        ComboSlot *comboSlot = [[ComboSlot alloc] initWithItem:theItem forPosition:combatPosition];
//        [combo addObject:comboSlot];
//        [comboSlot release];
//
//        // update attack/skill
//        [self updateSkillType];
//
//        return YES;
//    } else {
//        return NO;
//    }
//}

- (BOOL) areDicesComming {
    return dicesComming > 0;
}

- (void) newDiceComming {
    dicesComming++;
}

//- (int) giveExperience {
//    switch (expType) {
//        case ExpTypeNormal:
//            return [Constants expGainNormal];
//        case ExpTypeElite:
//            return [Constants expGainElite];
//        case ExpTypeBoss:
//            return [Constants expGainBoss];
//
//        default:
//            return 0;
//    }
//}


- (void) updateWithGameTime:(GameTime *)gameTime {
    // invoke super method
    [super updateWithGameTime:gameTime];
    
    // then update health
//    hpArea.width = (maxHpWidth * currentHealthPoints) / maxHealthPoints;
//
//    // move the health bar
//    hpPoolArea.x = position.x - 40;
//    hpPoolArea.y = position.y - 30;
//
//    hpArea.x = position.x - 29;
//    hpArea.y = position.y - 30;
//
//    // death
//    if (state == EntityStateDead) {
//        if (!animations[state].isAlive) {
//            [level.battlefield removeEnemy:self];
//        }
//    }
}

- (void) dealloc {
//    [hpPoolArea release];
    
    [super dealloc];
}

@end
