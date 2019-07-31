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
    MonsterTypeBossKnight,
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
    SkillTargetRow,
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
    EntityStateDead,
    EntityStateStart,
    EntityStates
} EntityState;

typedef enum {
    AnimationTypeIdle,
    AnimationTypeMove,
    AnimationTypeHit,
    AnimationTypeDeath,
    AnimationTypeAttack,
    AnimationTypes
} AnimationType;

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

typedef enum {
    SongTypeTheme,
    SongTypeBattle,
    SongTypes
} SongType;

// MARK: settings
typedef enum {
    SettingTypeSound,
    SettingTypeMusic,
    SettingTypes
} SettingType;

// MARK: menu interface
typedef enum {
    InterfacePropBackground,
    InterfacePropButtonClosePressed,
    InterfacePropButtonCloseNotPressed,
    InterfacePropButtonPressed,
    InterfacePropButtonNotPressed,
    InterfacePropPaneScroll,
    InterfacePropPaneScrollBorder,
    InterfacePropPaneScrollLine,
    InterfacePropPaneSkills,
    InterfacePropPane,
    InterfacePropSlotBronze,
    InterfacePropSlotGold,
    InterfacePropSlotGreen,
    InterfacePropSlotDice,
    InterfacePropTab,
    InterfacePropTypes
} InterfacePropType;

// MARK: camelot menu building types
typedef enum {
    BuildingTypeCastle,
    BuildingTypeBarracks,
    BuildingTypeTrainingYard,
    BuildingTypeBlacksmith,
    BuildingTypeWarbandCamp,
    BuildingTypes
} BuildingType;

// MARK: area textures
#define AREA_FARMLANDS @"background_farmlands"
#define AREA_MOUNTAINS @"background_mountains"
#define AREA_PINEWOODS @"background_pinewoods"
#define AREA_SEASHORE @"background_seashore"

// MARK: menu backgrounds
#define BACKGROUND_MAIN_MENU @"background_main_menu"
#define BACKGROUND_WORLD_MENU @"background_world_menu"
#define BACKGROUND_CAMELOT @"background_camelot"
#define BUTTON_GATE @"button_gate"

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
#define SKILL_ICONS @"skills"

// MARK: dice textures
#define DICE_ANIM_EVIL @"combat_dice_animation_evil"
#define DICE_ANIM_GOOD @"combat_dice_animation_good"
#define DICE_SYMBOLS @"combat_dices"

// MARK: gui textures - buttons
#define FONT @"font"
#define BUTTON_BACKGROUND @"button_background"
#define MUSIC_BUTTON_ENABLED @"enabled_music_button"
#define MUSIC_BUTTON_DISABLED @"disabled_music_button"
#define SOUND_BUTTON_ENABLED @"enabled_sound_button"
#define SOUND_BUTTON_DISABLED @"disabled_sound_button"
#define BUTTON_BACK @"button_back"
#define BUTTON_CONFIRM @"button_confirm"
#define BUTTON_DENY @"button_deny"
#define BUTTON_MUSIC_OFF @"button_music_off"
#define BUTTON_MUSIC_ON @"button_music_on"
#define BUTTON_SETTINGS @"button_settings"
#define BUTTON_DESTINATION @"button_destination"

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

// MARK: gui textures - interface
#define INTERFACE_BACKGROUND @"interface_background"
#define INTERFACE_BUTTON_CLOSE_PRESSED @"interface_button_close_pressed"
#define INTERFACE_BUTTON_CLOSE_NOT_PRESSED @"interface_button_close_not_pressed"
#define INTERFACE_BUTTON_PRESSED @"interface_button_pressed"
#define INTERFACE_BUTTON_NOT_PRESSED @"interface_button_not_pressed"
#define INTERFACE_PANE_SCROLL @"interface_pane_scroll"
#define INTERFACE_PANE_SCROLL_LINE @"interface_pane_scroll_line"
#define INTERFACE_PANE_SCROLL_BORDER @"interface_pane_scroll_border"
#define INTERFACE_PANE_SKILLS @"interface_pane_skills"
#define INTERFACE_PANE @"interface_pane"
#define INTERFACE_SLOT_BRONZE @"interface_slot_bronze"
#define INTERFACE_SLOT_GOLD @"interface_slot_gold"
#define INTERFACE_SLOT_GREEN @"interface_slot_green"
#define INTERFACE_SLOT_DICE @"interface_slot_dice"
#define INTERFACE_TAB @"interface_tab"

// MARK: interface values
#define INTERFACE_LAYER_DEPTH_GROUNDZERO 0.1f
#define INTERFACE_LAYER_DEPTH_BEFOREGROUND 0.05f
#define INTERFACE_LAYER_DEPTH_GROUNDBACK -0.05f
#define INTERFACE_LAYER_DEPTH_BACK -0.1f
#define INTERFACE_LAYER_DEPTH_BACKMID -0.15f
#define INTERFACE_LAYER_DEPTH_MIDDLE -0.2f
#define INTERFACE_LAYER_DEPTH_MIDFRONT -0.25f
#define INTERFACE_LAYER_DEPTH_FRONT -0.3f

#define INTERFACE_SCALE_FONT_MEDIUM 0.7f

// MARK: attack textures
#define PROJECTILE_ARROW @"arrow"
#define PROJECTILE_FIREBALL @"fire_ball"
