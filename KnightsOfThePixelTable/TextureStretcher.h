//
//  TextureStretcher.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextureStretcher : NSObject {
    float fromWidth;
    float fromHeight;
    float toWidth;
    float toHeight;
    int xOffset;
    int yOffset;
}

- (id) initFromWidth:(float)widthFrom fromHeight:(float)heightFrom toWidth:(float)widthTo toHeight:(float)heightTo xOffset:(int)theXoffset yOffset:(int)theYoffset;

- (void) scaleVector:(Vector2 *)theVector;

- (void) scalePosition:(Vector2 *)thePosition;

- (void) scaleSize:(Vector2 *)theSize;

+ (void) scaleVector:(Vector2 *)theVector fromWidth:(float)widthFrom fromHeight:(float)heightFrom toWidth:(float)widthTo toHeight:(float)heightTo;

+ (float) scaleX:(float)theX fromWidth:(float)widthFrom toWidth:(float)widthTo;

+ (float) scaleY:(float)theY fromHeight:(float)heightFrom toHeight:(float)heightTo;

@end

NS_ASSUME_NONNULL_END
