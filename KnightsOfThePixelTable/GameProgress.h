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

+ (void) loadProgress;
+ (void) deleteProgress;
+ (void) saveProgress;


+ (int) getWeek;
+ (int) getGold;
+ (int) getNumOfDices;
+ (BOOL) isSoundEnabled;
+ (BOOL) isLevelUnlocked:(LevelType)level;
+ (BOOL) isLevelFinished:(LevelType)level;

+ (void) setSoundEnabled:(BOOL)isEnabled;
+ (void) unlockLevel:(LevelType)type;

+ (void) upgradeNumOfDices;

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
