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
    
    songs[SongTypeMainMenu] = [self.game.content load:AUDIO_MUSIC_THEME_MAIN_MENU];
    songs[SongTypeTownMenu] = [self.game.content load:AUDIO_MUSIC_THEME_TOWN_MENU];
    songs[SongTypeWorldMenu] = [self.game.content load:AUDIO_MUSIC_THEME_WORLD_MENU];
    
    player = [[MediaPlayer alloc] init];
    player.isRepeating = YES;
    
    [super initialize];
}

- (void) play:(SoundEffectType)type {
    [soundEffects[type] play];
}

- (void) playSong:(SongType)type {
    [player playSong:songs[type]];
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
