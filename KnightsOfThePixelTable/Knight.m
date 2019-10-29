//
//  Knight.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Knight.h"

#import "Pixlron.Knights.h"

#define BRAWLER @"brawler/"
#define PALADIN @"paladin/"
#define BARD @"bard/"
#define LONGBOWMAN @"longbowman/"
#define CROSSBOWMAN @"crossbowman/"
#define SCOUT @"scout/"
#define BATTLEMAGE @"battlemage/"
#define WIZARD @"wizard/"
#define MONK @"monk/"

#define ACTION_ANIM @"action/"
#define IDLE_ANIM @"idle/"
#define HIT_ANIM @"hit/"
#define ATTACK_ANIM @"attack/"
#define DEATH_ANIM @"death/"

@implementation Knight

- (id) initWithData:(KnightData *)data cobatPosition:(CombatPosition)combPos {
    self = [super initWithData:data];
    if (self != nil) {
//        maxLevel = 50;
//        currentLevel = 1;
//        exp = 0;

        // init animations
        NSString *animKey = GAMEPLAY_MENU_ENTITIES_ALLIES;
        NSString *entityKeys[KnightTypes] = {BRAWLER, PALADIN, BARD, LONGBOWMAN, CROSSBOWMAN, SCOUT, BATTLEMAGE, WIZARD, MONK};
        NSString *animationKeys[AnimationTypes] = {IDLE_ANIM, HIT_ANIM, DEATH_ANIM, ATTACK_ANIM, ACTION_ANIM};
        for (int i = 0; i < AnimationTypes; i++) {
            if (data.type == KnightTypeBrawler || data.type == KnightTypeLongbowman || data.type == KnightTypeWizard || data.type == KnightTypeMonk) {
                if (i == AnimationTypeAction) {
                    animations[i] = [GraphicsComponent getAnimatedSpriteWithKey:[animKey stringByAppendingString:[entityKeys[data.type] stringByAppendingString:ATTACK_ANIM]]];
                }
            }
            
            animations[i] = [GraphicsComponent getAnimatedSpriteWithKey:[animKey stringByAppendingString:[entityKeys[data.type] stringByAppendingString:animationKeys[i]]]];
        }
        
        // init position
        NSString *posKey = POSITION_GAMEPLAY_COMBAT_POSITION_ALLIES;
        position = [[Constants getPositionDataForKey:[posKey stringByAppendingString:[NSString stringWithFormat:@"%d", combPos]]] retain];
        
        // init move points
        origin = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:position.x y:position.y] radius:5];
        attackPosition = [[BattlePosition alloc] initWithPosition:[Vector2 vectorWithX:position.x + 80 y:position.y] radius:5];
    }
    return self;
}

//@synthesize comboArea, portraitArea, skillArea, hpPoolArea;



- (void) setCombatPosition:(CombatPosition)theCombatPosition {
    // invoke super method
    [super setCombatPosition:theCombatPosition ally:YES];
    
    
    // calc entity area
    entityArea = [[Rectangle alloc] initWithX:[Constants areaXOfAlly:combatPosition] y:[Constants areaYOfAlly:combatPosition] width:[Constants allyAreaWidth] height:[Constants allyAreaHeight]];
    
//    // calc combo area
//    comboArea = [[Rectangle alloc] initWithX:[Constants comboAreaXOfAlly:combatPosition] y:[Constants comboAreaYOfAlly:combatPosition] width:[Constants comboAreaWidth] height:[Constants comboAreaHeight]];
//
//    // calc hp pool area
//    hpPoolArea = [[Rectangle alloc] initWithX:[Constants hpPoolXOfAlly:combatPosition] y:[Constants hpPoolYOfAlly:combatPosition] width:[Constants hpPoolWidth] height:[Constants hpPoolHeight]];
//
//    maxHpWidth = hpPoolArea.width;
//
//    // calc skill area
//    skillArea = [[Rectangle alloc] initWithX:[Constants skillXOfAlly:combatPosition] y:[Constants skillYOfAlly:combatPosition] width:[Constants skillSize] height:[Constants skillSize]];
//
//    // calc portrait area
//    portraitArea = [[Rectangle alloc] initWithX:[Constants portraitXOfAlly:combatPosition] y:[Constants portraitYOfAlly:combatPosition] width:[Constants portraitSize] height:[Constants portraitSize]];
}


- (BOOL) addComboItem:(Dice *)theItem {
    if (!finishedAttacking && [combo count] < ComboItems) {
        // add combo item
        ComboItem slotPosition = (ComboItem) [combo count];
        ComboSlot *comboSlot = [[ComboSlot alloc] initWithItem:theItem forPosition:combatPosition inSlot:slotPosition];
        [combo addObject:comboSlot];
        [comboSlot release];
        
        // update attack/skill
        [self updateSkillType];
        
        return YES;
    } else {
        return NO;
    }
}

- (Dice *) removeComboAtTouchLocation:(Vector2 *)touchLocation {
    for (int i = 0; i < [combo count]; i++) {
        // check which combo item was selected
        ComboSlot *slot = [combo objectAtIndex:i];
        if ([slot.area containsX:touchLocation.x y:touchLocation.y]) {
            // and remove it
            return [self removeCombo:i];
        }
    }
    
    return nil;
}


//- (void) gainExperience:(int)theExp {
//    if (currentLevel < maxLevel) {
//        exp += theExp;
//        currentExp += theExp;
//    }
//}

//- (void) levelUp {
//    if (currentLevel < maxLevel) {
//        // Calculate if gained enough experiance to level up
//        int requiredExp = (currentLevel + 1) * [Constants requiredExpToLvlUp];
//        while (currentExp >= requiredExp) {
//            // reset current exp
//            currentExp = currentExp - requiredExp;
//
//            // level up
//            currentLevel++;
//
//            // upgrade stats
//            for (int i = 0; i < StatTypes; i++) {
//                [stats[i] upgrade];
//            }
//
//            // keep checking if enough experience to level up
//            requiredExp = (currentLevel + 1) * [Constants requiredExpToLvlUp];
//        }
//    }
//}


- (void) updateWithGameTime:(GameTime *)gameTime {
    // invoke super method to update movement
    [super updateWithGameTime:gameTime];
    
    // then update health
//    hpPoolArea.width = (maxHpWidth * currentHealthPoints) / maxHealthPoints;
    
    // death
    if (state == EntityStateDead) {
        if (!animations[state].isAlive) {
            [level.battlefield removeAlly:self];
        }
    }
}


- (void) dealloc {
//    [portraitArea release];
//    [skillArea release];
//    [comboArea release];
//    [hpPoolArea release];
    [super dealloc];
}

@end
