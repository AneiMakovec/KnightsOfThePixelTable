//
//  Knight.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Knight.h"

#import "Pixlron.Knights.h"

@implementation Knight

- (id) initKnight:(KnightType)theKnight health:(int)hp damageStrength:(float)theDamageStrength maxRadius:(float)theMaxRadius {
    self = [super initWithHealth:hp damageStrength:theDamageStrength maxRadius:theMaxRadius];
    if (self != nil) {
        maxLevel = 80;
        currentLevel = 1;
        exp = 0;
        
        type = theKnight;
    }
    return self;
}

@synthesize maxLevel, currentLevel, exp, type, comboArea, portraitArea, skillArea;



- (void) setCombatPosition:(CombatPosition)theCombatPosition {
    // invoce super method
    [super setCombatPosition:theCombatPosition ally:YES];
    
    
    // calc entity area
    entityArea = [[Rectangle alloc] initWithX:[Constants areaXOfAlly:combatPosition] y:[Constants areaYOfAlly:combatPosition] width:[Constants allyAreaWidth] height:[Constants allyAreaHeight]];
    [[ScreenComponent getScale:@"hud"] scaleRectangle:entityArea];
    
    // calc combo area
    comboArea = [[Rectangle alloc] initWithX:[Constants comboAreaXOfAlly:combatPosition] y:[Constants comboAreaYOfAlly:combatPosition] width:[Constants comboAreaWidth] height:[Constants comboAreaHeight]];
    [[ScreenComponent getScale:@"hud"] scaleRectangle:comboArea];
    
//    // calc combo slot areas and add combos
//    for (int i = 0; i < ComboItems; i++) {
//        ComboSlot *comboSlot = [[ComboSlot alloc] initForPosition:combatPosition inSlot:i];
//        [combo insertObject:comboSlot atIndex:i];
//    }
    
    // calc skill area
    skillArea = [[Rectangle alloc] initWithX:[Constants skillXOfAlly:combatPosition] y:[Constants skillYOfAlly:combatPosition] width:[Constants skillSize] height:[Constants skillSize]];
    [[ScreenComponent getScale:@"hud"] scaleRectangle:skillArea];
    
    // calc portrait area
    portraitArea = [[Rectangle alloc] initWithX:[Constants portraitXOfAlly:combatPosition] y:[Constants portraitYOfAlly:combatPosition] width:[Constants portraitSize] height:[Constants portraitSize]];
    [[ScreenComponent getScale:@"hud"] scaleRectangle:portraitArea];
}


- (BOOL) addComboItem:(Dice *)theItem {
    if ([combo count] < ComboItems) {
        ComboSlot *comboSlot = [[ComboSlot alloc] initWithItem:theItem forPosition:combatPosition inSlot:[combo count]];
        [combo addObject:comboSlot];
        return YES;
    } else {
        return NO;
    }
}


- (void) gainExperience:(int)theExp {
    exp += theExp;
    
    // MARK: TODO: calculate if gained enough experiance to level up
    
}

- (void) levelUp {
    if (currentLevel < maxLevel) {
        currentLevel++;
    }
}

@end
