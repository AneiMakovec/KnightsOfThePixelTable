//
//  GameHud.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Content.h"

#import "PixEngine.GUI.h"
#import "PixEngine.Scene.h"

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameHud : GameComponent {
    SimpleScene *scene;
    GUIRenderer *renderer;
    Level *level;
    
    Texture2D *buttonBackground;
    
    SpriteFont *font;
    
    Label *waveCounter;
    Label *currentHpCounters[CombatPositions];
    Label *maxHpCounters[CombatPositions];
    
    BOOL endTurnReleased;
    
    // Debug
    LabelButton *resetDices;

    ImageLabelButton *endTurn;
    
    
    // indicator textures
    Texture2D *hitTexture;
    Texture2D *burnTexture;
    Texture2D *frostbiteTexture;
}

@property (nonatomic, readonly) id<IScene> scene;
@property (nonatomic, readonly) BOOL endTurnReleased;

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel;

- (void) increaseWaveCounterTo:(int)wave;

- (void) resetEndTurnButton;

- (void) addDamageIndicatorAt:(Vector2*)position amount:(int)amount isCrit:(BOOL)isCrit;
- (void) addHealIndicatorAt:(Vector2*)position amount:(int)amount;
- (void) addMissIndicatorAt:(Vector2*)position;
- (void) addExpIndicatorAt:(Vector2*)position amount:(int)amount;
- (void) addGoldIndicatorAt:(Vector2*)position amount:(int)amount;

- (void) addHitIndicatorAt:(Vector2*)position;
- (void) addBurnIndicatorAt:(Vector2*)position;
- (void) addFrostbiteIndicatorAt:(Vector2*)position;

@end

NS_ASSUME_NONNULL_END
