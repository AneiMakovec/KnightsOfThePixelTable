//
//  GameHud.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "GameHud.h"

#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Pixlron.Knights.h"

@implementation GameHud

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
    self = [super initWithGame:theGame];
    if (self != nil) {
        scene = [[SimpleScene alloc] initWithGame:self.game];
        [self.game.components addComponent:scene];
        
        level = theLevel;
        
        endTurnReleased = NO;
        
        renderer = [[GUIRenderer alloc] initWithGame:self.game scene:scene];
        renderer.drawOrder = 1;
        [self.game.components addComponent:renderer];
    }
    return self;
}

@synthesize scene, endTurnReleased;

- (void) initialize {
    [level.battlefield setGameHud:self];
    
    FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
    font = [[self.game.content load:FONT processor:fontProcessor] autorelease];
    
    buttonBackground = [self.game.content load:BACK_BUTTON];
    
    // Wave counter
    Label *waveText = [[Label alloc] initWithFont:font text:@"Wave:" position:[Vector2 vectorWithX:512 y:20]];
    waveText.color = [Color black];
    waveText.horizontalAlign = HorizontalAlignCenter;
    waveText.verticalAlign = VerticalAlignMiddle;
    [waveText setScaleUniform:2.0f];
    [scene addItem:waveText];
    [waveText release];
    
    waveCounter = [[Label alloc] initWithFont:font text:@"1" position:[Vector2 vectorWithX:590 y:20]];
    waveCounter.color = [Color black];
    waveCounter.horizontalAlign = HorizontalAlignCenter;
    waveCounter.verticalAlign = VerticalAlignMiddle;
    [waveCounter setScaleUniform:2.0f];
    [scene addItem:waveCounter];
    
    // Debug - reset dices button
    resetDices = [[LabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:512 y:60 width:150 height:50] font:font text:@"Reset dices"];
    [scene addItem:resetDices];
    
    // End turn button
    endTurn = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth] - 120 y:10 width:110 height:50] background:buttonBackground font:font text:@"End turn"];
    [scene addItem:endTurn];
    
    
    [super initialize];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // Update all buttons.
    Matrix *inverseView = [Matrix invert:renderer.camera];
    for (id item in scene) {
        Button *button = [item isKindOfClass:[Button class]] ? item : nil;
        if (button) {
            [button updateWithInverseView:inverseView];
        }
        
        id<ICustomUpdate> update = [item conformsToProtocol:@protocol(ICustomUpdate)] ? item : nil;
        if (update) {
            [update updateWithGameTime:gameTime];
        }
    }
    
    if (resetDices.wasReleased) {
        [level.dicepool removeAllDices];
        [level.dicepool addDicesOfType:DiceFrameTypeGood];
    }
    
    if (endTurn.wasReleased) {
        endTurnReleased = YES;
    }
}

- (void) resetEndTurnButton {
    endTurnReleased = NO;
}

- (void) addDamageIndicatorAt:(Vector2 *)position amount:(int)amount isCrit:(BOOL)isCrit {
    NSLog(@"Method called");
    DamageIndicator *indicator = [[DamageIndicator alloc] initWithAmount:amount position:[Vector2 vectorWithX:position.x y:position.y - 56] font:font isCrit:isCrit];
    [scene addItem:indicator];
    [indicator release];
}

- (void) addMissIndicatorAt:(Vector2 *)position {
    DamageIndicator *indicator = [[DamageIndicator alloc] initMissAtPosition:[Vector2 vectorWithX:position.x y:position.y - 56] font:font];
    [scene addItem:indicator];
    [indicator release];
}


- (void) increaseWaveCounterTo:(int)wave {
    waveCounter.text = [NSString stringWithFormat:@"%i", wave];
}

@end
