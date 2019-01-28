//
//  MonsterBossViking.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"
#import "Monster.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonsterBossViking : Monster

- (id) initWithBattlefield:(Battlefield*)theBattlefield gameHud:(GameHud*)hud;

@end

NS_ASSUME_NONNULL_END
