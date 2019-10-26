//
//  GameProgress.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameProgress : NSObject <NSCoding> {
    BOOL loadedAsNew;
    
    int week;
    int gold;
    int numOfDices[LvlThree];
    Lvl diceLvl;
    
    BOOL levelUnlocked[LevelTypes];
    BOOL levelFinished[LevelTypes];
    BOOL soundEnabled;
    
    NSMutableArray *knights;
    NSMutableArray *trainKnights;
    KnightData *battleKnights[CombatPositions];
}

@property (nonatomic, retain) NSMutableArray *knights;
@property (nonatomic, retain) NSMutableArray *trainKnights;

+ (void) initializeData;
+ (void) loadProgress;
+ (void) deleteProgress;
+ (void) saveProgress;
+ (BOOL) wasLoadedAsNew;


+ (int) getWeek;
+ (int) getGold;
+ (void) buyValue:(int)val;
+ (int) getNumOfDices;
+ (Lvl) getDiceLvl;
+ (BOOL) areDicesMaxLvl;
+ (BOOL) isSoundEnabled;
+ (BOOL) isLevelUnlocked:(LevelType)level;
+ (BOOL) isLevelFinished:(LevelType)level;

+ (void) setSoundEnabled:(BOOL)isEnabled;
+ (void) unlockLevel:(LevelType)type;

+ (void) upgradeNumOfDices;

+ (void) setKnight:(KnightData *)knight onCombatPosition:(CombatPosition)position;
+ (KnightData *) getKnightOnCombatPosition:(CombatPosition)position;
+ (void) removeKnightOnCombatPosition:(CombatPosition)position;
+ (int) getNumOfBattleKnights;


- (id) initWithLoaded:(BOOL)load;

//- (void) saveProgress;
//
//- (BOOL) isSettingEnabled:(SettingType)setting;
//
//- (void) enableSetting:(SettingType)setting;
//- (void) disableSetting:(SettingType)setting;

//- (BOOL) isLevelUnlocked:(LevelType)type;

//- (void) unlockLevel:(LevelType)type;

//- (void) addKnight:(KnightData *)knight;
//- (void) removeKnight:(KnightData *)knight;
//
//- (void) setBattleKnight:(Knight *)knight onPosition:(CombatPosition)position;
//- (void) removeKnightOnPosition:(CombatPosition)position;
//- (void) removeAllBattleKnights;

@end

NS_ASSUME_NONNULL_END
