//
//  ComboSlot.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 22/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "ComboSlot.h"

#import "Pixlron.Knights.h"

@implementation ComboSlot

- (id) initWithItem:(Dice *)theItem forPosition:(CombatPosition)thePosition inSlot:(ComboItem)theSlot {
    self = [super init];
    if (self != nil) {
        item = [theItem retain];
        entityPosition = thePosition;
        
        if (theSlot == NoCombo) {
            area = nil;
        } else {
            area = [[Rectangle alloc] initWithX:[Constants comboAreaXOfAlly:thePosition atPosition:theSlot] y:[Constants comboAreaYOfAlly:thePosition atPosition:theSlot] width:[Constants separateComboAreaSize] height:[Constants separateComboAreaSize]];
            //[[ScreenComponent getScale:@"hud"] scaleRectangle:area];
        }
    }
    return self;
}

- (id) initWithItem:(Dice *)theItem forPosition:(CombatPosition)thePosition {
    self = [super init];
    if (self != nil) {
        entityPosition = thePosition;
        
        item = [theItem retain];
        area = nil;
    }
    return self;
}

@synthesize area, item;


- (void) setSlot:(ComboItem)theSlot {
    if (!area) {
        if (theSlot != NoCombo) {
            area = [[Rectangle alloc] initWithX:[Constants comboAreaXOfAlly:entityPosition atPosition:theSlot] y:[Constants comboAreaYOfAlly:entityPosition atPosition:theSlot] width:[Constants separateComboAreaSize] height:[Constants separateComboAreaSize]];
        }
    }
}

- (void) changeToSlot:(ComboItem)theSlot {
    if (theSlot != NoCombo) {
        area.x = [Constants comboAreaXOfAlly:entityPosition atPosition:theSlot];
        area.y = [Constants comboAreaYOfAlly:entityPosition atPosition:theSlot];
        area.width = [Constants separateComboAreaSize];
        area.height = [Constants separateComboAreaSize];
    }
}

- (void) addItem:(Dice *)theItem {
    item = theItem;
    [item retain];
}

- (Dice *) removeItem {
    Dice *dice = item;
    [dice retain];
    
    [item release];
    item = nil;
    
    return dice;
}

- (void) dealloc {
    [area release];
    [item release];
    [super dealloc];
}

@end
