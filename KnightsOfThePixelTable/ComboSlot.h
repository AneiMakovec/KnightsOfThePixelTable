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
}

@property (nonatomic, retain) Rectangle *area;
@property (nonatomic, retain) Dice *item;

- (id) initWithArea:(Rectangle *)theArea;

@end

NS_ASSUME_NONNULL_END
