//
//  MetaData.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MetaData : NSObject {
    int width;
    int height;
    int step;
    int max;
}

@property (nonatomic, readonly) int width;
@property (nonatomic, readonly) int height;
@property (nonatomic, readonly) int step;
@property (nonatomic, readonly) int max;

- (id) initWithWidth:(int)theWidth height:(int)theHeight;
- (id) initWithStep:(int)theStep;
- (id) initWithStep:(int)theStep max:(int)theMax;
- (id) initWithStep:(int)theStep width:(int)theWidth height:(int)theHeight;

@end

NS_ASSUME_NONNULL_END
