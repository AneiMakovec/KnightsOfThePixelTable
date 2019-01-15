//
//  GameProgress.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "GameProgress.h"

#import "Pixlron.Knights.h"

@implementation GameProgress

- (id) init {
    self = [super init];
    if (self != nil) {
        // Enable settings
        settingEnabled[SettingTypeSound] = YES;
        settingEnabled[SettingTypeMusic] = YES;
        //levelUnlocked[LevelTypeFarmlands] = YES;
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self != nil) {
//        for (int i = 0; i < LevelTypes; i++) {
//            levelUnlocked[i] = [aDecoder decodeBoolForKey:[NSString stringWithFormat:@"levelUnlocked%i", i]];
//        }
        
        for (int i = 0; i < SettingTypes; i++) {
            settingEnabled[i] = [aDecoder decodeBoolForKey:[NSString stringWithFormat:@"settingEnabled%i", i]];
        }
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
//    for (int i = 0; i < LevelTypes; i++) {
//        [aCoder encodeBool:levelUnlocked[i] forKey:[NSString stringWithFormat:@"levelUnlocked%i", i]];
//    }
    
    for (int i = 0; i < SettingTypes; i++) {
        [aCoder encodeBool:settingEnabled[i] forKey:[NSString stringWithFormat:@"settingEnabled%i", i]];
    }
}

+ (GameProgress *) loadProgress {
    // Load game progress from file.
    GameProgress *progress = nil;
    
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];
    progress = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
    
//    progress = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
    
    // If there is no progress file, create a fresh instance.
    if (!progress) {
        progress = [[[GameProgress alloc] init] autorelease];
    }
    
    return progress;
}

+ (void) deleteProgress {
    // Delete game progress file.
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:archivePath error:&error];
}

- (void) saveProgress {
    // Save game progress to file.
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];
    [NSKeyedArchiver archiveRootObject:self toFile:archivePath];
}

//- (BOOL) isLevelUnlocked:(LevelType)type {
//    return levelUnlocked[type];
//}

- (BOOL) isSettingEnabled:(SettingType)setting {
    return settingEnabled[setting];
}

//- (void) unlockLevel:(LevelType)type {
//    levelUnlocked[type] = YES;
//    [self saveProgress];
//}

- (void) enableSetting:(SettingType)setting {
    settingEnabled[setting] = YES;
    [self saveProgress];
}

- (void) disableSetting:(SettingType)setting {
    settingEnabled[setting] = NO;
    [self saveProgress];
}



@end
