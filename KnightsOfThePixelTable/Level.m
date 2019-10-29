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

+ (void) addItemToScene:(id)item {
    [levelInstance.scene addItem:item];
}










- (id) initWithGame:(Game *)theGame {
    self = [super initWithGame:theGame];
    if (self != nil) {
        scene = [[SimpleScene alloc] initWithGame:theGame];
        scene.updateOrder = 5;
        
        battlefield = [[Battlefield alloc] initWithLevel:self];
        dicepool = [[Dicepool alloc] initWithLevel:self];
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
