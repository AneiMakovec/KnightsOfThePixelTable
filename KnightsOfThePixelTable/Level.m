//
//  Level.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Level.h"
#import "Pixlron.Knights.h"

Level *levelInstance;

@implementation Level


+ (void) initializeWithGame:(Game *)game {
    levelInstance = [[Level alloc] initWithGame:game];
    levelInstance.updateOrder = 6;
}

+ (void) activate {
    [levelInstance activate];
    [levelInstance.game.components addComponent:levelInstance];
}

+ (void) deactivate {
    [levelInstance deactivate];
    [levelInstance.game.components removeComponent:levelInstance];
}

+ (SimpleScene *) scene {
    return levelInstance.scene;
}

+ (void) addItemToScene:(id)item {
    [levelInstance.scene addItem:item];
}

+ (void) removeItemFromScene:(id)item {
    [levelInstance.scene removeItem:item];
}

+ (void) newWave {
    [levelInstance.battlefield newWave];
}

+ (void) resetDicepool {
    [levelInstance.dicepool resetDicepool];
}

+ (void) removeAllDices {
    [levelInstance.dicepool removeAllDices];
}

+ (void) removeDice:(Dice *)dice {
    [levelInstance.dicepool removeDice:dice];
}

+ (void) addDices {
    [levelInstance.dicepool addDices];
}

+ (NSMutableArray *) dices {
    return levelInstance.dicepool.dices;
}

+ (NSMutableArray *) dicepoolBorders {
    return levelInstance.dicepool.borders;
}

+ (Dice *) diceAtLocation:(Vector2 *)location {
    return [levelInstance.dicepool getDiceAtTouchLocation:location];
}

+ (BOOL) touchedDicepool:(Vector2 *)location {
    return [levelInstance.dicepool.dicepoolArea containsX:location.x y:location.y];
}

+ (BOOL) addDice:(Dice *)dice toPosition:(CombatPosition)pos {
    return [levelInstance.battlefield addDice:dice toPosition:pos];
}

+ (Knight *) knightAtPosition:(CombatPosition)pos {
    return [levelInstance.battlefield getAllyAtPosition:pos];
}










- (id) initWithGame:(Game *)theGame {
    self = [super initWithGame:theGame];
    if (self != nil) {
        scene = [[SimpleScene alloc] initWithGame:theGame];
        scene.updateOrder = 5;
        
        battlefield = [[Battlefield alloc] init];
        dicepool = [[Dicepool alloc] init];
    }
    return self;
}

@synthesize scene, battlefield, dicepool, levelType;

- (void) initialize {
    [self reset];
    
    [super initialize];
}

- (void) reset {
    // remove everything from scene
    [scene clear];
    
    // play battle music
    // TODO

    // dicepool objects
    [dicepool initialize];
    
    // entities
    [battlefield initialize];
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    for (id item in scene) {
        id<ICustomUpdate> updatable = [item conformsToProtocol:@protocol(ICustomUpdate)] ? (id<ICustomUpdate>) item : nil;
        if (updatable) {
            [updatable updateWithGameTime:gameTime];
        }
    }
    
    [battlefield updateWithGameTime:gameTime];
}


- (void) activate {
    [self.game.components addComponent:scene];
}

- (void) deactivate {
    [self.game.components removeComponent:scene];
}


- (void) dealloc {
    [scene release];
    [battlefield release];
    [dicepool release];
    [super dealloc];
}

@end
