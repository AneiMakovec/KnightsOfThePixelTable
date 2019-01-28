//
//  KnightBrawler.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 17/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"
#import "Knight.h"

NS_ASSUME_NONNULL_BEGIN

@interface KnightBrawler : Knight

- (id) initWithBattlefield:(Battlefield*)theBattlefield gameHud:(GameHud*)hud;

@end

NS_ASSUME_NONNULL_END
