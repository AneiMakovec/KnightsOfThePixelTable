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

+ (BOOL) isStageUnlocked:(StageType)stage forLevel:(LevelType)level {
    return [gameProgressInstance isStageUnlocked:stage forLevel:level];
}

+ (BOOL) isLevelFinished:(LevelType)level {
    return [gameProgressInstance isLevelFinished:level];
}

+ (void) setFinishedDungeon:(BOOL)finished {
    [gameProgressInstance setFinishedDungeon:finished];
}

+ (BOOL) finishedGame {
    return [gameProgressInstance finishedGame];
}

+ (BOOL) hasFinishedDungeon {
    return [gameProgressInstance hasFinishedDungeon];
}

+ (void) setCurrentLevel:(LevelType)level {
    [gameProgressInstance setCurrentLevel:level];
}

+ (void) setCurrentStage:(StageType)stage {
    [gameProgressInstance setCurrentStage:stage];
}

+ (LevelType) currentLevel {
    return [gameProgressInstance currentLevel];
}

+ (StageType) currentStage {
    return [gameProgressInstance currentStage];
}

+ (void) generateNewKnights {
    [gameProgressInstance generateNewKnights];
}

+ (NSMutableArray *) getKnights {
    return gameProgressInstance.knights;
}

+ (NSMutableArray *) getTrainKnights {
    return gameProgressInstance.trainKnights;
}

+ (void) recruitKnight:(KnightData *)knight {
    [gameProgressInstance recruitKnight:knight];
}

+ (void) setKnight:(KnightData *)knight onCombatPosition:(CombatPosition)position {
    [gameProgressInstance setKnight:knight onCombatPosition:position];
}

+ (KnightData *) getKnightOnCombatPosition:(CombatPosition)position {
    return [gameProgressInstance getKnightOnCombatPosition:position];
}

+ (void) removeKnightOnCombatPosition:(CombatPosition)position {
    [gameProgressInstance removeKnightOnCombatPosition:position];
}

+ (int) getNumOfBattleKnights {
    return [gameProgressInstance getNumOfBattleKnights];
}

+ (BOOL) isBattleKnight:(KnightData *)data {
    return [gameProgressInstance isBattleKnight:data];
}

+ (void) removeBattleKnights {
    [gameProgressInstance removeBattleKnights];
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
    
    finishedDungeon = NO;
    finishedGame = NO;
    
//    levelUnlocked[LevelTypeFarmlands] = YES;
//    levelStageUnlocked[LevelTypeFarmlands][StageEasyFirst] = YES;
    
    curLevel = LevelTypeNoLevel;
    curStage = StageTypeNoStage;
    
    for (int i = 0; i < LevelTypes; i++) {
        levelUnlocked[i] = NO;
        
        for (int j = 0; j < StageTypes; j++) {
            levelStageUnlocked[i][j] = NO;
        }
    }
    
    knights = [[NSMutableArray alloc] init];
    trainKnights = [[NSMutableArray alloc] init];
    
    week = 1;
    gold = 1000000;
    
    knightId = 0;
    
    diceLvl = LvlZero;
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
    return [Constants getNumOfDicesForLvl:diceLvl];
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

- (BOOL) isStageUnlocked:(StageType)stage forLevel:(LevelType)level {
    return levelStageUnlocked[level][stage];
}

- (void) setFinishedDungeon:(BOOL)finished {
    finishedDungeon = finished;
    
//    levelUnlocked[LevelTypeFarmlands] = YES;
//    levelUnlocked[LevelTypePinewoods] = YES;
//    levelUnlocked[LevelTypeMountains] = YES;
//    levelUnlocked[LevelTypeSeashore] = YES;
//
    if (finished) {
        if (curLevel == LevelTypeNoLevel && curStage == StageTypeNoStage) {
            levelUnlocked[LevelTypeFarmlands] = YES;
            levelStageUnlocked[LevelTypeFarmlands][StageEasyFirst] = YES;
        } else if (curLevel == LevelTypeSeashore && curStage == StageHardFifth) {
            finishedGame = YES;
        } else {
            if (curStage == StageHardFifth) {
                levelUnlocked[curLevel + 1] = YES;
            } else {
                levelStageUnlocked[curLevel][curStage + 1] = YES;
            }
        }
    }
}

- (BOOL) finishedGame {
    return finishedGame;
}

- (LevelType) currentLevel {
    return curLevel;
}

- (StageType) currentStage {
    return curStage;
}

- (void) setCurrentLevel:(LevelType)level {
    curLevel = level;
}

- (void) setCurrentStage:(StageType)stage {
    curStage = stage;
}

- (BOOL) hasFinishedDungeon {
    return finishedDungeon;
}

- (void) generateNewKnights {
    for (int i = 0; i < 4; i++) {
        KnightType type = [Random intLessThan:KnightTypes];
        CharacterType charType = [Random intLessThan:CharacterTypes];
        KnightData *newKnight = [[KnightData alloc] initWithID:[NSString stringWithFormat:@"%d", knightId] type:type characterType:charType name:@"TODO"];
        [trainKnights addObject:newKnight];
        [newKnight release];
        
        knightId++;
    }
}

- (void) setKnight:(KnightData *)knight onCombatPosition:(CombatPosition)position {
    battleKnights[position] = [knight retain];
    
//    NSLog(@"BATTLE KNIGHTS:");
//    for (int i = 0; i < CombatPositions; i++) {
//        if (battleKnights[i]) {
//            NSLog([battleKnights[i].keyID stringByAppendingString:[NSString stringWithFormat:@" at position: %d", i]]);
//        }
//    }
}

- (void) recruitKnight:(KnightData *)knight {
    [knights addObject:knight];
    [trainKnights removeObject:knight];
}

- (KnightData *) getKnightOnCombatPosition:(CombatPosition)position {
    return battleKnights[position];
}

- (void) removeKnightOnCombatPosition:(CombatPosition)position {
    [battleKnights[position] release];
    battleKnights[position] = nil;
}

- (int) getNumOfBattleKnights {
    int count = 0;
    for (int i = 0; i < CombatPositions; i++) {
        if (battleKnights[i]) {
            count++;
        }
    }
    
    return count;
}

- (BOOL) isBattleKnight:(KnightData *)data {
    for (int i = 0; i < CombatPositions; i++) {
        if ([data.keyID isEqualToString:battleKnights[i].keyID]) {
            return YES;
        }
    }
    
    return NO;
}

- (void) removeBattleKnights {
    for (int i = 0; i < CombatPositions; i++) {
        [battleKnights[i] release];
        battleKnights[i] = nil;
    }
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





@end
