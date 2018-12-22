//
//  KnightLancelot.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 17/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import "KnightLancelot.h"

#import "Pixlron.Knights.h"

@implementation KnightLancelot

- (id) initWithPosition:(Vector2 *)thePosition {
    self = [super initWithPosition:thePosition knightType:KnightTypeLancelot health:100 damageStrength:0.85 maxRadius:60];
    if (self != nil) {
        // init stats
        StatValue *statValue;
        for (int i = 0; i < StatTypes; i++) {
            statValue = [[StatValue alloc] initWithValue:[Constants lancelotValueOfStat:i] gainRate:[Constants lancelotGainOfStat:i] upgradeMargin:[Constants lancelotGainMarginOfStat:i]];
            [stats insertObject:statValue atIndex:i];
        }
        
        // init power and durations of attacks
        AttackValue *attackValue;
        ResetableLifetime *attackTime;
        for (int i = 0; i < AttackTypes; i++) {
            attackValue = [[AttackValue alloc] initWithValue:[Constants lancelotPowerOfAttack:i] statUsed:[Constants lancelotStatUsedForAttack:i] gainRate:[Constants lancelotGainOfAttack:i] upgradeMargin:[Constants lancelotGainMarginOfAttack:i]];
            [attackDamage insertObject:attackValue atIndex:i];
            
            attackTime = [[ResetableLifetime alloc] initWithStart:0 duration:[Constants lancelotDurationOfAttack:i]];
            [attackDuration insertObject:attackTime atIndex:i];
        }
    }
    return self;
}

@end
