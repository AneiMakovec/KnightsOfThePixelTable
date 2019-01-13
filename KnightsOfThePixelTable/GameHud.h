//
//  GameHud.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Content.h"

#import "PixEngine.GUI.h"
#import "PixEngine.Scene.h"

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameHud : GameComponent {
    SimpleScene *scene;
    GUIRenderer *renderer;
    Level *level;
    
    Texture2D *buttonBackground;
    
    Label *waveCounter;
    Label *currentHpCounters[CombatPositions];
    Label *maxHpCounters[CombatPositions];
    
    BOOL endTurnReleased;
    
    // Debug
    Button *resetDices;

    Button *endTurn;
}

@property (nonatomic, readonly) id<IScene> scene;
@property (nonatomic, readonly) BOOL endTurnReleased;

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel;

- (void) increaseWaveCounterTo:(int)wave;

- (void) resetEndTurnButton;

@end

NS_ASSUME_NONNULL_END