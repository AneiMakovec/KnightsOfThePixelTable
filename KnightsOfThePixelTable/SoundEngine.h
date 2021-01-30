//
//  SoundEngine.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 10/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Media.h"
#import "Retronator.Xni.Framework.Audio.h"
#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface SoundEngine : GameComponent {
    SoundEffect *soundEffects[SoundEffectTypes];
    Song *songs[SongTypes];
    MediaPlayer *player;
}

+ (void) initializeWithGame:(Game*)game;
+ (void) play:(SoundEffectType)type;
+ (void) playSong:(SongType)type;

@end

NS_ASSUME_NONNULL_END
