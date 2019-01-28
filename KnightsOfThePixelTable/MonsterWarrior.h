//
//  MonsterWarrior.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 23/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pixlron.Knights.classes.h"
#import "Monster.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonsterWarrior : Monster

- (id) initWithLevel:(Level*)theLevel gameHud:(GameHud*)hud;

@end

NS_ASSUME_NONNULL_END
