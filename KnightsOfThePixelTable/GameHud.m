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
        
        renderer = [[GUIRenderer alloc] initWithGame:self.game scene:scene];
        renderer.drawOrder = 1;
        [self.game.components addComponent:renderer];
    }
    return self;
}

@synthesize scene;

- (void) initialize {
    FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
    SpriteFont *font = [[self.game.content load:FONT processor:fontProcessor] autorelease];
    
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
    
    resetDices = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:512 y:60 width:100 height:50] background:nil font:font text:@"Reset dices"];
    resetDices.labelColor = [Color black];
    resetDices.labelHoverColor = [Color gray];
    resetDices.label.horizontalAlign = HorizontalAlignCenter;
    [scene addItem:resetDices];
    
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
    }
    
    if (resetDices.wasReleased) {
        [level.dicepool removeAllDices];
        [level.dicepool addDicesOfType:DiceFrameTypeGood];
    }
}


- (void) increaseWaveCounterTo:(int)wave {
    waveCounter.text = [NSString stringWithFormat:@"%i", wave];
}

@end
