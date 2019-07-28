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

- (id) initWithGame:(Game *)theGame gameplay:(Gameplay *)theGameplay waves:(int)theWaves {
    self = [super initWithGame:theGame];
    if (self != nil) {
        scene = [[SimpleScene alloc] initWithGame:self.game];
        [self.game.components addComponent:scene];
        
        gameplay = theGameplay;
        
        endTurnReleased = NO;
        paused = NO;
        endDungeon = NO;
        
        wave = 1;
        numWaves = theWaves;
        
        interfaceTextures = [[NSMutableArray alloc] initWithCapacity:ImageLocations];
        
        renderer = [[GUIRenderer alloc] initWithGame:self.game scene:scene];
        renderer.drawOrder = 1;
        [self.game.components addComponent:renderer];
    }
    return self;
}

@synthesize scene, endTurnReleased, paused, endDungeon;

- (void) initialize {
    [gameplay.currentLevel.battlefield setGameHud:self];
    
    FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
    font = [[self.game.content load:FONT processor:fontProcessor] autorelease];
    
    buttonBackground = [self.game.content load:BUTTON_BACKGROUND];
    
    // Wave counter
    Label *waveText = [[Label alloc] initWithFont:font text:@"Wave:" position:[Vector2 vectorWithX:490 y:20]];
    waveText.color = [Color white];
    waveText.horizontalAlign = HorizontalAlignCenter;
    waveText.verticalAlign = VerticalAlignMiddle;
    [waveText setScaleUniform:1.0f];
    [scene addItem:waveText];
    [waveText release];
    
    waveCounter = [[Label alloc] initWithFont:font text:@"1" position:[Vector2 vectorWithX:530 y:20]];
    waveCounter.color = [Color white];
    waveCounter.horizontalAlign = HorizontalAlignCenter;
    waveCounter.verticalAlign = VerticalAlignMiddle;
    [waveCounter setScaleUniform:1.0f];
    [scene addItem:waveCounter];
    
    Label *waveMaxNum = [[Label alloc] initWithFont:font text:[NSString stringWithFormat:@"/ %d", numWaves] position:[Vector2 vectorWithX:555 y:20]];
    waveMaxNum.color = [Color white];
    waveMaxNum.horizontalAlign = HorizontalAlignCenter;
    waveMaxNum.verticalAlign = VerticalAlignMiddle;
    [waveMaxNum setScaleUniform:1.0f];
    [scene addItem:waveMaxNum];
    [waveMaxNum release];
    
    // Debug - reset dices button
    resetDices = [[LabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:512 y:60 width:150 height:50] font:font text:@"Reset dices"];
    [scene addItem:resetDices];
    
    // End turn button
    endTurn = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth] - 120 y:10 width:110 height:50] background:buttonBackground font:font text:@"End turn"];
    [scene addItem:endTurn];
    
    // Retreat button
    retreat = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:10 y:10 width:110 height:50] background:buttonBackground font:font text:@"Retreat"];
    [scene addItem:retreat];
    
    
    // load indicator textures
    hitTexture = [[self.game.content load:HIT] retain];
    healTexture = [[self.game.content load:HEAL] retain];
    stunTexture = [[self.game.content load:STAT_EFFECT_STUN] retain];
    buffTexture = [[self.game.content load:STAT_EFFECT_BUFF] retain];
    debuffTexture = [[self.game.content load:STAT_EFFECT_DEBUFF] retain];
    bleedTexture = [[self.game.content load:STAT_EFFECT_BLEED] retain];
    poisonTexture = [[self.game.content load:STAT_EFFECT_POISON] retain];
    burnTexture = [[self.game.content load:STAT_EFFECT_BURN] retain];
    frostbiteTexture = [[self.game.content load:STAT_EFFECT_FROSTBITE] retain];
    
    // load interface textures
//    [interfaceTextures insertObject:[self.game.content load:INTERFACE_BACKGROUND_UP_LEFT] atIndex:ImageLocationUpLeft];
//    [interfaceTextures insertObject:[self.game.content load:INTERFACE_BACKGROUND_UP_CENTER] atIndex:ImageLocationUpCenter];
//    [interfaceTextures insertObject:[self.game.content load:INTERFACE_BACKGROUND_UP_RIGHT] atIndex:ImageLocationUpRight];
//    [interfaceTextures insertObject:[self.game.content load:INTERFACE_BACKGROUND_MIDDLE_LEFT] atIndex:ImageLocationMiddleLeft];
//    [interfaceTextures insertObject:[self.game.content load:INTERFACE_BACKGROUND_MIDDLE_CENTER] atIndex:ImageLocationMiddleCenter];
//    [interfaceTextures insertObject:[self.game.content load:INTERFACE_BACKGROUND_MIDDLE_RIGHT] atIndex:ImageLocationMiddleRight];
//    [interfaceTextures insertObject:[self.game.content load:INTERFACE_BACKGROUND_DOWN_LEFT] atIndex:ImageLocationDownLeft];
//    [interfaceTextures insertObject:[self.game.content load:INTERFACE_BACKGROUND_DOWN_CENTER] atIndex:ImageLocationDownCenter];
//    [interfaceTextures insertObject:[self.game.content load:INTERFACE_BACKGROUND_DOWN_RIGHT] atIndex:ImageLocationDownRight];
    
    
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
        
        id<ICustomUpdate> updatable = [item conformsToProtocol:@protocol(ICustomUpdate)] ? item : nil;
        if (updatable) {
            [updatable updateWithGameTime:gameTime];
        }
    }
    
    if (resetDices.wasReleased) {
        [SoundEngine play:SoundEffectTypeClick];
        [gameplay.currentLevel.dicepool removeAllDices];
        [gameplay.currentLevel.dicepool addDicesOfType:DiceFrameTypeGood];
    }
    
    if (endTurn.wasReleased) {
        [SoundEngine play:SoundEffectTypeClick];
        endTurnReleased = YES;
    }
    
    if (retreat.wasReleased) {
        [SoundEngine play:SoundEffectTypeClick];
        [self addRetreatInterface];
    }
}

- (void) resetEndTurnButton {
    endTurnReleased = NO;
}

- (void) addDamageIndicatorAt:(Vector2 *)position amount:(int)amount isCrit:(BOOL)isCrit {
    Indicator *indicator;
    if (isCrit)
        indicator = [[Indicator alloc] initWithText:[NSString stringWithFormat:@"%d", amount] position:[Vector2 vectorWithX:position.x y:position.y - 56] font:font color:[Color red] duration:0.5f];
    else
        indicator = [[Indicator alloc] initWithText:[NSString stringWithFormat:@"%d", amount] position:[Vector2 vectorWithX:position.x y:position.y - 56] font:font color:[Color whiteSmoke] duration:0.5f];
    
    [scene addItem:indicator];
    [indicator release];
}

- (void) addHealIndicatorAt:(Vector2 *)position amount:(int)amount {
    Indicator *indicator = [[Indicator alloc] initWithText:[NSString stringWithFormat:@"%d", amount] position:[Vector2 vectorWithX:position.x y:position.y - 56] font:font color:[Color green] duration:0.5f];
    [scene addItem:indicator];
    [indicator release];
    
    AnimatedIndicator *animation = [[AnimatedIndicator alloc] initWithTexture:healTexture position:[Vector2 vectorWithX:position.x y:position.y] duration:0.3f];
    [animation loadHealAnimation];
    [scene addItem:animation];
    [animation release];
}

- (void) addMissIndicatorAt:(Vector2 *)position {
    Indicator *indicator = [[Indicator alloc] initWithText:@"MISS" position:[Vector2 vectorWithX:position.x y:position.y - 56] font:font color:[Color lightGray] duration:0.5f];
    [scene addItem:indicator];
    [indicator release];
}

- (void) addExpIndicatorAt:(Vector2 *)position amount:(int)amount {
    Indicator *indicator = [[Indicator alloc] initWithText:[NSString stringWithFormat:@"+ %d EXP", amount] position:[Vector2 vectorWithX:position.x y:position.y - 56] font:font color:[Color blue] duration:0.5f];
    [scene addItem:indicator];
    [indicator release];
}

- (void) addGoldIndicatorAt:(Vector2 *)position amount:(int)amount {
    Indicator *indicator = [[Indicator alloc] initWithText:[NSString stringWithFormat:@"+ %d G", amount] position:[Vector2 vectorWithX:position.x y:position.y - 56] font:font color:[Color lightGoldenrodYellow] duration:0.5f];
    [scene addItem:indicator];
    [indicator release];
}



- (void) addTextIndicatorAt:(Vector2 *)position text:(NSString *)text color:(Color *)color {
    Indicator *indicator = [[Indicator alloc] initWithText:text position:[Vector2 vectorWithX:position.x y:position.y - 100] font:font color:color duration:1.5f];
    [scene addItem:indicator];
    [indicator release];
}



- (void) addHitIndicatorAt:(Vector2 *)position {
    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:hitTexture position:position duration:0.4f];
    [indicator loadHitAnimation];
    [scene addItem:indicator];
    [indicator release];
}

- (void) addBurnIndicatorAt:(Vector2 *)position {
    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:burnTexture position:position duration:0.5f];
    [indicator loadBurnAnimation];
    [scene addItem:indicator];
    [indicator release];
}

- (void) addFrostbiteIndicatorAt:(Vector2 *)position {
    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:frostbiteTexture position:position duration:0.5f];
    [indicator loadFrostbiteAnimation];
    [scene addItem:indicator];
    [indicator release];
}

- (void) addBleedIndicatorAt:(Vector2 *)position {
    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:bleedTexture position:position duration:0.4f];
    [indicator loadBleedAnimation];
    [scene addItem:indicator];
    [indicator release];
}

- (void) addPoisonIndicatorAt:(Vector2 *)position {
    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:poisonTexture position:position duration:0.5f];
    [indicator loadPoisonAnimation];
    [scene addItem:indicator];
    [indicator release];
}

- (void) addBuffIndicatorAt:(Vector2 *)position {
    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:buffTexture position:position duration:0.3f];
    [indicator loadBuffAnimation];
    [scene addItem:indicator];
    [indicator release];
}

-(void) addDebuffIndicatorAt:(Vector2 *)position {
    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:debuffTexture position:position duration:0.3f];
    [indicator loadDebuffAnimation];
    [scene addItem:indicator];
    [indicator release];
}

- (void) addStunIndicatorAt:(Vector2 *)position target:(CombatEntity *)target {
    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:stunTexture position:[Vector2 vectorWithX:position.x y:position.y - 50] duration:0.5f];
    [indicator loadStunAnimationWithTarget:target];
    [scene addItem:indicator];
    [indicator release];
}




- (void) addRetreatInterface {
//    interfaceBackground = [[CompositeImage alloc] initWithImageTextures:interfaceTextures color:[Color saddleBrown] x:370 y:150 width:300 height:100];
    RetreatInterface *interface = [[RetreatInterface alloc] initWithHud:self contentManager:self.game.content font:font backgroundTextures:interfaceTextures camera:renderer.camera];
//    [scene addItem:interfaceBackground];
    [scene addItem:interface];
    [interface release];
    
    paused = YES;
}

- (void) resumeGame {
    paused = NO;
}

- (BOOL) isLastWave {
    return wave == numWaves;
}

- (void) endGameplayWithWin:(BOOL)isWin {
    paused = YES;
    
    DungeonEndInterface *interface = [[DungeonEndInterface alloc] initWithHud:self contentManager:self.game.content font:font backgroundTextures:interfaceTextures camera:renderer.camera win:isWin];
    [scene addItem:interface];
    [interface release];
}

- (void) finishDungeon {
    endDungeon = YES;
}


- (void) increaseWaveCounter {
    wave++;
    
    if (wave > numWaves)
        [self endGameplayWithWin:YES];
    else
        waveCounter.text = [NSString stringWithFormat:@"%i", wave];
}

- (void) deactivate {
    [self.game.components removeComponent:scene];
    [self.game.components removeComponent:renderer];
}


- (void) dealloc {
    [scene release];
    [renderer release];
    
    [waveCounter release];
    [resetDices release];
    [endTurn release];
    [retreat release];
    
    [hitTexture release];
    [burnTexture release];
    [healTexture release];
    [bleedTexture release];
    [stunTexture release];
    [frostbiteTexture release];
    [poisonTexture release];
    [buffTexture release];
    [debuffTexture release];
    
    [interfaceTextures release];
    
    [super dealloc];
}

@end
