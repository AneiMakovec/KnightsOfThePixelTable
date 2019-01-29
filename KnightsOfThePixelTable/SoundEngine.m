//
//  SoundEngine.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 10/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "SoundEngine.h"

#import "Retronator.Xni.Framework.Content.h"

SoundEngine *soundEngineInstance;

@implementation SoundEngine

+ (void) initializeWithGame:(Game*)game {
    soundEngineInstance = [[SoundEngine alloc] initWithGame:game];
    [game.components addComponent:soundEngineInstance];
}

- (void) initialize {
    soundEffects[SoundEffectTypeDice] = [self.game.content load:@"dice_hit"];
    soundEffects[SoundEffectTypeBackground] = [self.game.content load:@"background_sounds"];
    soundEffects[SoundEffectTypeClick] = [self.game.content load:@"click"];
    
    songs[SongTypeTheme] = [self.game.content load:@"music_theme"];
    songs[SongTypeBattle] = [self.game.content load:@"music_battle"];
}

- (void) play:(SoundEffectType)type {
    [soundEffects[type] play];
}

- (void) playSong:(SongType)type {
    [MediaPlayer playSong:songs[type]];
}

+ (void) play:(SoundEffectType)type {
    [soundEngineInstance play:type];
}

+ (void) playSong:(SongType)type {
    [soundEngineInstance playSong:type];
}

- (void) dealloc
{
    for (int i = 0; i < SoundEffectTypes; i++) {
        [soundEffects[i] release];
    }
    [super dealloc];
}


@end
