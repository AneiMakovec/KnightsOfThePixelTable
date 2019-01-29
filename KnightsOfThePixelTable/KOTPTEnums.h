//
//  KOTPTEnums.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 03/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

// MARK: entities
typedef enum {
    KnightTypeBrawler,
    KnightTypeBowman,
    KnightTypePaladin,
    KnightTypeFireEnchantress,
    KnightTypes
} KnightType;

typedef enum {
    MonsterTypeWarrior,
    MonsterTypeBrute,
    MonsterTypeBossViking,
    MonsterTypes
} MonsterType;

typedef enum {
    ExpTypeNormal,
    ExpTypeElite,
    ExpTypeBoss,
    ExpTypes
} ExpType;

typedef enum {
    Strength,
    Agility,
    Defence,
    Insight,
    Cunning,
    Sturdiness,
    StatTypes
} StatType;

typedef enum {
    StatUpgradeSlow,
    StatUpgradeMedium,
    StatUpgradeFast,
    StatUpgradeVeryFast,
    StatUpgrades
} StatUpgrade;

typedef enum {
    BasicAttack,
    FirstComboSkill,
    SecondComboSkill,
    ThirdComboSkill,
    SkillTypes,
    NoSkill
} SkillType;

typedef enum {
    SkillRangeMelee,
    SkillRangeRanged,
    SkillRanges
} SkillRange;

typedef enum {
    SkillTargetSelf,
    SkillTargetSingle,
    SkillTargetFrontRow,
    SkillTargetBackRow,
    SkillTargetAll,
    SkillTargets
} SkillTarget;

typedef enum {
    SkillFunctionDamage,
    SkillFunctionHeal,
    SkillFunctionUtility,
    SkillFunctions
} SkillFunction;

typedef enum {
    SkillEffectRemoveBuffs,
    SkillEffectRemoveDebuffs,
    SkillEffectRemoveConditions,
    SkillEffectIncreaseBuff,
    SkillEffectIncreaseDebuff,
    SkillEffectDecreaseBuff,
    SkillEffectDecreaseDebuff,
    SkillEffects
} SkillEffect;

typedef enum {
    SkillUseOnEnemy,
    SkillUseOnAlly,
    SkillUseOns
} SkillUseOn;

typedef enum {
    ConditionTypeBleed,
    ConditionTypeBurn,
    ConditionTypePoison,
    ConditionTypeFrostbite,
    ConditionTypeStun,
    ConditionTypes
} ConditionType;

typedef enum {
    DamageTypeMelee,
    DamageTypeRanged,
    DamageTypeMagic,
    DamageTypes,
    NoDamageType
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
    EntityStateStart,
    EntityStateDead,
    EntityStates
} EntityState;

// MARK: ai
typedef enum {
    AIStateScanOwnData,
    AIStateScanOpponentData,
    AIStateScanDices,
    AIStateAssignDices,
    AIStateWait,
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
    DiceStateRolling,
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

// MARK: settings
typedef enum {
    SettingTypeSound,
    SettingTypeMusic,
    SettingTypes
} SettingType;

// MARK: area textures
#define AREA_FARMLANDS @"background_farmlands"
#define AREA_MOUNTAINS @"background_mountains"
#define AREA_PINEWOODS @"background_pinewoods"
#define AREA_SEASHORE @"background_seashore"

// MARK: menu backgrounds
#define BACKGROUND_MAIN_MENU @"background_main_menu"

// MARK: hud texture
#define HUD @"hud"
#define HUD_WAVE_COUNTER @"hud_wave_counter"

// MARK: hp pool texture
#define HP_POOL @"hp_pool"
#define HP_ENEMY_POOL @"enemy_hp_pool"

// MARK: character textures
#define CHARACTER_BRAWLER @"character_class_brawler"
#define CHARACTER_BOWMAN @"character_class_bowman"
#define CHARACTER_PALADIN @"character_class_paladin"
#define CHARACTER_FIRE_ENCHANTRESS @"character_class_fire_enchantress"

#define ENEMY_SWORDSMAN @"character_enemy_swordsman"
#define ENEMY_BRUTE @"character_enemy_brute"
#define ENEMY_VIKING_BOSS @"character_enemy_boss_viking"

// MARK: skill textures
#define BASIC_ATTACK_MELLEE @"basic_melee_skill"

// MARK: dice textures
#define DICE_ANIM_EVIL @"combat_dice_animation_evil"
#define DICE_ANIM_GOOD @"combat_dice_animation_good"
#define DICE_SYMBOLS @"combat_dices"

// MARK: gui textures - buttons
#define FONT @"font"
#define BACK_BUTTON @"back_button"
#define MUSIC_BUTTON_ENABLED @"enabled_music_button"
#define MUSIC_BUTTON_DISABLED @"disabled_music_button"
#define SOUND_BUTTON_ENABLED @"enabled_sound_button"
#define SOUND_BUTTON_DISABLED @"disabled_sound_button"

// MARK: gui textures - effects
#define HEAL @"heal"
#define HIT @"hit"
#define STAT_EFFECT_BURN @"status_effect_burn"
#define STAT_EFFECT_FROSTBITE @"status_effect_frostbite"
#define STAT_EFFECT_BLEED @"status_effect_bleed"
#define STAT_EFFECT_BUFF @"status_effect_buff"
#define STAT_EFFECT_DEBUFF @"status_effect_debuff"
#define STAT_EFFECT_POISON @"status_effect_poison"
#define STAT_EFFECT_STUN @"status_effect_stun"

// MARK: attack textures
#define PROJECTILE_ARROW @"arrow"
#define PROJECTILE_FIREBALL @"fire_ball"
