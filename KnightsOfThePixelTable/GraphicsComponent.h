//
//  GraphicsComponent.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 15/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.h"

#import "PixEngine.Graphics.h"
#import "PixEngine.GUI.h"

#import "KOTPTEnums.h"

NS_ASSUME_NONNULL_BEGIN

@interface GraphicsComponent : GameComponent {
    NSDictionary *data_animations;
    
    NSDictionary *data_0;
    NSDictionary *data_1;
    
    Texture2D *spriteSheet_0;
    Texture2D *spriteSheet_1;
    
    SpriteFont *font;
}

+ (void) initializeWithGame:(Game *)game;

+ (SpriteFont *) getFont;

+ (Label *) getLabelWithText:(NSString *)text atPosition:(Vector2 *)position;

+ (Image *) getImageWithKey:(NSString *)key atPosition:(Vector2 *)position;
+ (Image *) getImageWithKey:(NSString *)key atPosition:(Vector2 *)position width:(int)width height:(int)height;
+ (TouchImage *) getTouchImageWithKey:(NSString *)key atPosition:(Vector2 *)position;
+ (TouchImage *) getTouchImageWithKey:(NSString *)key atPosition:(Vector2 *)position width:(int)width height:(int)height;
+ (CompositeImage *) getCompositeImageWithKey:(NSString *)key atPosition:(Vector2 *)position width:(int)width height:(int)height;
+ (AnimatedImage *) getAnimatedImageWithKey:(NSString *)key atPosition:(Vector2 *)position;

+ (ImageButton *) getImageButtonWithKey:(NSString *)key atPosition:(Vector2 *)position;
+ (LabelButton *) getLabelButtonWithText:(NSString *)text atPosition:(Vector2 *)position width:(int)width height:(int)height;
+ (ImageLabelButton *) getImageLabelButtonWithKey:(NSString *)key atPosition:(Vector2 *)position text:(NSString *)text;
+ (DoubleImageButton *) getDoubleImageButtonWithKey:(NSString *)key atPosition:(Vector2 *)position;
+ (DoubleImageLabelButton *) getDoubleImageLabelButtonWithKey:(NSString *)key atPosition:(Vector2 *)position text:(NSString *)text;

+ (ImageRadioButton *) getImageRadioButtonWithKey:(NSString *)key atPosition:(Vector2 *)position isDown:(BOOL)isDown;
+ (ImageLabelRadioButton *) getImageLabelRadioButtonWithKey:(NSString *)key atPosition:(Vector2 *)position text:(NSString *)text isDown:(BOOL)isDown;
+ (DoubleImageLabelRadioButton *) getDoubleImageLabelRadioButtonWithKey:(NSString *)key atPosition:(Vector2 *)position text:(NSString *)text isDown:(BOOL)isDown;

+ (Sprite *) getSpriteWithKey:(NSString *)key;
+ (AnimatedSprite *) getAnimatedSpriteWithKey:(NSString *)key;


@end

NS_ASSUME_NONNULL_END
