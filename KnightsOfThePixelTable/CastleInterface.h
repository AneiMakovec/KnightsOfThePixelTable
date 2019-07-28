//
//  CastleInterface.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 25/06/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Interface.h"

NS_ASSUME_NONNULL_BEGIN

@interface CastleInterface : Interface {
    Image *map;
    
    Label *progression;
    Label *progressionAmount;
}

@end

NS_ASSUME_NONNULL_END
