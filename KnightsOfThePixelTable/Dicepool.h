//
//  Dicepool.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PixEngine.Graphics.h"
#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface Dicepool : NSObject {
    // level
    Level *level;
    
    // objects
    NSMutableArray *dices;
    NSMutableArray *borders;
    
    // area
    Rectangle *dicepoolArea;
}

@property (nonatomic, retain) NSMutableArray *dices;
@property (nonatomic, retain) NSMutableArray *borders;
@property (nonatomic, retain) Rectangle *dicepoolArea;

- (id) initWithLevel:(Level *)theLevel;

- (void) addDicesOfType:(DiceFrameType)diceType;

- (void) removeDices;

@end

NS_ASSUME_NONNULL_END
