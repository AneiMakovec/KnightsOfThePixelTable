//
//  AIPlayer.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 21/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "AIPlayer.h"
#import "Pixlron.Knights.h"

@implementation AIPlayer

- (id) initWithGame:(Game *)theGame player:(HumanPlayer *)thePlayer level:(Level *)theLevel {
    self = [super initWithGame:theGame];
    if (self != nil) {
        player = thePlayer;
        level = theLevel;
    }
    return self;
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    /*
    if ([player checkIfCanAttack]) {
        Knight *enemy;
        Knight *ally;
        for (id item in level.scene) {
            Knight *entity = [item isKindOfClass:[Knight class]] ? (Knight *)item : nil;
            if (entity) {
                if (entity.type == KnightTypeEnemy) {
                    ally = entity;
                } else if (entity.type == KnightTypeLancelot) {
                    enemy = entity;
                }
            }
        }
        
        ally.attackType = BasicAttack;
        [ally attackTarget:enemy];
    }
     */
}

@end
