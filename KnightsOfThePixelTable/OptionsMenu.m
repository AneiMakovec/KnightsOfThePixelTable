//
//  OptionsMenu.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 07/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "OptionsMenu.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Pixlron.Knights.h"

@implementation OptionsMenu

- (void) initialize {
    [super initialize];
    
    // Load textures
    enabledSoundButtonBackground = [self.game.content load:SOUND_BUTTON_ENABLED];
    disabledSoundButtonBackground = [self.game.content load:SOUND_BUTTON_DISABLED];
    
    enabledMusicButtonBackground = [self.game.content load:MUSIC_BUTTON_ENABLED];
    disabledMusicButtonBackground = [self.game.content load:MUSIC_BUTTON_DISABLED];
    
    // Text
    title = [[Label alloc] initWithFont:font text:@"Options" position:[Vector2 vectorWithX:[Constants backgroundWidth] / 2 y:100]];
    title.horizontalAlign = HorizontalAlignCenter;
    title.verticalAlign = VerticalAlignMiddle;
    [scene addItem:title];
    
    // Buttons
    reset = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth]/2 - 100 y:[Constants battlefieldHeight] width:200 height:50]
                                  background:buttonBackground font:font text:@"Reset progress"];
    [scene addItem:reset];
    
    if ([knightsGame.progress isSettingEnabled:SettingTypeSound]) {
        sound = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth]/2 - 100 y:[Constants battlefieldHeight] + 100 width:50 height:50] background:enabledSoundButtonBackground];
    } else {
        sound = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth]/2 - 100 y:[Constants battlefieldHeight] + 100 width:50 height:50] background:disabledSoundButtonBackground];
    }
    [scene addItem:sound];
    
    if ([knightsGame.progress isSettingEnabled:SettingTypeMusic]) {
        music = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth]/2 + 50 y:[Constants battlefieldHeight] + 100 width:50 height:50] background:enabledMusicButtonBackground];
    } else {
        music = [[ImageButton alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth]/2 + 50 y:[Constants battlefieldHeight] + 100 width:50 height:50] background:disabledMusicButtonBackground];
    }
    [scene addItem:music];
    
    
    
    [scene addItem:back];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    if (reset.wasReleased) {
        // reset game progress
    }
    
    if (sound.wasReleased) {
        if ([knightsGame.progress isSettingEnabled:SettingTypeSound]) {
            [knightsGame.progress disableSetting:SettingTypeSound];
            [sound setBackground:disabledSoundButtonBackground];
        } else {
            [knightsGame.progress enableSetting:SettingTypeSound];
            [sound setBackground:enabledSoundButtonBackground];
        }
    }
    
    if (music.wasReleased) {
        if ([knightsGame.progress isSettingEnabled:SettingTypeMusic]) {
            [knightsGame.progress disableSetting:SettingTypeMusic];
            [music setBackground:disabledMusicButtonBackground];
        } else {
            [knightsGame.progress enableSetting:SettingTypeMusic];
            [music setBackground:enabledMusicButtonBackground];
        }
    }
}

- (void) dealloc {
    [title release];
    
    [reset release];
    
    [super dealloc];
}

@end
