//
//  GraphicsImporter.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 15/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Graphics.h"

#import "KOTPTEnums.h"

NS_ASSUME_NONNULL_BEGIN

@interface GraphicsImporter : GameComponent {
    NSDictionary *data_0;
    NSDictionary *data_1;
    
    Texture2D *spriteSheet_0;
    Texture2D *spriteSheet_1;
}

+ (void) initializeWithGame:(Game *)game;

+ (Rectangle *) getSourceRectangleByKey:(NSString *)key;

+ (Rectangle *) getOffsetRectangleByKey:(NSString *)key;

+ (BOOL) isTrimmedByKey:(NSString *)key;

+ (Texture2D *) getTextureByKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
