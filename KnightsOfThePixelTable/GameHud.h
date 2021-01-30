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

    int wave;
    int numWaves;
    
    BOOL endTurnReleased;
    BOOL paused;
    BOOL endDungeon;
    
    
    Image *background;
    Image *hudBackground;
    
    Image *allyDicePool;
    Image *enemyDicePool;
    
    Image *waveCounterPanel;
    Label *waveCounter;
    
    Image *enemyTurn;
    ImageButton *endTurn;
    DoubleImageButton *retreat;
    
    Image *portraits[CombatPositions];
    Image *skills[CombatPositions][SkillTypes];
    Image *skillBorders[CombatPositions][BorderTypes];
    Image *hpBars[CombatPositions];
    Image *combos[CombatPositions][ComboItems][StatTypes];
    
    Image *enemyHpBarFrame[CombatPositions];
    Image *enemyHpBar[CombatPositions];

    Label *currentHpCounters[CombatPositions];
    Label *maxHpCounters[CombatPositions];
    
    ReleaseArea *comboAreas[CombatPositions];
    Button *skillPresedAreas[CombatPositions];
    Button *comboSlotAreas[CombatPositions][ComboItems];
    
    // Debug
    LabelButton *resetDices;
}

@property (nonatomic, readonly) id<IScene> scene;
@property (nonatomic, readonly) BOOL endTurnReleased;
@property (nonatomic, readonly) BOOL paused;
@property (nonatomic, readonly) BOOL endDungeon;


+ (void) initializeWithGame:(Game *)game;

+ (void) activate;

+ (void) deactivate;

+ (void) addItemToScene:(id)item;

+ (BOOL) isLastWave;

+ (BOOL) wasDiceDropped:(CombatPosition)pos;

- (void) update;






- (void) increaseWaveCounter;

- (void) resetEndTurnButton;

//- (void) addDamageIndicatorAt:(Vector2*)position amount:(int)amount isCrit:(BOOL)isCrit;
//- (void) addHealIndicatorAt:(Vector2*)position amount:(int)amount;
//- (void) addMissIndicatorAt:(Vector2*)position;
//- (void) addExpIndicatorAt:(Vector2*)position amount:(int)amount;
//- (void) addGoldIndicatorAt:(Vector2*)position amount:(int)amount;
//
//- (void) addTextIndicatorAt:(Vector2*)position text:(NSString*)text color:(Color*)color;
//
//- (void) addHitIndicatorAt:(Vector2*)position;
//- (void) addBurnIndicatorAt:(Vector2*)position;
//- (void) addFrostbiteIndicatorAt:(Vector2*)position;
//- (void) addBleedIndicatorAt:(Vector2*)position;
//- (void) addPoisonIndicatorAt:(Vector2*)position;
//- (void) addBuffIndicatorAt:(Vector2*)position;
//- (void) addDebuffIndicatorAt:(Vector2*)position;
//- (void) addStunIndicatorAt:(Vector2*)position target:(CombatEntity *)target;

- (void) resumeGame;

- (void) addRetreatInterface;

- (void) endGameplayWithWin:(BOOL)isWin;

- (void) finishDungeon;

- (BOOL) isLastWave;

- (void) deactivate;
- (void) activate;

@end

NS_ASSUME_NONNULL_END
