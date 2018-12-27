//
//  AIPlayer.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pixlron.Knights.classes.h"
#import "IPlayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIPlayer : GameComponent<IPlayer> {
    Level *level;
    
    CombatEntity *target;
    
    BOOL myTurn;
}

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel;

@end

NS_ASSUME_NONNULL_END
