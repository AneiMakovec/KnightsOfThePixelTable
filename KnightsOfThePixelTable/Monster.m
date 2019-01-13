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

- (id) initMonster:(MonsterType)theMonster entityType:(StatType)theType health:(int)hp damageType:(DamageType)theDamageType damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius {
    self = [super initWithEntityType:theType health:hp damageType:theDamageType damageStrength:theDamageStrength maxRadius:theMaxRadius];
    if (self != nil) {
        type = theMonster;
        
        expWorth = 10;
        
        isTargeted = NO;
        
        dicesComming = 0;
    }
    return self;
}

@synthesize expWorth, type, isTargeted;



- (void) setCombatPosition:(CombatPosition)theCombatPosition {
    // invoke super method
    [super setCombatPosition:theCombatPosition ally:NO];
    
    // calc entity area
    entityArea = [[Rectangle alloc] initWithX:position.x-56 y:position.y-56 width:112 height:112];
}


- (BOOL) collidingWithItem:(id)item {
    Dice *dice = [item isKindOfClass:[Dice class]] ? (Dice *)item : nil;
    if (dice) {
        [dice resetTarget];
        [self addComboItem:dice];
        dicesComming--;
    }
    
    return [super collidingWithItem:item];
}


- (BOOL) addComboItem:(Dice *)theItem {
    if ([combo count] < ComboItems) {
        ComboSlot *comboSlot = [[ComboSlot alloc] initWithItem:theItem forPosition:combatPosition];
        [combo addObject:comboSlot];
        [comboSlot release];
        
        [self updateAttackType];
        
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
    // TODO
    return expWorth;
}

@end
