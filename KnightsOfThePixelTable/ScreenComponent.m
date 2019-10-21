//
//  ScreenComponent.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 23/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "ScreenComponent.h"

#import "Constants.h"

ScreenComponent *screenComponentInstance;

@implementation ScreenComponent

+ (void) initializeWithGame:(Game *)game screenWidth:(int)width screenHeight:(int)height {
    screenComponentInstance = [[ScreenComponent alloc] initWithGame:game screenWidth:width screenHeight:height];
    [game.components addComponent:screenComponentInstance];
}

//+ (TextureStretcher *) getScale:(NSString *)scale {
//    return [screenComponentInstance getScale:scale];
//}
//
//+ (Rectangle *) getScreenBounds {
//    return [screenComponentInstance getScreenBounds];
//}

+ (Matrix *) getCamera {
    return [screenComponentInstance getCamera];
}







- (id) initWithGame:(Game *)theGame screenWidth:(int)width screenHeight:(int)height {
    self = [super initWithGame:theGame];
    if (self != nil) {
        screenWidth = width;
        screenHeight = height;
//
//        scales = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void) initialize {
//    float aspectRatio = (float)self.game.gameWindow.clientBounds.width / (float)self.game.gameWindow.clientBounds.height;
//    screenBounds = [[Rectangle alloc] initWithX:0 y:0 width:screenWidth height:screenHeight/aspectRatio];

    float scaleX = (float)self.game.gameWindow.clientBounds.width / screenWidth;
    float scaleY = (float)self.game.gameWindow.clientBounds.height / screenHeight;
    camera = [[Matrix createScale:[Vector3 vectorWithX:scaleX y:scaleY z:1]] retain];
    
//    // add scales
//    float hudOffset = screenBounds.height * 0.625;
//    [self addScaleFromWidth:[Constants backgroundWidth] fromHeight:[Constants battlefieldHeight] toWidth:(float)screenBounds.width toHeight:hudOffset xOffset:0 yOffset:0 mapTo:@"battlefield"];
//    [self addScaleFromWidth:[Constants backgroundWidth] fromHeight:[Constants hudHeight] toWidth:(float)screenBounds.width toHeight:(float)screenHeight/aspectRatio-hudOffset xOffset:0 yOffset:hudOffset mapTo:@"hud"];
}

//- (TextureStretcher *) getScale:(NSString *)scale {
//    return [scales objectForKey:scale];
//}
//
//- (void) addScaleFromWidth:(float)widthFrom fromHeight:(float)heightFrom toWidth:(float)widthTo toHeight:(float)heightTo xOffset:(int)theXoffset yOffset:(int)theYoffset mapTo:(NSString *)map {
//    TextureStretcher *scale = [[TextureStretcher alloc] initFromWidth:widthFrom fromHeight:heightFrom toWidth:widthTo toHeight:heightTo xOffset:theXoffset yOffset:theYoffset];
//        [scales setValue:scale forKey:map];
//}
//
//- (Rectangle *) getScreenBounds {
//    return screenBounds;
//}

- (Matrix *) getCamera {
    return camera;
}

- (void) dealloc {
    [camera release];
    
    [screenComponentInstance release];
    
    [super dealloc];
}

@end
