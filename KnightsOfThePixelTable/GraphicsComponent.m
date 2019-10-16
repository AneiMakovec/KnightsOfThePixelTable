//
//  GraphicsComponent.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 15/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "GraphicsComponent.h"

#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"


#define FRAMES @"frames"
#define DURATION @"duration"
#define LOOPING @"looping"

GraphicsComponent *graphicsInstance;

@implementation GraphicsComponent

+ (void) initializeWithGame:(Game *)game {
    graphicsInstance = [[GraphicsComponent alloc] initWithGame:game];
    [game.components addComponent:graphicsInstance];
}


+ (SpriteFont *) getFont {
    return [graphicsInstance getFont];
}

+ (Image *) getImageWithKey:(NSString *)key atPosition:(Vector2 *)position {
    return [graphicsInstance getImageWithKey:key atPosition:position];
}

+ (Image *) getImageWithKey:(NSString *)key atPosition:(Vector2 *)position width:(int)width height:(int)height {
    return [graphicsInstance getImageWithKey:key atPosition:position width:width height:height];
}

+ (TouchImage *) getTouchImageWithKey:(NSString *)key atPosition:(Vector2 *)position {
    return [graphicsInstance getTouchImageWithKey:key atPosition:position];
}

+ (TouchImage *) getTouchImageWithKey:(NSString *)key atPosition:(Vector2 *)position width:(int)width height:(int)height {
    return [graphicsInstance getTouchImageWithKey:key atPosition:position width:width height:height];
}

+ (CompositeImage *) getCompositeImageWithKey:(NSString *)key atPosition:(Vector2 *)position width:(int)width height:(int)height {
    return [graphicsInstance getCompositeImageWithKey:key atPosition:position width:width height:height];
}

+ (AnimatedImage *) getAnimatedImageWithKey:(NSString *)key atPosition:(Vector2 *)position {
    return [graphicsInstance getAnimatedImageWithKey:key atPosition:position];
}

+ (ImageButton *) getImageButtonWithKey:(NSString *)key atPosition:(Vector2 *)position {
    return [graphicsInstance getImageButtonWithKey:key atPosition:position];
}

+ (ImageLabelButton *) getImageLabelButtonWithKey:(NSString *)key atPosition:(Vector2 *)position text:(NSString *)text {
    return [graphicsInstance getImageLabelButtonWithKey:key atPosition:position text:text];
}

+ (DoubleImageButton *) getDoubleImageButtonWithKey:(NSString *)key atPosition:(Vector2 *)position {
    return [graphicsInstance getDoubleImageButtonWithKey:key atPosition:position];
}

+ (DoubleImageLabelButton *) getDoubleImageLabelButtonWithKey:(NSString *)key atPosition:(Vector2 *)position text:(NSString *)text {
    return [graphicsInstance getDoubleImageLabelButtonWithKey:key atPosition:position text:text];
}

+ (ImageLabelRadioButton *) getImageLabelRadioButtonWithKey:(NSString *)key atPosition:(Vector2 *)position text:(NSString *)text isDown:(BOOL)isDown {
    return [graphicsInstance getImageLabelRadioButtonWithKey:key atPosition:position text:text isDown:isDown];
}

+ (DoubleImageLabelRadioButton *) getDoubleImageLabelRadioButtonWithKey:(NSString *)key atPosition:(Vector2 *)position text:(NSString *)text isDown:(BOOL)isDown {
    return [graphicsInstance getDoubleImageLabelRadioButtonWithKey:key atPosition:position text:text isDown:isDown];
}

+ (Sprite *) getSpriteWithKey:(NSString *)key {
    return [graphicsInstance getSpriteWithKey:key];
}

+ (AnimatedSprite *) getAnimatedSpriteWithKey:(NSString *)key {
    return [graphicsInstance getAnimatedSpriteWithKey:key];
}







- (void) initialize {
    [super initialize];
    [graphicsInstance initializeData];
}




- (SpriteFont *) getFont {
    return font;
}

- (Image *) getImageWithKey:(NSString *)key atPosition:(Vector2 *)position {
    // check if image is trimmed and update position accordingly
    if ([self isTrimmedByKey:key]) {
        Rectangle *offset = [self getOffsetRectangleForKey:key];
        position.x += offset.x;
        position.y += offset.y;
    }
    
    // init image
    Image *image = [[[Image alloc] initWithTexture:[self getTextureForKey:key] position:position] autorelease];
    
    // set image source rectangle
    [image setSourceRectangle:[self getSourceRectangleForKey:key]];
    
    return image;
}

- (Image *) getImageWithKey:(NSString *)key atPosition:(Vector2 *)position width:(int)width height:(int)height {
    // check if image is trimmed and update position accordingly
    if ([self isTrimmedByKey:key]) {
        Rectangle *offset = [self getOffsetRectangleForKey:key];
        position.x += offset.x;
        position.y += offset.y;
    }
    
    // init image
    Image *image = [[[Image alloc] initWithTexture:[self getTextureForKey:key] toRectangle:[Rectangle rectangleWithX:position.x y:position.y width:width height:height]] autorelease];
    
    // set image source rectangle
    [image setSourceRectangle:[self getSourceRectangleForKey:key]];
    
    return image;
}

- (TouchImage *) getTouchImageWithKey:(NSString *)key atPosition:(Vector2 *)position {
    // get image size
    Rectangle *sourceRect = [self getSourceRectangleForKey:key];
    
    // init image
    TouchImage *image = [[[TouchImage alloc] initWithTexture:[self getTextureForKey:key] toRectangle:[Rectangle rectangleWithX:position.x y:position.y width:sourceRect.width height:sourceRect.height]] autorelease];
    
    // set image source rectangle
    [image setSourceRectangle:sourceRect];
    
    return image;
}

- (TouchImage *) getTouchImageWithKey:(NSString *)key atPosition:(Vector2 *)position width:(int)width height:(int)height {
    // init image
    TouchImage *image = [[[TouchImage alloc] initWithTexture:[self getTextureForKey:key] toRectangle:[Rectangle rectangleWithX:position.x y:position.y width:width height:height]] autorelease];
    
    // set image source rectangle
    [image setSourceRectangle:[self getSourceRectangleForKey:key]];
    
    return image;
}

- (CompositeImage *) getCompositeImageWithKey:(NSString *)key atPosition:(Vector2 *)position width:(int)width height:(int)height {
    CompositeImage *image = nil;
    if ([key isEqualToString:TOWN_MENU_INTERFACE_WINDOW]) {
        NSMutableArray *rectangles = [[NSMutableArray alloc] initWithCapacity:ImageLocations];
        rectangles[ImageLocationUpLeft] = [self getSourceRectangleForKey:TOWN_MENU_INTERFACE_WINDOW_UP_LEFT];
        rectangles[ImageLocationUpRight] = [self getSourceRectangleForKey:TOWN_MENU_INTERFACE_WINDOW_UP_RIGHT];
        rectangles[ImageLocationUpCenter] = [self getSourceRectangleForKey:TOWN_MENU_INTERFACE_WINDOW_UP];
        rectangles[ImageLocationMiddleLeft] = [self getSourceRectangleForKey:TOWN_MENU_INTERFACE_WINDOW_LEFT];
        rectangles[ImageLocationMiddleRight] = [self getSourceRectangleForKey:TOWN_MENU_INTERFACE_WINDOW_RIGHT];
        rectangles[ImageLocationMiddleCenter] = [self getSourceRectangleForKey:TOWN_MENU_INTERFACE_WINDOW_CENTER];
        rectangles[ImageLocationDownLeft] = [self getSourceRectangleForKey:TOWN_MENU_INTERFACE_WINDOW_DOWN_LEFT];
        rectangles[ImageLocationDownRight] = [self getSourceRectangleForKey:TOWN_MENU_INTERFACE_WINDOW_DOWN_RIGHT];
        rectangles[ImageLocationDownCenter] = [self getSourceRectangleForKey:TOWN_MENU_INTERFACE_WINDOW_DOWN];
        
        image = [[[CompositeImage alloc] initWithImageTexture:spriteSheet_0 sourceRectangles:rectangles color:[Color brown] x:370 y:150 width:300 height:100] autorelease];
    }
    
    return image;
}

- (AnimatedImage *) getAnimatedImageWithKey:(NSString *)key atPosition:(Vector2 *)position {
    NSDictionary *data = [data_animations objectForKey:key];
    
    // set duration
    float duration = [[data valueForKey:DURATION] floatValue];
    AnimatedImage *animation = [[[AnimatedImage alloc] initWithDuration:duration] autorelease];
    
    // load frames
    int frames = [[data valueForKey:FRAMES] intValue];
    for (int i = 0; i < frames; i++) {
        NSString *frameKey = [key stringByAppendingString:[NSString stringWithFormat:@"f%d", i]];
        Image *frameImage = [[Image alloc] init];
        frameImage.texture = [self getTextureForKey:frameKey];
        frameImage.sourceRectangle = [self getSourceRectangleForKey:frameKey];
        
        // calculate offset and determine origin
        Rectangle *offset = [self getOffsetRectangleForKey:frameKey];
        frameImage.origin = [Vector2 vectorWithX:(offset.width/2) - offset.x y:(offset.height/2) - offset.y];
        
        AnimatedImageFrame *frame = [AnimatedImageFrame frameWithImage:frameImage start:animation.duration * (float) i / frames];
        [animation addFrame:frame];
        
        [frameImage release];
    }
    
    // set looping
    BOOL looping = [[data valueForKey:LOOPING] boolValue];
    animation.looping = looping;
    
    return animation;
}

- (ImageButton *) getImageButtonWithKey:(NSString *)key atPosition:(Vector2 *)position {
    Rectangle *rect = [self getSourceRectangleForKey:key];
    
    ImageButton *button = [[[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:position.x y:position.y width:rect.width height:rect.height] background:[self getImageWithKey:key atPosition:position]] autorelease];
    
    return button;
}

- (ImageLabelButton *) getImageLabelButtonWithKey:(NSString *)key atPosition:(Vector2 *)position text:(NSString *)text {
    Rectangle *rect = [self getSourceRectangleForKey:key];
    
    ImageLabelButton *button = [[[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:position.x y:position.y width:rect.width height:rect.height] background:[self getImageWithKey:key atPosition:position] font:font text:text] autorelease];
    
    return button;
}

- (DoubleImageButton *) getDoubleImageButtonWithKey:(NSString *)key atPosition:(Vector2 *)position {
    Rectangle *rect = [self getSourceRectangleForKey:key];
    
    DoubleImageButton *button = [[[DoubleImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:position.x y:position.y width:rect.width height:rect.height] notPressedBackground:[self getImageWithKey:key atPosition:position] pressedBackground:[self getImageWithKey:[key stringByAppendingString:@"_pressed"] atPosition:position]] autorelease];
    
    return button;
}

- (DoubleImageLabelButton *) getDoubleImageLabelButtonWithKey:(NSString *)key atPosition:(Vector2 *)position text:(NSString *)text {
    Rectangle *rect = [self getSourceRectangleForKey:key];
    
    DoubleImageLabelButton *button = [[[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:position.x y:position.y width:rect.width height:rect.height] notPressedBackground:[self getImageWithKey:key atPosition:position] pressedBackground:[self getImageWithKey:[key stringByAppendingString:@"_pressed"] atPosition:position] font:font text:text] autorelease];
    
    return button;
}

- (ImageLabelRadioButton *) getImageLabelRadioButtonWithKey:(NSString *)key atPosition:(Vector2 *)position text:(NSString *)text isDown:(BOOL)isDown {
    Rectangle *rect = [self getSourceRectangleForKey:key];
    
    ImageLabelRadioButton *button = [[[ImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:position.x y:position.y width:rect.width height:rect.height] background:[self getImageWithKey:key atPosition:position] font:font text:text isDown:isDown] autorelease];
    
    return button;
}

- (DoubleImageLabelRadioButton *) getDoubleImageLabelRadioButtonWithKey:(NSString *)key atPosition:(Vector2 *)position text:(NSString *)text isDown:(BOOL)isDown {
    Rectangle *rect = [self getSourceRectangleForKey:key];
    
    DoubleImageLabelRadioButton *button = [[[DoubleImageLabelRadioButton alloc] initWithInputArea:[Rectangle rectangleWithX:position.x y:position.y width:rect.width height:rect.height] notPressedBackground:[self getImageWithKey:key atPosition:position] pressedBackground:[self getImageWithKey:[key stringByAppendingString:@"_pressed"] atPosition:position] font:font text:text isDown:isDown] autorelease];
    
    return button;
}

- (Sprite *) getSpriteWithKey:(NSString *)key {
    Sprite *sprite = [[[Sprite alloc] init] autorelease];
    sprite.texture = [self getTextureForKey:key];
    sprite.sourceRectangle = [self getSourceRectangleForKey:key];
    
    // calculate offset and determine origin
    Rectangle *offset = [self getOffsetRectangleForKey:key];
    sprite.origin = [Vector2 vectorWithX:(offset.width/2) - offset.x y:(offset.height/2) - offset.y];
    
    return sprite;
}

- (AnimatedSprite *) getAnimatedSpriteWithKey:(NSString *)key {
    NSDictionary *data = [data_animations objectForKey:key];
    
    // set duration
    float duration = [[data valueForKey:DURATION] floatValue];
    AnimatedSprite *animation = [[[AnimatedSprite alloc] initWithDuration:duration] autorelease];
    
    // load frames
    int frames = [[data valueForKey:FRAMES] intValue];
    for (int i = 0; i < frames; i++) {
        NSString *frameKey = [key stringByAppendingString:[NSString stringWithFormat:@"f%d", i]];
        Sprite *frameSprite = [[Sprite alloc] init];
        frameSprite.texture = [self getTextureForKey:frameKey];
        frameSprite.sourceRectangle = [self getSourceRectangleForKey:frameKey];
        
        // calculate offset and determine origin
        Rectangle *offset = [self getOffsetRectangleForKey:frameKey];
        frameSprite.origin = [Vector2 vectorWithX:(offset.width/2) - offset.x y:(offset.height/2) - offset.y];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:frameSprite start:animation.duration * (float) i / frames];
        [animation addFrame:frame];
        
        [frameSprite release];
    }
    
    // set looping
    BOOL looping = [[data valueForKey:LOOPING] boolValue];
    animation.looping = looping;
    
    return animation;
}








- (Texture2D *) getTextureForKey:(NSString *)key {
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


- (Rectangle *) getOffsetRectangleForKey:(NSString *)key {
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

- (Rectangle *) getSourceRectangleForKey:(NSString *)key {
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
    data_animations = [[[self loadData:DATA_ANIMATIONS] objectForKey:@"animations"] retain];
    data_0 = [[[self loadData:SPRITESHEET_0] objectForKey:@"frames"] retain];
    data_1 = [[[self loadData:SPRITESHEET_1] objectForKey:@"frames"] retain];
    
    // load textures
    spriteSheet_0 = [self.game.content load:SPRITESHEET_0];
    spriteSheet_1 = [self.game.content load:SPRITESHEET_1];
    
    // load font
    FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
    font = [self.game.content load:FONT processor:fontProcessor];
}

- (NSDictionary *) loadData:(NSString *)file {
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
