//
//  GameHud.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "GameHud.h"

#import "Retronator.Xni.Framework.Graphics.h"
#import "Pixlron.Knights.h"

GameHud *hudInstance;

@implementation GameHud

+ (void) initializeWithGame:(Game *)game {
    hudInstance = [[GameHud alloc] initWithGame:game];
    hudInstance.updateOrder = 8;
}

+ (void) activate {
    [hudInstance activate];
    [hudInstance.game.components addComponent:hudInstance];
}

+ (void) deactivate {
    [hudInstance deactivate];
    [hudInstance.game.components removeComponent:hudInstance];
}

+ (BOOL) isLastWave {
    return [hudInstance isLastWave];
}

+ (BOOL) wasDiceDropped:(CombatPosition)pos {
    return [hudInstance wasDiceDropped:pos];
}









- (id) initWithGame:(Game *)theGame {
    self = [super initWithGame:theGame];
    if (self != nil) {
        scene = [[SimpleScene alloc] initWithGame:self.game];
        scene.updateOrder = 7;
        
        endTurnReleased = NO;
        paused = NO;
        endDungeon = NO;
        
        wave = 1;
        numWaves = [Constants getWavesForStage:[GameProgress currentStage]];

        renderer = [[GUIRenderer alloc] initWithGame:self.game scene:scene];
        renderer.updateOrder = 11;
    }
    return self;
}

@synthesize scene, endTurnReleased, paused, endDungeon;

- (void) initialize {
    
    // background
    NSString *backgroundKeys[LevelTypes] = {GAMEPLAY_MENU_BACKGROUND_FARMLANDS, GAMEPLAY_MENU_BACKGROUND_PINEWOODS, GAMEPLAY_MENU_BACKGROUND_MOUNTAINS, GAMEPLAY_MENU_BACKGROUND_SEASHORE};
    background = [GraphicsComponent getImageWithKey:backgroundKeys[[GameProgress currentLevel]] atPosition:[Vector2 zero]];
    background.layerDepth = 1.0f;
    [scene addItem:background];
    
    // hud background
    hudBackground = [GraphicsComponent getImageWithKey:GAMEPLAY_MENU_INTERFACE_HUD_HUD atPosition:[Vector2 vectorWithX:0 y:320]];
    hudBackground.layerDepth = 1.0f;
    [scene addItem:hudBackground];
    
    // dice pool
    allyDicePool = [GraphicsComponent getImageWithKey:GAMEPLAY_MENU_INTERFACE_HUD_DICEPOOL_ALLY atPosition:[Constants getPositionDataForKey:POSITION_HUD_DICEPOOL]];
    allyDicePool.layerDepth = 1.0f;
    [scene addItem:allyDicePool];
    
    enemyDicePool = [GraphicsComponent getImageWithKey:GAMEPLAY_MENU_INTERFACE_HUD_DICEPOOL_ENEMY atPosition:[Constants getPositionDataForKey:POSITION_HUD_DICEPOOL]];
    
    // wave counter
    waveCounterPanel = [GraphicsComponent getImageWithKey:GAMEPLAY_MENU_INTERFACE_HUD_WAVE_COUNTER atPosition:[Vector2 zero]];
    waveCounterPanel.layerDepth = 0.99f;
    [scene addItem:waveCounterPanel];
    
//    Label *waveText = [[Label alloc] initWithFont:font text:@"Wave:" position:[Vector2 vectorWithX:490 y:20]];
    Label *waveText = [GraphicsComponent getLabelWithText:@"Wave" atPosition:[Vector2 vectorWithX:490 y:20]];
    waveText.layerDepth = 0.98f;
    waveText.horizontalAlign = HorizontalAlignCenter;
    waveText.verticalAlign = VerticalAlignMiddle;
    [waveText setScaleUniform:FONT_SCALE_MEDIUM];
    [scene addItem:waveText];
    [waveText release];
    
//    waveCounter = [[Label alloc] initWithFont:font text:@"1" position:[Vector2 vectorWithX:530 y:20]];
    waveCounter = [GraphicsComponent getLabelWithText:@"1" atPosition:[Vector2 vectorWithX:530 y:20]];
    waveCounter.layerDepth = 0.98f;
    waveCounter.horizontalAlign = HorizontalAlignCenter;
    waveCounter.verticalAlign = VerticalAlignMiddle;
    [waveCounter setScaleUniform:FONT_SCALE_MEDIUM];
    [scene addItem:waveCounter];
    
//    Label *waveMaxNum = [[Label alloc] initWithFont:font text:[NSString stringWithFormat:@"/ %d", numWaves] position:[Vector2 vectorWithX:555 y:20]];
    Label *waveMaxNum = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:@"/ %d", numWaves] atPosition:[Vector2 vectorWithX:555 y:20]];
    waveMaxNum.layerDepth = 0.98f;
    waveMaxNum.horizontalAlign = HorizontalAlignCenter;
    waveMaxNum.verticalAlign = VerticalAlignMiddle;
    [waveMaxNum setScaleUniform:FONT_SCALE_MEDIUM];
    [scene addItem:waveMaxNum];
    [waveMaxNum release];
    
    // Debug - reset dices button
//    resetDices = [[LabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:512 y:60 width:150 height:50] font:font text:@"Reset dices"];
    resetDices = [GraphicsComponent getLabelButtonWithText:@"RESET DICES" atPosition:[Vector2 vectorWithX:512 y:60] width:150 height:50];
    [scene addItem:resetDices];
    
    // end turn button
    endTurn = [GraphicsComponent getImageButtonWithKey:GAMEPLAY_MENU_INTERFACE_HUD_WAVE_COUNTER_SYMBOL_GOOD atPosition:[Vector2 vectorWithX:485 y:34]];
    endTurn.backgroundImage.layerDepth = 0.98f;
    [scene addItem:endTurn];
    
    enemyTurn = [GraphicsComponent getImageWithKey:GAMEPLAY_MENU_INTERFACE_HUD_WAVE_COUNTER_SYMBOL_EVIL atPosition:[Vector2 vectorWithX:485 y:64]];
    enemyTurn.layerDepth = 0.98f;
    
    retreat = [GraphicsComponent getDoubleImageButtonWithKey:TOWN_MENU_INTERFACE_BUTTONS_RETURN atPosition:[Vector2 vectorWithX:974 y:10]];
    retreat.pressedImage.layerDepth = 0.98f;
    retreat.notPressedImage.layerDepth = 0.98f;
    [scene addItem:retreat];
    
    
    // init portraits
    NSString *portraitKeys[KnightTypes] = {GAMEPLAY_MENU_ENTITIES_ALLIES_BRAWLER_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_PALADIN_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_BARD_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_LONGBOWMAN_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_CROSSBOWMAN_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_SCOUT_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_BATTLEMAGE_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_WIZARD_PORTRAIT, GAMEPLAY_MENU_ENTITIES_ALLIES_MONK_PORTRAIT};
    NSString *portraitPosKey = POSITION_HUD_PORTRAITS;
    for (int i = 0; i < CombatPositions; i++) {
        portraits[i] = [GraphicsComponent getImageWithKey:portraitKeys[[GameProgress getKnightOnCombatPosition:i].type] atPosition:[Constants getPositionDataForKey:[portraitPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] width:76 height:76];
        portraits[i].layerDepth = 0.98f;
//        [portraits[i] setScaleUniform:2.0f];
        [scene addItem:portraits[i]];
    }
    
    // init skills
    NSString *knightTypeKeys[KnightTypes] = {GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BRAWLER, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_PALADIN, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BARD, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_LONGBOWMAN, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_CROSSBOWMAN, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_SCOUT, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BATTLEMAGE, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_WIZARD, GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_MONK};
    NSString *skillPosKey = POSITION_HUD_SKILLS;
    for (int i = 0; i < CombatPositions; i++) {
        for (int j = 0; j < SkillTypes; j++) {
            skills[i][j] = [GraphicsComponent getTouchImageWithKey:[knightTypeKeys[[GameProgress getKnightOnCombatPosition:i].type] stringByAppendingString:[NSString stringWithFormat:@"s%d", j + 1]] atPosition:[Constants getPositionDataForKey:[skillPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
            skills[i][j].layerDepth = 0.98f;
            [skills[i][j] setScaleUniform:2.0f];
        }
        
        // skill pressed areas
        Vector2 *pos = [Constants getPositionDataForKey:[skillPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]];
        skillPresedAreas[i] = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:pos.x y:pos.y width:64 height:64]];
        [scene addItem:skillPresedAreas[i]];
    }
    
    // init skill borders
    for (int i = 0; i < CombatPositions; i++) {
        skillBorders[i][BorderTypePhysical] = [GraphicsComponent getImageWithKey:GAMEPLAY_MENU_INTERFACE_SKILLS_BORDER_PHYSICAL atPosition:[Constants getPositionDataForKey:[skillPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
        skillBorders[i][BorderTypePhysical].layerDepth = 0.98f;
        [skillBorders[i][BorderTypePhysical] setScaleUniform:2.0f];
        skillBorders[i][BorderTypeRanged] = [GraphicsComponent getImageWithKey:GAMEPLAY_MENU_INTERFACE_SKILLS_BORDER_RANGED atPosition:[Constants getPositionDataForKey:[skillPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
        skillBorders[i][BorderTypeRanged].layerDepth = 0.98f;
        [skillBorders[i][BorderTypeRanged] setScaleUniform:2.0f];
        skillBorders[i][BorderTypeMagic] = [GraphicsComponent getImageWithKey:GAMEPLAY_MENU_INTERFACE_SKILLS_BORDER_MAGIC atPosition:[Constants getPositionDataForKey:[skillPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
        skillBorders[i][BorderTypeMagic].layerDepth = 0.98f;
        [skillBorders[i][BorderTypeMagic] setScaleUniform:2.0f];
        skillBorders[i][BorderTypeNeutral] = [GraphicsComponent getImageWithKey:GAMEPLAY_MENU_INTERFACE_SKILLS_BORDER_NEUTRAL atPosition:[Constants getPositionDataForKey:[skillPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]]];
        skillBorders[i][BorderTypeNeutral].layerDepth = 0.98f;
        [skillBorders[i][BorderTypeNeutral] setScaleUniform:2.0f];
    }
    
    
    // hp bars
    NSString *hpBarKey = POSITION_HUD_HP_ALLIES;
    MetaData *hpData = [Constants getMetaDataForKey:META_HUD_HP_ALLY];
    for (int i = 0; i < CombatPositions; i++) {
        hpBars[i] = [GraphicsComponent getImageWithKey:GAMEPLAY_MENU_INTERFACE_HUD_HP atPosition:[Constants getPositionDataForKey:[hpBarKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]] width:hpData.width height:hpData.height];
        hpBars[i].layerDepth = 0.98f;
        [scene addItem:hpBars[i]];
    }
    
    
    // combos
    NSString *comboPosKey = POSITION_HUD_COMBOS;
    NSString *comboKeys[StatTypes] = {GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_STRENGTH, GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_ACCURACY, GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_CUNNING, GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_DEFENSE, GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_AGILITY, GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_STURDINESS};
    MetaData *comboData = [Constants getMetaDataForKey:META_HUD_COMBO_STEP];
    for (int i = 0; i < CombatPositions; i++) {
        Vector2 *pos = [Constants getPositionDataForKey:[comboPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]];
        for (int j = 0; j < ComboItems; j++) {
            for (int k = 0; k < StatTypes; k++) {
                combos[i][j][k] = [GraphicsComponent getImageWithKey:comboKeys[k] atPosition:[Vector2 vectorWithX:pos.x y:pos.y]];
                combos[i][j][k].layerDepth = 0.98f;
            }
            
            comboSlotAreas[i][j] = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:pos.x - 2 y:pos.y - 2 width:36 height:36]];
            [scene addItem:comboSlotAreas[i][j]];
            
            pos.x += comboData.step;
        }
    }
    
    
    
    
    // init combo release areas
    NSString *comboAreasPosKey = POSITION_HUD_COMBO_AREAS;
    MetaData *comboAreasMeta = [Constants getMetaDataForKey:META_HUD_COMBO_AREA];
    for (int i = 0; i < CombatPositions; i++) {
        Vector2 *pos = [Constants getPositionDataForKey:[comboAreasPosKey stringByAppendingString:[NSString stringWithFormat:@"%d", i]]];
        comboAreas[i] = [[ReleaseArea alloc] initWithInputArea:[Rectangle rectangleWithX:pos.x y:pos.y width:comboAreasMeta.width height:comboAreasMeta.height]];
        [scene addItem:comboAreas[i]];
    }
    
    
    // enemy hp bars
    // TODO
    
    // hp counters
    // TODO
    
    // End turn button
//    endTurn = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:[Constants backgroundWidth] - 120 y:10 width:110 height:50] background:buttonBackground font:font text:@"End turn"];
//    [scene addItem:endTurn];
    
    // Retreat button
//    retreat = [[ImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:10 y:10 width:110 height:50] background:buttonBackground font:font text:@"Retreat"];
//    [scene addItem:retreat];
    
    
    // load indicator textures
//    hitTexture = [[self.game.content load:HIT] retain];
//    healTexture = [[self.game.content load:HEAL] retain];
//    stunTexture = [[self.game.content load:STAT_EFFECT_STUN] retain];
//    buffTexture = [[self.game.content load:STAT_EFFECT_BUFF] retain];
//    debuffTexture = [[self.game.content load:STAT_EFFECT_DEBUFF] retain];
//    bleedTexture = [[self.game.content load:STAT_EFFECT_BLEED] retain];
//    poisonTexture = [[self.game.content load:STAT_EFFECT_POISON] retain];
//    burnTexture = [[self.game.content load:STAT_EFFECT_BURN] retain];
//    frostbiteTexture = [[self.game.content load:STAT_EFFECT_FROSTBITE] retain];
    
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
//        [SoundEngine play:SoundEffectTypeClick];
        [Level removeAllDices];
        [Level addDices];
    }
    
    if (endTurn.wasReleased) {
//        [SoundEngine play:SoundEffectTypeClick];
        endTurnReleased = YES;
    }
    
    if (retreat.wasReleased) {
//        [SoundEngine play:SoundEffectTypeClick];
//        [self addRetreatInterface];
    }
    
}

- (void) update {
    for (int i = 0; i < CombatPositions; i++) {
        for (int j = 0; j < [[Level knightAtPosition:i].combo count]; j++) {
            Dice *dice = (Dice *) [[Level knightAtPosition:i].combo objectAtIndex:j];
            if (dice) {
                [Level addItemToScene:combos[i][j][dice.type]];
            }
        }
    }
}

- (void) resetEndTurnButton {
    endTurnReleased = NO;
}
//
//- (void) addDamageIndicatorAt:(Vector2 *)position amount:(int)amount isCrit:(BOOL)isCrit {
//    Indicator *indicator;
//    if (isCrit)
//        indicator = [[Indicator alloc] initWithText:[NSString stringWithFormat:@"%d", amount] position:[Vector2 vectorWithX:position.x y:position.y - 56] font:font color:[Color red] duration:0.5f];
//    else
//        indicator = [[Indicator alloc] initWithText:[NSString stringWithFormat:@"%d", amount] position:[Vector2 vectorWithX:position.x y:position.y - 56] font:font color:[Color whiteSmoke] duration:0.5f];
//
//    [scene addItem:indicator];
//    [indicator release];
//}
//
//- (void) addHealIndicatorAt:(Vector2 *)position amount:(int)amount {
//    Indicator *indicator = [[Indicator alloc] initWithText:[NSString stringWithFormat:@"%d", amount] position:[Vector2 vectorWithX:position.x y:position.y - 56] font:font color:[Color green] duration:0.5f];
//    [scene addItem:indicator];
//    [indicator release];
//
//    AnimatedIndicator *animation = [[AnimatedIndicator alloc] initWithTexture:healTexture position:[Vector2 vectorWithX:position.x y:position.y] duration:0.3f];
//    [animation loadHealAnimation];
//    [scene addItem:animation];
//    [animation release];
//}
//
//- (void) addMissIndicatorAt:(Vector2 *)position {
//    Indicator *indicator = [[Indicator alloc] initWithText:@"MISS" position:[Vector2 vectorWithX:position.x y:position.y - 56] font:font color:[Color lightGray] duration:0.5f];
//    [scene addItem:indicator];
//    [indicator release];
//}
//
//- (void) addExpIndicatorAt:(Vector2 *)position amount:(int)amount {
//    Indicator *indicator = [[Indicator alloc] initWithText:[NSString stringWithFormat:@"+ %d EXP", amount] position:[Vector2 vectorWithX:position.x y:position.y - 56] font:font color:[Color blue] duration:0.5f];
//    [scene addItem:indicator];
//    [indicator release];
//}
//
//- (void) addGoldIndicatorAt:(Vector2 *)position amount:(int)amount {
//    Indicator *indicator = [[Indicator alloc] initWithText:[NSString stringWithFormat:@"+ %d G", amount] position:[Vector2 vectorWithX:position.x y:position.y - 56] font:font color:[Color lightGoldenrodYellow] duration:0.5f];
//    [scene addItem:indicator];
//    [indicator release];
//}
//
//
//
//- (void) addTextIndicatorAt:(Vector2 *)position text:(NSString *)text color:(Color *)color {
//    Indicator *indicator = [[Indicator alloc] initWithText:text position:[Vector2 vectorWithX:position.x y:position.y - 100] font:font color:color duration:1.5f];
//    [scene addItem:indicator];
//    [indicator release];
//}
//
//
//
//- (void) addHitIndicatorAt:(Vector2 *)position {
//    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:hitTexture position:position duration:0.4f];
//    [indicator loadHitAnimation];
//    [scene addItem:indicator];
//    [indicator release];
//}
//
//- (void) addBurnIndicatorAt:(Vector2 *)position {
//    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:burnTexture position:position duration:0.5f];
//    [indicator loadBurnAnimation];
//    [scene addItem:indicator];
//    [indicator release];
//}
//
//- (void) addFrostbiteIndicatorAt:(Vector2 *)position {
//    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:frostbiteTexture position:position duration:0.5f];
//    [indicator loadFrostbiteAnimation];
//    [scene addItem:indicator];
//    [indicator release];
//}
//
//- (void) addBleedIndicatorAt:(Vector2 *)position {
//    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:bleedTexture position:position duration:0.4f];
//    [indicator loadBleedAnimation];
//    [scene addItem:indicator];
//    [indicator release];
//}
//
//- (void) addPoisonIndicatorAt:(Vector2 *)position {
//    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:poisonTexture position:position duration:0.5f];
//    [indicator loadPoisonAnimation];
//    [scene addItem:indicator];
//    [indicator release];
//}
//
//- (void) addBuffIndicatorAt:(Vector2 *)position {
//    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:buffTexture position:position duration:0.3f];
//    [indicator loadBuffAnimation];
//    [scene addItem:indicator];
//    [indicator release];
//}
//
//-(void) addDebuffIndicatorAt:(Vector2 *)position {
//    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:debuffTexture position:position duration:0.3f];
//    [indicator loadDebuffAnimation];
//    [scene addItem:indicator];
//    [indicator release];
//}
//
//- (void) addStunIndicatorAt:(Vector2 *)position target:(CombatEntity *)target {
//    AnimatedIndicator *indicator = [[AnimatedIndicator alloc] initWithTexture:stunTexture position:[Vector2 vectorWithX:position.x y:position.y - 50] duration:0.5f];
//    [indicator loadStunAnimationWithTarget:target];
//    [scene addItem:indicator];
//    [indicator release];
//}

- (BOOL) wasDiceDropped:(CombatPosition)pos {
    return comboAreas[pos].wasReleased;
}




- (void) addRetreatInterface {
////    interfaceBackground = [[CompositeImage alloc] initWithImageTextures:interfaceTextures color:[Color saddleBrown] x:370 y:150 width:300 height:100];
//    RetreatInterface *interface = [[RetreatInterface alloc] initWithHud:self contentManager:self.game.content font:font backgroundTextures:interfaceTextures camera:renderer.camera];
////    [scene addItem:interfaceBackground];
//    [scene addItem:interface];
//    [interface release];
//
//    paused = YES;
}

- (void) resumeGame {
    paused = NO;
}

- (BOOL) isLastWave {
    return wave == numWaves;
}

- (void) endGameplayWithWin:(BOOL)isWin {
//    paused = YES;
    
//    DungeonEndInterface *interface = [[DungeonEndInterface alloc] initWithHud:self contentManager:self.game.content font:font backgroundTextures:interfaceTextures camera:renderer.camera win:isWin];
//    [scene addItem:interface];
//    [interface release];
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

- (void) activate {
    [self.game.components addComponent:scene];
    [self.game.components addComponent:renderer];
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
    
    [super dealloc];
}

@end
