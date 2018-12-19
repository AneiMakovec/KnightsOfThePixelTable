//
//  KOTPTEnums.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 03/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

// entities
typedef enum {
    KnightTypeLancelot,
    KnightTypeEnemy,
    KnightTypes
} KnightType;

typedef enum {
    MonsterTypeWarrior,
    MonsterTypes
} MonsterType;

typedef enum {
    Strength,
    Agility,
    Intelligence,
    Insight,
    Cunning,
    Sturdiness,
    StatTypes
} StatType;

typedef enum {
    StateGainRateSlow,
    StateGainRateMedium,
    StateGainRateFast,
    StatGainRates
} StatGainRate;

typedef enum {
    BasicAttack,
    FirstCombo,
    SecondCombo,
    ThirdCombo,
    AttackTypes
} AttackType;

typedef enum {
    EntityStateIdle,
    EntityStateAttacking,
    EntityStateDefending,
    EntityStateApproaching,
    EntityStateRetreating,
    EntityStateJustAttacked,
    EntityStates
} EntityState;

// combat positions
typedef enum {
    FirstCombatPosition,
    SecondCombatPosition,
    ThirdCombatPosition,
    FourthCombatPosition,
    CombatPositions
} CombatPosition;

// level types
typedef enum {
    LevelTypeFarmlands,
    LevelTypePinewoods,
    LevelTypeMountains,
    LevelTypeSeashore,
    LevelTypeFinal,
    LevelTypes
} LevelType;

// dices
typedef enum {
    DiceFrameTypeGood,
    DiceFrameTypeEvil,
    DiceFrameTypes
} DiceFrameType;

typedef enum {
    DiceStateMoving,
    DiceStateStopped,
    DiceStates
} DiceState;

// sounds
typedef enum {
    SoundEffectTypeDice,
    SoundEffectTypeBackground,
    SoundEffectTypeClick,
    SoundEffectTypes
} SoundEffectType;

// areas
#define AREA_FARMLANDS @"background_farmlands"
#define AREA_MOUNTAINS @"background_mountains"
#define AREA_PINEWOODS @"background_pinewoods"

// hud
#define HUD @"hud"

// characters
#define LANCELOT_IDLE @"lancelot_idle"
#define PALADIN_IDLE @"paladin"
#define KNIGHT_IDLE @"knight"

// dices
#define DICE_ANIM_EVIL @"combat_dice_animation_evil"
#define DICE_ANIM_GOOD @"combat_dice_animation_good"
#define DICE_SYMBOLS @"combat_dices"
