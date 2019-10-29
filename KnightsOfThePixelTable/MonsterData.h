//
//  MonsterData.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

#import "EntityData.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonsterData : EntityData {
    MonsterType type;
}

@property (nonatomic, readonly) MonsterType type;

- (id) initWithType:(MonsterType)monsterType lvl:(Lvl)level;

@end

NS_ASSUME_NONNULL_END
