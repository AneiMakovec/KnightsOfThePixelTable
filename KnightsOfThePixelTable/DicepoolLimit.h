//
//  DicepoolLimit.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Math.h"
#import "PixEngine.Scene.Objects.h"

NS_ASSUME_NONNULL_BEGIN

@interface DicepoolLimit : NSObject <IAAHalfPlaneCollider> {
    AAHalfPlane *aaHalfPlane;
}

- (id) initWithLimit:(AAHalfPlane *)theLimit;

@end

NS_ASSUME_NONNULL_END
