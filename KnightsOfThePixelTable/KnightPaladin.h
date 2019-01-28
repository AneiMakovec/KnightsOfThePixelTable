//
//  KnightPaladin.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"
#import "Knight.h"

NS_ASSUME_NONNULL_BEGIN

@interface KnightPaladin : Knight

- (id) initWithLevel:(Level*)theLevel gameHud:(GameHud*)hud;

@end

NS_ASSUME_NONNULL_END
