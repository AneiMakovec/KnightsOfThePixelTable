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
        gameProgressInstance = [[GameProgress alloc] init];
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



+ (int) getWeek {
    return [gameProgressInstance getWeek];
}

+ (int) getGold {
    return [gameProgressInstance getGold];
}

+ (int) getNumOfDices {
    return [gameProgressInstance getNumOfDices];
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

+ (void) setSoundEnabled:(BOOL)isEnabled {
    [gameProgressInstance setSoundEnabled:isEnabled];
}

+ (void) unlockLevel:(LevelType)type {
    [gameProgressInstance unlockLevel:type];
}








- (id) init {
    self = [super init];
    if (self != nil) {
        // Enable settings
        soundEnabled = YES;
        
        levelUnlocked[LevelTypeFarmlands] = YES;
        
        knights = [[NSMutableArray alloc] init];
        
        week = 1;
        gold = 1000000;
        numOfDices = 8;
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

@synthesize knights;

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

- (int) getWeek {
    return week;
}

- (int) getGold {
    return gold;
}

- (int) getNumOfDices {
    return numOfDices;
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
    numOfDices++;
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
