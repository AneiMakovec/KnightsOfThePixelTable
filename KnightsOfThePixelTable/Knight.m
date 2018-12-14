//
//  Knight.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "Knight.h"

#import "Pixlron.Knights.h"

@implementation Knight

- (id) initWithHealth:(int)hp damageStrength:(float)theDamageStrength {
    self = [super initWithHealth:hp damageStrength:theDamageStrength];
    if (self != nil) {
        maxLevel = 80;
        currentLevel = 1;
        exp = 0;
        
        radius = 1;
        
        state = EntityStateIdle;
        stats = [NSMutableArray arrayWithCapacity:StatTypes];
        attackDamage = [NSMutableArray arrayWithCapacity:AttackTypes];
        attackDuration = [NSMutableArray arrayWithCapacity:AttackTypes];
        //targets = [NSMutableArray arrayWithCapacity:EnemyPositions];
    }
    return self;
}

@synthesize maxLevel, currentLevel, exp, radius, state, attackType, origin, stats, attackDamage, attackDuration;


- (void) gainExperience:(int)theExp {
    exp += theExp;
    
    // calculate if gained enough experiance to level up
    
}

- (void) levelUp {
    if (currentLevel < maxLevel) {
        currentLevel++;
    }
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    if (state == EntityStateAttacking) {
        id item = attackDuration[attackType];
        
        ResetableLifetime *duration = [item isKindOfClass:[ResetableLifetime class]] ? (ResetableLifetime *)item : nil;
        
        if (duration) {
            if (!duration.isAlive) {
                [duration reset];
                state = EntityStateRetreating;
            } else {
                [duration updateWithGameTime:gameTime];
            }
        }
    }
}

@end
