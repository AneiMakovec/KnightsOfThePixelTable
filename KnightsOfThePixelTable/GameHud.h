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
    
    int numWaves;
    Label *waveCounter;
    Label *currentHpCounters[CombatPositions];
    Label *maxHpCounters[CombatPositions];
    
    BOOL endTurnReleased;
    
    // Debug
    LabelButton *resetDices;

    ImageLabelButton *endTurn;
    
    
    // indicator textures
    Texture2D *hitTexture;
    Texture2D *healTexture;
    Texture2D *bleedTexture;
    Texture2D *poisonTexture;
    Texture2D *burnTexture;
    Texture2D *frostbiteTexture;
    Texture2D *stunTexture;
    Texture2D *buffTexture;
    Texture2D *debuffTexture;
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
- (void) addBleedIndicatorAt:(Vector2*)position;
- (void) addPoisonIndicatorAt:(Vector2*)position;
- (void) addBuffIndicatorAt:(Vector2*)position;
- (void) addDebuffIndicatorAt:(Vector2*)position;
- (void) addStunIndicatorAt:(Vector2*)position target:(CombatEntity *)target;

@end

NS_ASSUME_NONNULL_END
