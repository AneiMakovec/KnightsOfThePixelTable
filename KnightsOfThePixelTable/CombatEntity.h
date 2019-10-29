//
//  CombatEntity.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 14/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.Scene.Objects.h"
#import "Pixlron.Knights.classes.h"
#import "ICombatEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface CombatEntity : Entity<ICombatEntity> {
    // physics variables
    Vector2 *position;
    Vector2 *velocity;
    float radius;
    float maxRadius;
    
    // move points
    BattlePosition *origin;
    BattlePosition *attackPosition;
    
    // class holding entity stats, skills and types
    EntityData *entityData;
    
    // touch area
//    Rectangle *entityArea;
    
    // action switches
    BOOL stunned;
    BOOL finishedAttacking;
    BOOL isTargeted;
    
    // combo check variables
    NSMutableArray *combo;
    
    // current skill
    SkillType skillType;
    
    // position of unit on the battlefield
//    CombatPosition combatPosition;
    
    // state of unit
    EntityState state;
    
    // active conditions
    NSMutableArray *conditions;
    
    // selected targets
    NSMutableArray *targets;
    
    AnimatedSprite *animations[AnimationTypes];
}

- (id) initWithData:(EntityData *)data;

@end

NS_ASSUME_NONNULL_END
