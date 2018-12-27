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

- (id) initMonster:(MonsterType)theMonster entityType:(StatType)theType health:(int)hp damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius {
    self = [super initWithEntityType:theType health:hp damageStrength:theDamageStrength maxRadius:theMaxRadius];
    if (self != nil) {
        type = theMonster;
        
        expWorth = 10;
    }
    return self;
}

@synthesize expWorth, type;



- (void) setCombatPosition:(CombatPosition)theCombatPosition {
    // invoke super method
    [super setCombatPosition:theCombatPosition ally:NO];
    
    // calc entity area
    entityArea = [[Rectangle alloc] initWithX:position.x-56 y:position.y-56 width:112 height:112];
}


- (BOOL) addComboItem:(Dice *)theItem {
    // TODO
    [self updateAttackType];
    
    return false;
}


- (int) giveExperience {
    // TODO
    return expWorth;
}

@end
