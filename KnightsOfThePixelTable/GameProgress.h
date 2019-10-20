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
    //BOOL levelUnlocked[LevelTypes];
    BOOL settingEnabled[SettingTypes];
    
    NSMutableArray *knights;
    KnightData *battleKnights[CombatPositions];
}

@property (nonatomic, retain) NSMutableArray *knights;

+ (GameProgress *) loadProgress;
+ (void) deleteProgress;
- (void) saveProgress;

- (BOOL) isSettingEnabled:(SettingType)setting;

- (void) enableSetting:(SettingType)setting;
- (void) disableSetting:(SettingType)setting;

//- (BOOL) isLevelUnlocked:(LevelType)type;

//- (void) unlockLevel:(LevelType)type;

- (void) addKnight:(KnightData *)knight;
- (void) removeKnight:(KnightData *)knight;

- (void) setBattleKnight:(Knight *)knight onPosition:(CombatPosition)position;
- (void) removeKnightOnPosition:(CombatPosition)position;
- (void) removeAllBattleKnights;

@end

NS_ASSUME_NONNULL_END
