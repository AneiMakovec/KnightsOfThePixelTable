//
//  AIPlayer.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIPlayer : GameComponent {
    Level *level;
}

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel;

@end

NS_ASSUME_NONNULL_END
