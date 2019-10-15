//
//  GraphicsImporter.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 15/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "GraphicsImporter.h"

#import "Retronator.Xni.Framework.Content.h"

GraphicsImporter *importerInstance;

@implementation GraphicsImporter

+ (void) initializeWithGame:(Game *)game {
    importerInstance = [[GraphicsImporter alloc] initWithGame:game];
    [importerInstance initializeData];
}

+ (Rectangle *) getSourceRectangleByKey:(NSString *)key {
    return [importerInstance getSourceRectangleByKey:key];
}

+ (Rectangle *) getOffsetRectangleByKey:(NSString *)key {
    return [importerInstance getOffsetRectangleByKey:key];
}

+ (BOOL) isTrimmedByKey:(NSString *)key {
    return [importerInstance isTrimmedByKey:key];
}

+ (Texture2D *) getTextureByKey:(NSString *)key {
    return [importerInstance getTextureByKey:key];
}








- (Texture2D *) getTextureByKey:(NSString *)key {
    if ([[data_0 allKeys] containsObject:key]) {
        return spriteSheet_0;
    } else if ([[data_1 allKeys] containsObject:key]) {
        return spriteSheet_1;
    } else {
        return nil;
    }
}

- (BOOL) isTrimmedByKey:(NSString *)key {
    if ([[data_0 allKeys] containsObject:key]) {
        return [[[data_0 objectForKey:key] valueForKey:@"trimmed"] boolValue];
    } else if ([[data_1 allKeys] containsObject:key]) {
        return [[[data_1 objectForKey:key] valueForKey:@"trimmed"] boolValue];
    } else {
        return nil;
    }
}


- (Rectangle *) getOffsetRectangleByKey:(NSString *)key {
    NSDictionary *offsetData;
    NSDictionary *originalSize;
    if ([[data_0 allKeys] containsObject:key]) {
        offsetData = [[data_0 objectForKey:key] objectForKey:@"spriteSourceSize"];
        originalSize = [[data_0 objectForKey:key] objectForKey:@"sourceSize"];
    } else if ([[data_1 allKeys] containsObject:key]) {
        offsetData = [[data_1 objectForKey:key] objectForKey:@"spriteSourceSize"];
        originalSize = [[data_1 objectForKey:key] objectForKey:@"sourceSize"];
    } else {
        return nil;
    }
    
    Rectangle *offsetRect = [[[Rectangle alloc] initWithX:[[offsetData valueForKey:@"x"] intValue] y:[[offsetData valueForKey:@"y"] intValue] width:[[originalSize valueForKey:@"w"] intValue] height:[[originalSize valueForKey:@"h"] intValue]] autorelease];
    
    return offsetRect;
}

- (Rectangle *) getSourceRectangleByKey:(NSString *)key {
    NSDictionary *sourceData;
    if ([[data_0 allKeys] containsObject:key]) {
        sourceData = [[data_0 objectForKey:key] objectForKey:@"frame"];
    } else if ([[data_1 allKeys] containsObject:key]) {
        sourceData = [[data_1 objectForKey:key] objectForKey:@"frame"];
    } else {
        return nil;
    }
    
    Rectangle *sourceRect = [[[Rectangle alloc] initWithX:[[sourceData valueForKey:@"x"] intValue] y:[[sourceData valueForKey:@"y"] intValue] width:[[sourceData valueForKey:@"w"] intValue] height:[[sourceData valueForKey:@"h"] intValue]] autorelease];
    
    return sourceRect;
}

- (void) initializeData {
    // load JSON
    data_0 = [[[self loadData:SPRITESHEET_0] objectForKey:@"frames"] retain];
    data_1 = [[[self loadData:SPRITESHEET_1] objectForKey:@"frames"] retain];
    
    // load textures
    spriteSheet_0 = [self.game.content load:SPRITESHEET_0];
    spriteSheet_1 = [self.game.content load:SPRITESHEET_1];
}

- (NSDictionary *) loadData:(NSString *)file {
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
