//
//  KOTPTEnums.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 03/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

// MARK: entities
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
    StatGainRateSlow,
    StatGainRateMedium,
    StatGainRateFast,
    StatGainRates
} StatGainRate;

typedef enum {
    BasicAttack,
    FirstComboAttack,
    SecondComboAttack,
    ThirdComboAttack,
    AttackTypes,
    NoAttack
} AttackType;

typedef enum {
    DamageTypeMelee,
    DamageTypeRanged,
    DamageTypeMagic,
    DamageTypes
} DamageType;

typedef enum {
    FirstComboItem,
    SecondComboItem,
    ThirdComboItem,
    FourthComboItem,
    ComboItems,
    NoCombo
} ComboItem;

typedef enum {
    EntityStateIdle,
    EntityStateAttacking,
    EntityStateDefending,
    EntityStateApproaching,
    EntityStateRetreating,
    EntityStates
} EntityState;

// MARK: ai
typedef enum {
    AIStateScanOwnMetadata,
    AIStateScanOpponentMetadata,
    AIStateScanDices,
    AIStateAssignDices,
    AIStateAttack,
    AIStates
} AIState;

// MARK: combat positions
typedef enum {
    FirstCombatPosition,
    SecondCombatPosition,
    ThirdCombatPosition,
    FourthCombatPosition,
    CombatPositions
} CombatPosition;

// MARK: level types
typedef enum {
    LevelTypeFarmlands,
    LevelTypePinewoods,
    LevelTypeMountains,
    LevelTypeSeashore,
    LevelTypeFinal,
    LevelTypes
} LevelType;

// MARK: dices
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

// MARK: sounds
typedef enum {
    SoundEffectTypeDice,
    SoundEffectTypeBackground,
    SoundEffectTypeClick,
    SoundEffectTypes
} SoundEffectType;

// MARK: area textures
#define AREA_FARMLANDS @"background_farmlands"
#define AREA_MOUNTAINS @"background_mountains"
#define AREA_PINEWOODS @"background_pinewoods"

// MARK: hud texture
#define HUD @"hud"

// MARK: hp pool texture
#define HP_POOL @"hp_pool"

// MARK: character textures
#define LANCELOT_IDLE @"lancelot_idle"
#define PALADIN_IDLE @"paladin"
#define KNIGHT_IDLE @"knight"

// MARK: skill textures
#define BASIC_ATTACK_MELLEE @"basic_melee_skill"

// MARK: dice textures
#define DICE_ANIM_EVIL @"combat_dice_animation_evil"
#define DICE_ANIM_GOOD @"combat_dice_animation_good"
#define DICE_SYMBOLS @"combat_dices"
