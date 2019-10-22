//
//  GameProgress.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "GameProgress.h"

#import "Pixlron.Knights.h"

GameProgress *gameProgressInstance;

@implementation GameProgress

+ (void) initializeData {
    [gameProgressInstance initializeData];
}

+ (void) loadProgress {
    // Load game progress from file.
    gameProgressInstance = nil;
    
    NSError *error = nil;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];
    NSData *data = [NSData dataWithContentsOfFile:archivePath];
//    gameProgressInstance = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
    gameProgressInstance = [NSKeyedUnarchiver unarchivedObjectOfClass:[GameProgress class] fromData:data error:&error];
    
    // If there is no progress file, create a fresh instance.
    if (!gameProgressInstance) {
        gameProgressInstance = [[GameProgress alloc] initWithLoaded:YES];
    }
}

+ (void) deleteProgress {
    // Delete game progress file.
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:archivePath error:&error];
}

+ (void) saveProgress {
    [gameProgressInstance saveProgress];
}


+ (BOOL) wasLoadedAsNew {
    return [gameProgressInstance wasLoaded];
}

+ (int) getWeek {
    return [gameProgressInstance getWeek];
}

+ (int) getGold {
    return [gameProgressInstance getGold];
}

+ (void) buyValue:(int)val {
    [gameProgressInstance buyValue:val];
}

+ (int) getNumOfDices {
    return [gameProgressInstance getNumOfDices];
}

+ (Lvl) getDiceLvl {
    return [gameProgressInstance getDiceLvl];
}

+ (BOOL) isSoundEnabled {
    return [gameProgressInstance isSoundEnabled];
}

+ (BOOL) isLevelUnlocked:(LevelType)level {
    return [gameProgressInstance isLevelUnlocked:level];
}

+ (BOOL) isLevelFinished:(LevelType)level {
    return [gameProgressInstance isLevelFinished:level];
}

+ (BOOL) areDicesMaxLvl {
    return [gameProgressInstance areDicesMaxLvl];
}

+ (void) setSoundEnabled:(BOOL)isEnabled {
    [gameProgressInstance setSoundEnabled:isEnabled];
}

+ (void) unlockLevel:(LevelType)type {
    [gameProgressInstance unlockLevel:type];
}

+ (void) upgradeNumOfDices {
    [gameProgressInstance upgradeNumOfDices];
}










- (id) initWithLoaded:(BOOL)load {
    self = [super init];
    if (self != nil) {
        loadedAsNew = load;
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self != nil) {
//        for (int i = 0; i < LevelTypes; i++) {
//            levelUnlocked[i] = [aDecoder decodeBoolForKey:[NSString stringWithFormat:@"levelUnlocked%i", i]];
//        }
        
        soundEnabled = [aDecoder decodeBoolForKey:@"soundEnabled"];
    }
    return self;
}

@synthesize knights, trainKnights;

- (void) encodeWithCoder:(NSCoder *)aCoder {
//    for (int i = 0; i < LevelTypes; i++) {
//        [aCoder encodeBool:levelUnlocked[i] forKey:[NSString stringWithFormat:@"levelUnlocked%i", i]];
//    }
    
    [aCoder encodeBool:soundEnabled forKey:@"soundEnabled"];
}

- (void) saveProgress {
    // Save game progress to file.
    NSError *error = nil;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];
//    [NSKeyedArchiver archiveRootObject:self toFile:archivePath];     // OLD
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:NO error:&error];   // NEW
    [data writeToFile:archivePath options:NSDataWritingAtomic error:&error];
}

- (void) initializeData {
    soundEnabled = YES;
    
    levelUnlocked[LevelTypeFarmlands] = YES;
    
    knights = [[NSMutableArray alloc] init];
    
    week = 1;
    gold = 1000000;
    
    diceLvl = LvlZero;
    NSDictionary *data = [Constants getValueDataForKey:VALUE_DICE_NUM];
    for (int i = 0; i < LvlThree; i++) {
        numOfDices[i] = [[data valueForKey:[NSString stringWithFormat:@"%d", i]] intValue];
    }
}

- (BOOL) wasLoaded {
    return loadedAsNew;
}

- (int) getWeek {
    return week;
}

- (int) getGold {
    return gold;
}

- (void) buyValue:(int)val {
    gold -= val;
}

- (Lvl) getDiceLvl {
    return diceLvl;
}

- (int) getNumOfDices {
    return numOfDices[diceLvl];
}

- (BOOL) isSoundEnabled {
    return soundEnabled;
}

- (BOOL) isLevelUnlocked:(LevelType)level {
    return levelUnlocked[level];
}

- (BOOL) isLevelFinished:(LevelType)level {
    return levelFinished[level];
}

- (BOOL) areDicesMaxLvl {
    return diceLvl == [Constants getMaxDiceLvl] - 1;
}




- (void) setSoundEnabled:(BOOL)isEnabled {
    soundEnabled = isEnabled;
}

- (void) unlockLevel:(LevelType)type {
    levelUnlocked[type] = YES;
}





- (void) addKnight:(Knight *)knight {
    [knights addObject:knight];
}

- (void) removeKnight:(Knight *)knight {
    [knights removeObject:knight];
}




- (void) upgradeNumOfDices {
    if (diceLvl < [Constants getMaxDiceLvl] - 1)
        diceLvl++;
}


- (void) setBattleKnight:(KnightData *)knight onPosition:(CombatPosition)position {
    battleKnights[position] = knight;
}

- (void) removeKnightOnPosition:(CombatPosition)position {
    battleKnights[position] = nil;
}

- (void) removeAllBattleKnights {
    for (int i = 0; i < CombatPositions; i++) {
        battleKnights[i] = nil;
    }
}



@end
