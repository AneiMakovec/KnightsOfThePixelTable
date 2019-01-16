//
//  Monster.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Pixlron.Knights.h"
#import "Monster.h"

@implementation Monster

- (id) initMonster:(MonsterType)theMonster gameHud:(GameHud*)theHud expType:(ExpType)theExpType entityType:(StatType)theType health:(int)hp damageType:(DamageType)theDamageType damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius {
    self = [super initWithGameHud:(GameHud*)theHud entityType:theType health:hp damageType:theDamageType damageStrength:theDamageStrength maxRadius:theMaxRadius];
    if (self != nil) {
        type = theMonster;
        expType = theExpType;

        dicesComming = 0;
    }
    return self;
}

@synthesize type;



- (void) setCombatPosition:(CombatPosition)theCombatPosition {
    // invoke super method
    [super setCombatPosition:theCombatPosition ally:NO];
    
    // calc entity area
    entityArea = [[Rectangle alloc] initWithX:position.x-56 y:position.y-56 width:112 height:112];
}


- (BOOL) collidingWithItem:(id)item {
    // check if collision with combo dice
    Dice *dice = [item isKindOfClass:[Dice class]] ? (Dice *)item : nil;
    if (dice) {
        [dice resetTarget];
        [self addComboItem:dice];
        dicesComming--;
    }
    
    // invoke super method
    return [super collidingWithItem:item];
}


- (BOOL) addComboItem:(Dice *)theItem {
    if ([combo count] < ComboItems) {
        // add combo item
        ComboSlot *comboSlot = [[ComboSlot alloc] initWithItem:theItem forPosition:combatPosition];
        [combo addObject:comboSlot];
        [comboSlot release];
        
        // update attack/skill
        [self updateSkillType];
        
        return YES;
    } else {
        return NO;
    }
}

- (BOOL) areDicesComming {
    return dicesComming > 0;
}

- (void) newDiceComming {
    dicesComming++;
}

- (int) giveExperience {
    switch (expType) {
        case ExpTypeNormal:
            return [Constants expGainNormal];
        case ExpTypeElite:
            return [Constants expGainElite];
        case ExpTypeBoss:
            return [Constants expGainBoss];
            
        default:
            return 0;
    }
}

@end
