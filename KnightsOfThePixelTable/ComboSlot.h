//
//  ComboSlot.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 22/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"


NS_ASSUME_NONNULL_BEGIN

@interface ComboSlot : NSObject {
    Rectangle *area;
    Dice *item;
    
    CombatPosition entityPosition;
}

@property (nonatomic, retain) Rectangle *area;
@property (nonatomic, retain) Dice *item;

- (id) initWithItem:(Dice *)theItem forPosition:(CombatPosition)thePosition inSlot:(ComboItem)theSlot;

- (id) initWithItem:(Dice *)theItem forPosition:(CombatPosition)thePosition;

- (void) setSlot:(ComboItem)theSlot;

- (void) changeToSlot:(ComboItem)theSlot;

- (void) addItem:(Dice *)theItem;

- (Dice *) removeItem;

@end

NS_ASSUME_NONNULL_END
