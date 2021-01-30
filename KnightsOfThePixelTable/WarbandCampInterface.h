//
//  WarbandCampInterface.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

#import "PixEngine.GUI.h"

typedef enum {
    FirstWarbandSlot,
    SecondWarbandSlot,
    ThirdWarbandSlot,
    FourthWarbandSlot,
    WarbandSlotTypes
} WarbandSlotType;

NS_ASSUME_NONNULL_BEGIN

@interface WarbandCampInterface : GuiPanel {
    Rooster *rooster;
    
    Image *backImage;
    
    RadioButtonGroup *slots;
    ImageRadioButton *warbandSlots[CombatPositions];
    
    AnimatedImage *knightAnimations[CombatPositions][KnightTypes];
    
    KnightType currentTypes[CombatPositions];
    NSString *knightIDs[CombatPositions];
}

- (id) initWithLayerDepth:(float)depth rooster:(Rooster *)theRooster;

- (void) update;

- (void) reset;

@end

NS_ASSUME_NONNULL_END
