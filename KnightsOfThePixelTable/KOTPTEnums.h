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
    KnightTypePaladin,
    KnightTypeBard,
    KnightTypeLongbowman,
    KnightTypeCrossbowman,
    KnightTypeScout,
    KnightTypeBattlemage,
    KnightTypeWizard,
    KnightTypeMonk,
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
    Accuracy,
    Cunning,
    Defence,
    Agility,
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
    CharacterTypeBrave,
    CharacterTypeCalm,
    CharacterTypeBold,
    CharacterTypePrepared,
    CharacterTypeHasty,
    CharacterTypeCareful
} CharacterType;

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
    DamageTypePhysical,
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
    SongTypeMainMenu,
    SongTypeTownMenu,
    SongTypeWorldMenu,
    SongTypes
} SongType;

// MARK: upgrade stage
typedef enum {
    LvlZero,
    LvlOne,
    LvlTwo,
    LvlThree,
    LvlFour,
    LvlFive,
    LvlSix,
    LvlSeven,
    LvlEight,
    LvlNine,
    LvlTen,
    Lvls
} Lvl;

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
    BuildingTypeGatehouse,
    BuildingTypes,
    NoBuilding
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
#define INTERFACE_LAYER_DEPTH_GROUNDZERO 0.03f
#define INTERFACE_LAYER_DEPTH_BEFOREGROUND 0.02f
#define INTERFACE_LAYER_DEPTH_ALMOSTGROUND 0.01f
#define INTERFACE_LAYER_DEPTH_GROUNDBACK -0.01f
#define INTERFACE_LAYER_DEPTH_BACK -0.02f
#define INTERFACE_LAYER_DEPTH_BACKMID -0.03f
#define INTERFACE_LAYER_DEPTH_MIDDLE -0.04f
#define INTERFACE_LAYER_DEPTH_MIDFRONT -0.05f
#define INTERFACE_LAYER_DEPTH_FRONT -0.06f

#define INTERFACE_LAYER_FRONT -0.1f

#define FONT_SCALE_TINY 0.5f
#define FONT_SCALE_SMALL 1.0f
#define FONT_SCALE_MEDIUM 1.5f
#define FONT_SCALE_BIG 2.0f
#define FONT_SCALE_HUGE 3.0f
#define FONT_SCALE_MAIN_MENU 2.0f

// MARK: attack textures
#define PROJECTILE_ARROW @"arrow"
#define PROJECTILE_FIREBALL @"fire_ball"







// MARK: SPRITESHEETS
#define SPRITESHEET_0 @"spritesheet_0"
#define SPRITESHEET_1 @"spritesheet_1"
#define DATA_ANIMATIONS @"data_animations"
#define DATA_CONSTANTS @"data_constants"

// MARK: DATA FILE SEGMENTS
#define POSITION_DATA @"position_data"
#define VALUE_DATA @"value_data"
#define TEXT_DATA @"text_data"
#define META_DATA @"meta_data"

#define FONT @"lilliput_steps_shadowed"




// MARK: CONTENT KEYS

// MARK: MUSIC
#define AUDIO_MUSIC_THEME_MAIN_MENU @"theme_main_menu"
#define AUDIO_MUSIC_THEME_TOWN_MENU @"theme_town_menu"
#define AUDIO_MUSIC_THEME_WORLD_MENU @"theme_world_menu"

// MARK: MAIN MENU
#define MAIN_MENU_BACKGROUND @"main_menu/background"



// MARK: TOWN MENU
#define TOWN_MENU_BACKGROUND @"town_menu/background"

#define TOWN_MENU_BUILDINGS_BARRACKS @"town_menu/buildings/barracks"
#define TOWN_MENU_BUILDINGS_BLACKSMITH @"town_menu/buildings/blacksmith"
#define TOWN_MENU_BUILDINGS_CASTLE @"town_menu/buildings/castle"
#define TOWN_MENU_BUILDINGS_GATEHOUSE @"town_menu/buildings/gatehouse"
#define TOWN_MENU_BUILDINGS_TRAINING_YARD @"town_menu/buildings/training_yard"
#define TOWN_MENU_BUILDINGS_WARBAND_CAMP @"town_menu/buildings/warband_camp"

#define TOWN_MENU_INTERFACE_BACKGROUND @"town_menu/interface/background"
#define TOWN_MENU_INTERFACE_BACK_IMAGE_BARRACKS @"town_menu/interface/back_image_barracks"
#define TOWN_MENU_INTERFACE_BACK_IMAGE_WARBAND_CAMP @"town_menu/interface/back_image_warband_camp"
#define TOWN_MENU_INTERFACE_BACK_IMAGE_TRAINING_YARD @"town_menu/interface/back_image_training_yard"
#define TOWN_MENU_INTERFACE_DIALOG @"town_menu/interface/dialog"
#define TOWN_MENU_INTERFACE_PANE_SCROLL_BORDER @"town_menu/interface/pane_scroll_border"
#define TOWN_MENU_INTERFACE_PANE_SCROLL_LINE @"town_menu/interface/pane_scroll_line"
#define TOWN_MENU_INTERFACE_PANE_SCROLL @"town_menu/interface/pane_scroll"
#define TOWN_MENU_INTERFACE_PANE_SKILLS @"town_menu/interface/pane_skills"
#define TOWN_MENU_INTERFACE_PANE_STATS @"town_menu/interface/pane_stats"
#define TOWN_MENU_INTERFACE_POP_UP @"town_menu/interface/pop_up"
#define TOWN_MENU_INTERFACE_SCROLL @"town_menu/interface/scroll"
#define TOWN_MENU_INTERFACE_XP @"town_menu/interface/xp"
#define TOWN_MENU_INTERFACE_BUTTONS_CLOSE_PRESSED @"town_menu/interface/buttons/close_pressed"
#define TOWN_MENU_INTERFACE_BUTTONS_CLOSE @"town_menu/interface/buttons/close"
#define TOWN_MENU_INTERFACE_BUTTONS_CONFIRM_PRESSED @"town_menu/interface/buttons/confirm_pressed"
#define TOWN_MENU_INTERFACE_BUTTONS_CONFIRM @"town_menu/interface/buttons/confirm"
#define TOWN_MENU_INTERFACE_BUTTONS_DEFAULT_PRESSED @"town_menu/interface/buttons/default_pressed"
#define TOWN_MENU_INTERFACE_BUTTONS_DEFAULT @"town_menu/interface/buttons/default"
#define TOWN_MENU_INTERFACE_BUTTONS_RETURN_PRESSED @"town_menu/interface/buttons/return_pressed"
#define TOWN_MENU_INTERFACE_BUTTONS_RETURN @"town_menu/interface/buttons/return"
#define TOWN_MENU_INTERFACE_BUTTONS_SETTINGS_PRESSED @"town_menu/interface/buttons/settings_pressed"
#define TOWN_MENU_INTERFACE_BUTTONS_SETTINGS @"town_menu/interface/buttons/settings"
#define TOWN_MENU_INTERFACE_BUTTONS_SKILL_PRESSED @"town_menu/interface/buttons/skill_pressed"
#define TOWN_MENU_INTERFACE_BUTTONS_SKILL @"town_menu/interface/buttons/skill"
#define TOWN_MENU_INTERFACE_BUTTONS_SOUND_OFF_PRESSED @"town_menu/interface/buttons/sound_off_pressed"
#define TOWN_MENU_INTERFACE_BUTTONS_SOUND_OFF @"town_menu/interface/buttons/sound_off"
#define TOWN_MENU_INTERFACE_BUTTONS_SOUND_ON_PRESSED @"town_menu/interface/buttons/sound_on_pressed"
#define TOWN_MENU_INTERFACE_BUTTONS_SOUND_ON @"town_menu/interface/buttons/sound_on"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_BARD @"town_menu/interface/icons/equipment/armor/bard"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_BATTLEMAGE @"town_menu/interface/icons/equipment/armor/battlemage"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_BRAWLER @"town_menu/interface/icons/equipment/armor/brawler"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_CROSSBOWMAN @"town_menu/interface/icons/equipment/armor/crossbowman"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_LONGBOWMAN @"town_menu/interface/icons/equipment/armor/longbowman"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_MONK @"town_menu/interface/icons/equipment/armor/monk"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_PALADIN @"town_menu/interface/icons/equipment/armor/paladin"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_SCOUT @"town_menu/interface/icons/equipment/armor/scout"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_ARMOR_WIZARD @"town_menu/interface/icons/equipment/armor/wizard"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_BARD @"town_menu/interface/icons/equipment/weapon/bard"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_BATTLEMAGE @"town_menu/interface/icons/equipment/weapon/battlemage"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_BRAWLER @"town_menu/interface/icons/equipment/weapon/brawler"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_CROSSBOWMAN @"town_menu/interface/icons/equipment/weapon/crossbowman"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_LONGBOWMAN @"town_menu/interface/icons/equipment/weapon/longbowman"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_MONK @"town_menu/interface/icons/equipment/weapon/monk"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_PALADIN @"town_menu/interface/icons/equipment/weapon/paladin"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_SCOUT @"town_menu/interface/icons/equipment/weapon/scout"
#define TOWN_MENU_INTERFACE_ICONS_EQUIPMENT_WEAPON_WIZARD @"town_menu/interface/icons/equipment/weapon/wizard"
#define TOWN_MENU_INTERFACE_ICONS_GOLD_COIN @"town_menu/interface/icons/gold/coin"
#define TOWN_MENU_INTERFACE_ICONS_GOLD_STACK @"town_menu/interface/icons/gold/stack"
#define TOWN_MENU_INTERFACE_ICONS_TYPE_MAGIC @"town_menu/interface/icons/type/magic"
#define TOWN_MENU_INTERFACE_ICONS_TYPE_PHYSICAL @"town_menu/interface/icons/type/physical"
#define TOWN_MENU_INTERFACE_ICONS_TYPE_RANGED @"town_menu/interface/icons/type/ranged"
#define TOWN_MENU_INTERFACE_ICONS_FLAG @"town_menu/interface/icons/flag"
#define TOWN_MENU_INTERFACE_SLOTS_BRONZE @"town_menu/interface/slots/bronze"
#define TOWN_MENU_INTERFACE_SLOTS_DICE @"town_menu/interface/slots/dice"
#define TOWN_MENU_INTERFACE_SLOTS_GOLD @"town_menu/interface/slots/gold"
#define TOWN_MENU_INTERFACE_SLOTS_GREEN @"town_menu/interface/slots/green"
#define TOWN_MENU_INTERFACE_WINDOW_CENTER @"town_menu/interface/window/center"
#define TOWN_MENU_INTERFACE_WINDOW_DOWN_LEFT @"town_menu/interface/window/down_left"
#define TOWN_MENU_INTERFACE_WINDOW_DOWN_RIGHT @"town_menu/interface/window/down_right"
#define TOWN_MENU_INTERFACE_WINDOW_DOWN @"town_menu/interface/window/down"
#define TOWN_MENU_INTERFACE_WINDOW_LEFT @"town_menu/interface/window/left"
#define TOWN_MENU_INTERFACE_WINDOW_RIGHT @"town_menu/interface/window/right"
#define TOWN_MENU_INTERFACE_WINDOW_UP_LEFT @"town_menu/interface/window/up_left"
#define TOWN_MENU_INTERFACE_WINDOW_UP_RIGHT @"town_menu/interface/window/up_right"
#define TOWN_MENU_INTERFACE_WINDOW_UP @"town_menu/interface/window/up"

#define TOWN_MENU_INTERFACE_WINDOW @"town_menu/interface/window"

#define TOWN_MENU_TUTORIAL_BARRACKS @"town_menu/tutorial/barracks"
#define TOWN_MENU_TUTORIAL_BLACKSMITH @"town_menu/tutorial/blacksmith"
#define TOWN_MENU_TUTORIAL_CASTLE @"town_menu/tutorial/castle"
#define TOWN_MENU_TUTORIAL_GATEHOUSE @"town_menu/tutorial/gatehouse"
#define TOWN_MENU_TUTORIAL_MERLIN @"town_menu/tutorial/merlin"
#define TOWN_MENU_TUTORIAL_TRAINING_YARD @"town_menu/tutorial/training_yard"
#define TOWN_MENU_TUTORIAL_WARBAND_CAMP @"town_menu/tutorial/warband_camp"
#define TOWN_MENU_TUTORIAL_ARROW_ANIMATION @"town_menu/tutorial/arrow/"



// MARK: WORLD MENU
#define WORLD_MENU_BUTTONS_EASY_LOCKED @"world_menu/buttons/easy_locked"
#define WORLD_MENU_BUTTONS_EASY_PRESSED @"world_menu/buttons/easy_pressed"
#define WORLD_MENU_BUTTONS_EASY @"world_menu/buttons/easy"
#define WORLD_MENU_BUTTONS_HARD_LOCKED @"world_menu/buttons/hard_locked"
#define WORLD_MENU_BUTTONS_HARD_PRESSED @"world_menu/buttons/hard_pressed"
#define WORLD_MENU_BUTTONS_HARD @"world_menu/buttons/hard"
#define WORLD_MENU_BUTTONS_MEDIUM_LOCKED @"world_menu/buttons/medium_locked"
#define WORLD_MENU_BUTTONS_MEDIUM_PRESSED @"world_menu/buttons/medium_pressed"
#define WORLD_MENU_BUTTONS_MEDIUM @"world_menu/buttons/medium"

#define WORLD_MENU_MAP @"world_menu/map"
#define WORLD_MENU_MARKER_LOCKED @"world_menu/marker_locked"
#define WORLD_MENU_MARKER_LOCKED_PRESSED @"world_menu/marker_locked_pressed"
#define WORLD_MENU_MARKER_UNLOCKED @"world_menu/marker_unlocked"
#define WORLD_MENU_MARKER_UNLOCKED_PRESSED @"world_menu/marker_unlocked_pressed"
#define WORLD_MENU_PANEL_CLOSE @"world_menu/panel_close"
#define WORLD_MENU_PANEL @"world_menu/panel"
#define WORLD_MENU_PATH_FARMLANDS @"world_menu/path_farmlands"
#define WORLD_MENU_PATH_PINEWOODS @"world_menu/path_pinewoods"
#define WORLD_MENU_PATH_MOUNTAINS @"world_menu/path_mountains"
#define WORLD_MENU_PATH_SEASHORE @"world_menu/path_seashore"



// MARK: GAMEPLAY MENU
#define GAMEPLAY_MENU_BACKGROUND_FARMLANDS @"gameplay_menu/background/farmlands"
#define GAMEPLAY_MENU_BACKGROUND_MOUNTAINS @"gameplay_menu/background/mountains"
#define GAMEPLAY_MENU_BACKGROUND_PINEWOODS @"gameplay_menu/background/pinewoods"
#define GAMEPLAY_MENU_BACKGROUND_SEASHORE @"gameplay_menu/background/seashore"

#define GAMEPLAY_MENU_ENTITIES_ALLIES_BARD_ACTION @"gameplay_menu/entities/allies/bard/action/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BARD_ATTACK @"gameplay_menu/entities/allies/bard/attack/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BARD_DEATH @"gameplay_menu/entities/allies/bard/death/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BARD_HIT @"gameplay_menu/entities/allies/bard/hit/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BARD_IDLE @"gameplay_menu/entities/allies/bard/idle/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BARD_PORTRAIT @"gameplay_menu/entities/allies/bard/portrait"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BATTLEMAGE_ACTION @"gameplay_menu/entities/allies/battlemage/action/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BATTLEMAGE_ATTACK @"gameplay_menu/entities/allies/battlemage/attack/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BATTLEMAGE_DEATH @"gameplay_menu/entities/allies/battlemage/death/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BATTLEMAGE_HIT @"gameplay_menu/entities/allies/battlemage/hit/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BATTLEMAGE_IDLE @"gameplay_menu/entities/allies/battlemage/idle/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BATTLEMAGE_PORTRAIT @"gameplay_menu/entities/allies/battlemage/portrait"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BRAWLER_ATTACK @"gameplay_menu/entities/allies/brawler/attack/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BRAWLER_DEATH @"gameplay_menu/entities/allies/brawler/death/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BRAWLER_HIT @"gameplay_menu/entities/allies/brawler/hit/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BRAWLER_IDLE @"gameplay_menu/entities/allies/brawler/idle/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_BRAWLER_PORTRAIT @"gameplay_menu/entities/allies/brawler/portrait"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_CROSSBOWMAN_ACTION @"gameplay_menu/entities/allies/crossbowman/action/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_CROSSBOWMAN_ATTACK @"gameplay_menu/entities/allies/crossbowman/attack/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_CROSSBOWMAN_DEATH @"gameplay_menu/entities/allies/crossbowman/death/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_CROSSBOWMAN_HIT @"gameplay_menu/entities/allies/crossbowman/hit/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_CROSSBOWMAN_IDLE @"gameplay_menu/entities/allies/crossbowman/idle/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_CROSSBOWMAN_PORTRAIT @"gameplay_menu/entities/allies/crossbowman/portrait"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_LONGBOWMAN_ATTACK @"gameplay_menu/entities/allies/longbowman/attack/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_LONGBOWMAN_DEATH @"gameplay_menu/entities/allies/longbowman/death/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_LONGBOWMAN_HIT @"gameplay_menu/entities/allies/longbowman/hit/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_LONGBOWMAN_IDLE @"gameplay_menu/entities/allies/longbowman/idle/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_LONGBOWMAN_PORTRAIT @"gameplay_menu/entities/allies/longbowman/portrait"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_MONK_ATTACK @"gameplay_menu/entities/allies/monk/attack/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_MONK_DEATH @"gameplay_menu/entities/allies/monk/death/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_MONK_HIT @"gameplay_menu/entities/allies/monk/hit/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_MONK_IDLE @"gameplay_menu/entities/allies/monk/idle/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_MONK_PORTRAIT @"gameplay_menu/entities/allies/monk/portrait"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_PALADIN_ACTION @"gameplay_menu/entities/allies/paladin/action/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_PALADIN_ATTACK @"gameplay_menu/entities/allies/paladin/attack/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_PALADIN_DEATH @"gameplay_menu/entities/allies/paladin/death/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_PALADIN_HIT @"gameplay_menu/entities/allies/paladin/hit/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_PALADIN_IDLE @"gameplay_menu/entities/allies/paladin/idle/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_PALADIN_PORTRAIT @"gameplay_menu/entities/allies/paladin/portrait"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_SCOUT_ACTION @"gameplay_menu/entities/allies/scout/action/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_SCOUT_ATTACK @"gameplay_menu/entities/allies/scout/attack/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_SCOUT_DEATH @"gameplay_menu/entities/allies/scout/death/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_SCOUT_HIT @"gameplay_menu/entities/allies/scout/hit/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_SCOUT_IDLE @"gameplay_menu/entities/allies/scout/idle/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_SCOUT_PORTRAIT @"gameplay_menu/entities/allies/scout/portrait"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_WIZARD_ATTACK @"gameplay_menu/entities/allies/wizard/attack/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_WIZARD_DEATH @"gameplay_menu/entities/allies/wizard/death/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_WIZARD_HIT @"gameplay_menu/entities/allies/wizard/hit/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_WIZARD_IDLE @"gameplay_menu/entities/allies/wizard/idle/"
#define GAMEPLAY_MENU_ENTITIES_ALLIES_WIZARD_PORTRAIT @"gameplay_menu/entities/allies/wizard/portrait"

#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_FARMLANDS_ACTION @"gameplay_menu/entities/enemies/boss/farmlands/action/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_FARMLANDS_ATTACK @"gameplay_menu/entities/enemies/boss/farmlands/attack/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_FARMLANDS_DEATH @"gameplay_menu/entities/enemies/boss/farmlands/death/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_FARMLANDS_HIT @"gameplay_menu/entities/enemies/boss/farmlands/hit/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_FARMLANDS_IDLE @"gameplay_menu/entities/enemies/boss/farmlands/idle/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_MOUNTAINS_ATTACK @"gameplay_menu/entities/enemies/boss/mountains/attack/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_MOUNTAINS_DEATH @"gameplay_menu/entities/enemies/boss/mountains/death/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_MOUNTAINS_HIT @"gameplay_menu/entities/enemies/boss/mountains/hit/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_MOUNTAINS_IDLE @"gameplay_menu/entities/enemies/boss/mountains/idle/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_PINEWOODS_ACTION @"gameplay_menu/entities/enemies/boss/pinewoods/action/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_PINEWOODS_ATTACK @"gameplay_menu/entities/enemies/boss/pinewoods/attack/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_PINEWOODS_DEATH @"gameplay_menu/entities/enemies/boss/pinewoods/death/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_PINEWOODS_HIT @"gameplay_menu/entities/enemies/boss/pinewoods/hit/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_PINEWOODS_IDLE @"gameplay_menu/entities/enemies/boss/pinewoods/idle/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_SEASHORE_ACTION @"gameplay_menu/entities/enemies/boss/seashore/action/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_SEASHORE_ATTACK @"gameplay_menu/entities/enemies/boss/seashore/attack/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_SEASHORE_DEATH @"gameplay_menu/entities/enemies/boss/seashore/death/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_SEASHORE_HIT @"gameplay_menu/entities/enemies/boss/seashore/hit/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_BOSS_SEASHORE_IDLE @"gameplay_menu/entities/enemies/boss/seashore/idle/"

#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_AXETHROWER_ATTACK @"gameplay_menu/entities/enemies/normal/axethrower/attack/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_AXETHROWER_DEATH @"gameplay_menu/entities/enemies/normal/axethrower/death/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_AXETHROWER_HIT @"gameplay_menu/entities/enemies/normal/axethrower/hit/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_AXETHROWER_IDLE @"gameplay_menu/entities/enemies/normal/axethrower/idle/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_BERSERKER_ATTACK @"gameplay_menu/entities/enemies/normal/berserker/attack/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_BERSERKER_DEATH @"gameplay_menu/entities/enemies/normal/berserker/death/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_BERSERKER_HIT @"gameplay_menu/entities/enemies/normal/berserker/hit/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_BERSERKER_IDLE @"gameplay_menu/entities/enemies/normal/berserker/idle/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_HORNBEARER_ACTION @"gameplay_menu/entities/enemies/normal/hornbearer/action/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_HORNBEARER_ATTACK @"gameplay_menu/entities/enemies/normal/hornbearer/attack/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_HORNBEARER_DEATH @"gameplay_menu/entities/enemies/normal/hornbearer/death/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_HORNBEARER_HIT @"gameplay_menu/entities/enemies/normal/hornbearer/hit/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_HORNBEARER_IDLE @"gameplay_menu/entities/enemies/normal/hornbearer/idle/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_HUSCARL_ACTION @"gameplay_menu/entities/enemies/normal/huscarl/action/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_HUSCARL_ATTACK @"gameplay_menu/entities/enemies/normal/huscarl/attack/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_HUSCARL_DEATH @"gameplay_menu/entities/enemies/normal/huscarl/death/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_HUSCARL_HIT @"gameplay_menu/entities/enemies/normal/huscarl/hit/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_HUSCARL_IDLE @"gameplay_menu/entities/enemies/normal/huscarl/idle/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_RUNEMASTER_ATTACK @"gameplay_menu/entities/enemies/normal/runemaster/attack/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_RUNEMASTER_DEATH @"gameplay_menu/entities/enemies/normal/runemaster/death/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_RUNEMASTER_HIT @"gameplay_menu/entities/enemies/normal/runemaster/hit/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_RUNEMASTER_IDLE @"gameplay_menu/entities/enemies/normal/runemaster/idle/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SHAMAN_ATTACK @"gameplay_menu/entities/enemies/normal/shaman/attack/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SHAMAN_DEATH @"gameplay_menu/entities/enemies/normal/shaman/death/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SHAMAN_HIT @"gameplay_menu/entities/enemies/normal/shaman/hit/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SHAMAN_IDLE @"gameplay_menu/entities/enemies/normal/shaman/idle/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SLAVER_ACTION @"gameplay_menu/entities/enemies/normal/slaver/action/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SLAVER_ATTACK @"gameplay_menu/entities/enemies/normal/slaver/attack/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SLAVER_DEATH @"gameplay_menu/entities/enemies/normal/slaver/death/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SLAVER_HIT @"gameplay_menu/entities/enemies/normal/slaver/hit/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SLAVER_IDLE @"gameplay_menu/entities/enemies/normal/slaver/idle/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SLINGER_ACTION @"gameplay_menu/entities/enemies/normal/slinger/action/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SLINGER_ATTACK @"gameplay_menu/entities/enemies/normal/slinger/attack/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SLINGER_DEATH @"gameplay_menu/entities/enemies/normal/slinger/death/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SLINGER_HIT @"gameplay_menu/entities/enemies/normal/slinger/hit/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SLINGER_IDLE @"gameplay_menu/entities/enemies/normal/slinger/idle/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SORCERER_ATTACK @"gameplay_menu/entities/enemies/normal/sorcerer/attack/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SORCERER_DEATH @"gameplay_menu/entities/enemies/normal/sorcerer/death/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SORCERER_HIT @"gameplay_menu/entities/enemies/normal/sorcerer/hit/"
#define GAMEPLAY_MENU_ENTITIES_ENEMIES_NORMAL_SORCERER_IDLE @"gameplay_menu/entities/enemies/normal/sorcerer/idle/"

#define GAMEPLAY_MENU_INTERFACE_HUD_DICEPOOL_ALLY @"gameplay_menu/interface/hud/dicepool_ally"
#define GAMEPLAY_MENU_INTERFACE_HUD_DICEPOOL_ENEMY @"gameplay_menu/interface/hud/dicepool_enemy"
#define GAMEPLAY_MENU_INTERFACE_HUD_HP_POOL_ENEMY @"gameplay_menu/interface/hud/hp_pool_enemy"
#define GAMEPLAY_MENU_INTERFACE_HUD_HP @"gameplay_menu/interface/hud/hp"
#define GAMEPLAY_MENU_INTERFACE_HUD_HUD @"gameplay_menu/interface/hud/hud"
#define GAMEPLAY_MENU_INTERFACE_HUD_WAVE_COUNTER_SYMBOL_EVIL @"gameplay_menu/interface/hud/wave_counter_symbol_evil"
#define GAMEPLAY_MENU_INTERFACE_HUD_WAVE_COUNTER_SYMBOL_GOOD @"gameplay_menu/interface/hud/wave_counter_symbol_good"
#define GAMEPLAY_MENU_INTERFACE_HUD_WAVE_COUNTER @"gameplay_menu/interface/hud/wave_counter"

#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_BLEEDING_MAGIC_ATTACK @"gameplay_menu/interface/skills/animations/bleeding_magic_attack/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_BLUNT @"gameplay_menu/interface/skills/animations/blunt/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_BOMB @"gameplay_menu/interface/skills/animations/bomb/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_ELECTRIC_MAGIC @"gameplay_menu/interface/skills/animations/electric/magic/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_ELECTRIC_PHYSICAL @"gameplay_menu/interface/skills/animations/electric/physical/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_FIRE @"gameplay_menu/interface/skills/animations/fire/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_FROST @"gameplay_menu/interface/skills/animations/frost/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_HEAL @"gameplay_menu/interface/skills/animations/heal/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_HOLY_HEAVY @"gameplay_menu/interface/skills/animations/holy/heavy/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_HOLY_LIGHT @"gameplay_menu/interface/skills/animations/holy/light/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_INSPIRING @"gameplay_menu/interface/skills/animations/inspiring/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_NATURE @"gameplay_menu/interface/skills/animations/nature/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_POISON @"gameplay_menu/interface/skills/animations/poison/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_SLASH_DOWN @"gameplay_menu/interface/skills/animations/slash/down/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ANIMATIONS_SLASH_UP @"gameplay_menu/interface/skills/animations/slash/up/"

#define GAMEPLAY_MENU_INTERFACE_SKILLS_BORDER_MAGIC @"gameplay_menu/interface/skills/border/magic"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_BORDER_NEUTRAL @"gameplay_menu/interface/skills/border/neutral"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_BORDER_PHYSICAL @"gameplay_menu/interface/skills/border/physical"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_BORDER_RANGED @"gameplay_menu/interface/skills/border/ranged"

#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BARD_BASIC @"gameplay_menu/interface/skills/icons/bard/s1"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BARD_FIRST @"gameplay_menu/interface/skills/icons/bard/s2"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BARD_SECOND @"gameplay_menu/interface/skills/icons/bard/s3"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BARD_THIRD @"gameplay_menu/interface/skills/icons/bard/s4"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BARD @"gameplay_menu/interface/skills/icons/bard/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BATTLEMAGE_BASIC @"gameplay_menu/interface/skills/icons/battlemage/s1"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BATTLEMAGE_FIRST @"gameplay_menu/interface/skills/icons/battlemage/s2"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BATTLEMAGE_SECOND @"gameplay_menu/interface/skills/icons/battlemage/s3"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BATTLEMAGE_THIRD @"gameplay_menu/interface/skills/icons/battlemage/s4"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BATTLEMAGE @"gameplay_menu/interface/skills/icons/battlemage/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BRAWLER_BASIC @"gameplay_menu/interface/skills/icons/brawler/s1"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BRAWLER_FIRST @"gameplay_menu/interface/skills/icons/brawler/s2"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BRAWLER_SECOND @"gameplay_menu/interface/skills/icons/brawler/s3"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BRAWLER_THIRD @"gameplay_menu/interface/skills/icons/brawler/s4"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_BRAWLER @"gameplay_menu/interface/skills/icons/brawler/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_CROSSBOWMAN_BASIC @"gameplay_menu/interface/skills/icons/crossbowman/s1"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_CROSSBOWMAN_FIRST @"gameplay_menu/interface/skills/icons/crossbowman/s2"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_CROSSBOWMAN_SECOND @"gameplay_menu/interface/skills/icons/crossbowman/s3"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_CROSSBOWMAN_THIRD @"gameplay_menu/interface/skills/icons/crossbowman/s4"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_CROSSBOWMAN @"gameplay_menu/interface/skills/icons/crossbowman/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_LONGBOWMAN_BASIC @"gameplay_menu/interface/skills/icons/longbowman/s1"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_LONGBOWMAN_FIRST @"gameplay_menu/interface/skills/icons/longbowman/s2"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_LONGBOWMAN_SECOND @"gameplay_menu/interface/skills/icons/longbowman/s3"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_LONGBOWMAN_THIRD @"gameplay_menu/interface/skills/icons/longbowman/s4"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_LONGBOWMAN @"gameplay_menu/interface/skills/icons/longbowman/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_MONK_BASIC @"gameplay_menu/interface/skills/icons/monk/s1"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_MONK_FIRST @"gameplay_menu/interface/skills/icons/monk/s2"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_MONK_SECOND @"gameplay_menu/interface/skills/icons/monk/s3"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_MONK_THIRD @"gameplay_menu/interface/skills/icons/monk/s4"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_MONK @"gameplay_menu/interface/skills/icons/monk/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_PALADIN_BASIC @"gameplay_menu/interface/skills/icons/paladin/s1"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_PALADIN_FIRST @"gameplay_menu/interface/skills/icons/paladin/s2"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_PALADIN_SECOND @"gameplay_menu/interface/skills/icons/paladin/s3"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_PALADIN_THIRD @"gameplay_menu/interface/skills/icons/paladin/s4"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_PALADIN @"gameplay_menu/interface/skills/icons/paladin/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_SCOUT_BASIC @"gameplay_menu/interface/skills/icons/scout/s1"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_SCOUT_FIRST @"gameplay_menu/interface/skills/icons/scout/s2"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_SCOUT_SECOND @"gameplay_menu/interface/skills/icons/scout/s3"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_SCOUT_THIRD @"gameplay_menu/interface/skills/icons/scout/s4"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_SCOUT @"gameplay_menu/interface/skills/icons/scout/"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_WIZARD_BASIC @"gameplay_menu/interface/skills/icons/wizard/s1"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_WIZARD_FIRST @"gameplay_menu/interface/skills/icons/wizard/s2"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_WIZARD_SECOND @"gameplay_menu/interface/skills/icons/wizard/s3"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_WIZARD_THIRD @"gameplay_menu/interface/skills/icons/wizard/s4"
#define GAMEPLAY_MENU_INTERFACE_SKILLS_ICONS_WIZARD @"gameplay_menu/interface/skills/icons/wizard/"

#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_BLEEDING @"gameplay_menu/interface/status_effects/animations/bleeding/"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_BUFF @"gameplay_menu/interface/status_effects/animations/buff/"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_BURNING @"gameplay_menu/interface/status_effects/animations/burning/"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_FROSTBITE @"gameplay_menu/interface/status_effects/animations/frostbite/"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_HELPING_HAND @"gameplay_menu/interface/status_effects/animations/helping_hand/"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_IMMUNE @"gameplay_menu/interface/status_effects/animations/immune/"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_INVISIBILITY @"gameplay_menu/interface/status_effects/animations/invisibility/"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_PARRY @"gameplay_menu/interface/status_effects/animations/parry/"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_POISON @"gameplay_menu/interface/status_effects/animations/poison/"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_PROTECT @"gameplay_menu/interface/status_effects/animations/protect/"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_REGEN @"gameplay_menu/interface/status_effects/animations/regen/"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_REMOVE_CONDITION @"gameplay_menu/interface/status_effects/animations/remove_condition/"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_STUN @"gameplay_menu/interface/status_effects/animations/stun/"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ANIMATIONS_TAUNT @"gameplay_menu/interface/status_effects/animations/taunt/"

#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_BLEEDING @"gameplay_menu/interface/status_effects/icons/bleeding"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_BUFF @"gameplay_menu/interface/status_effects/icons/buff"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_BURNING @"gameplay_menu/interface/status_effects/icons/burning"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_DEBUFF @"gameplay_menu/interface/status_effects/icons/debuff"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_FROSTBITE @"gameplay_menu/interface/status_effects/icons/frostbite"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_HELPING_HAND @"gameplay_menu/interface/status_effects/icons/helping_hand"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_IMMUNE @"gameplay_menu/interface/status_effects/icons/immune"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_INVISIBLE @"gameplay_menu/interface/status_effects/icons/invisible"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_PARRY @"gameplay_menu/interface/status_effects/icons/parry"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_POISON @"gameplay_menu/interface/status_effects/icons/poison"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_PROTECT @"gameplay_menu/interface/status_effects/icons/protect"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_REGEN @"gameplay_menu/interface/status_effects/icons/regen"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_STUN @"gameplay_menu/interface/status_effects/icons/stun"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_TAUNT @"gameplay_menu/interface/status_effects/icons/taunt"
#define GAMEPLAY_MENU_INTERFACE_STATUS_EFFECTS_ICONS_TAUNTED @"gameplay_menu/interface/status_effects/icons/taunted"

#define GAMEPLAY_MENU_INTERFACE_TARGET @"gameplay_menu/interface/target/"

#define GAMEPLAY_MENU_PROPS_DICES_ANIMATION @"gameplay_menu/props/dices/animation/"

#define GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_ACCURACY @"gameplay_menu/props/dices/icons/16x16/accuracy"
#define GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_AGILITY @"gameplay_menu/props/dices/icons/16x16/agility"
#define GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_CUNNING @"gameplay_menu/props/dices/icons/16x16/cunning"
#define GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_DEFENSE @"gameplay_menu/props/dices/icons/16x16/defense"
#define GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_STRENGTH @"gameplay_menu/props/dices/icons/16x16/strength"
#define GAMEPLAY_MENU_PROPS_DICES_ICONS_16x16_STURDINESS @"gameplay_menu/props/dices/icons/16x16/sturdiness"

#define GAMEPLAY_MENU_PROPS_DICES_ICONS_32x32_ACCURACY @"gameplay_menu/props/dices/icons/32x32/accuracy"
#define GAMEPLAY_MENU_PROPS_DICES_ICONS_32x32_AGILITY @"gameplay_menu/props/dices/icons/32x32/agility"
#define GAMEPLAY_MENU_PROPS_DICES_ICONS_32x32_CUNNING @"gameplay_menu/props/dices/icons/32x32/cunning"
#define GAMEPLAY_MENU_PROPS_DICES_ICONS_32x32_DEFENSE @"gameplay_menu/props/dices/icons/32x32/defense"
#define GAMEPLAY_MENU_PROPS_DICES_ICONS_32x32_STRENGTH @"gameplay_menu/props/dices/icons/32x32/strength"
#define GAMEPLAY_MENU_PROPS_DICES_ICONS_32x32_STURDINESS @"gameplay_menu/props/dices/icons/32x32/sturdiness"
#define GAMEPLAY_MENU_PROPS_DICES_ICONS_32x32_BORDER @"gameplay_menu/props/dices/icons/32x32/border"

#define GAMEPLAY_MENU_PROPS_PROJECTILES_ARROW_BLEED @"gameplay_menu/props/projectiles/arrow/bleed"
#define GAMEPLAY_MENU_PROPS_PROJECTILES_ARROW_FROST_ANIMATION @"gameplay_menu/props/projectiles/arrow/frost/"
#define GAMEPLAY_MENU_PROPS_PROJECTILES_AXE_BURN @"gameplay_menu/props/projectiles/axe/burn"
#define GAMEPLAY_MENU_PROPS_PROJECTILES_AXE_POISON @"gameplay_menu/props/projectiles/axe/poison"
#define GAMEPLAY_MENU_PROPS_PROJECTILES_BOMB @"gameplay_menu/props/projectiles/bomb"
#define GAMEPLAY_MENU_PROPS_PROJECTILES_DAGGER @"gameplay_menu/props/projectiles/dagger"
#define GAMEPLAY_MENU_PROPS_PROJECTILES_DART_STUN @"gameplay_menu/props/projectiles/dart/stun"
#define GAMEPLAY_MENU_PROPS_PROJECTILES_DART_BURN_ANIMATION @"gameplay_menu/props/projectiles/dart/burn/"
#define GAMEPLAY_MENU_PROPS_PROJECTILES_DART_POISON_ANIMATION @"gameplay_menu/props/projectiles/dart/poison/"
#define GAMEPLAY_MENU_PROPS_PROJECTILES_FIREBALL_ANIMATION @"gameplay_menu/props/projectiles/fireball/"
#define GAMEPLAY_MENU_PROPS_PROJECTILES_SLING_FROST @"gameplay_menu/props/projectiles/sling/frost"
#define GAMEPLAY_MENU_PROPS_PROJECTILES_SLING_SLING @"gameplay_menu/props/projectiles/sling/sling"







// MARK: DATA KEYS

//MARK: POSITION
#define POSITION_INTERFACE_STAT_LABELS @"interface_stat_label_"
#define POSITION_INTERFACE_HP_LABEL @"interface_hp_label"
#define POSITION_INTERFACE_LVL_LABEL @"interface_lvl_label"
#define POSITION_INTERFACE_QUIRK_LABEL @"interface_character_label"
#define POSITION_INTERFACE_TAB_STATS_TEXT @"interface_tab_stats_text"
#define POSITION_INTERFACE_TAB_SKILLS_TEXT @"interface_tab_skills_text"
#define POSITION_INTERFACE_TYPE_LABEL @"interface_type_label"
#define POSITION_INTERFACE_WEAPON_LVL_LABEL @"interface_weapon_lvl_label"
#define POSITION_INTERFACE_ARMOR_LVL_LABEL @"interface_armor_lvl_label"
#define POSITION_INTERFACE_WEAPON_BONUS_LABELS @"interface_weapon_bonus_label_"
#define POSITION_INTERFACE_ARMOR_BONUS_LABELS @"interface_armor_bonus_label_"
#define POSITION_INTERFACE_WEAPON_BONUSES @"interface_weapon_bonus_"
#define POSITION_INTERFACE_ARMOR_BONUSES @"interface_armor_bonus_"
#define POSITION_INTERFACE_LVL @"interface_lvl"
#define POSITION_INTERFACE_HP @"interface_hp"
#define POSITION_INTERFACE_QUIRK @"interface_character"
#define POSITION_INTERFACE_STATS @"interface_stat_"
#define POSITION_INTERFACE_WEAPON_LVL @"interface_weapon_lvl"
#define POSITION_INTERFACE_ARMOR_LVL @"interface_armor_lvl"
#define POSITION_INTERFACE_SKILL_LVLS @"interface_skill_lvl_"
#define POSITION_INTERFACE_SKILL_COMBO_LABELS @"interface_skill_combo_label_"
#define POSITION_INTERFACE_SKILL_UPGRADE_LABELS @"interface_skill_upgrade_label_"
#define POSITION_INTERFACE_SKILL_UPGRADE_BUTTONS @"interface_skill_upgrade_button_"
#define POSITION_INTERFACE_SKILLS @"interface_skill_"
#define POSITION_INTERFACE_COMBOS @"interface_skill_combo_"
#define POSITION_INTERFACE_SCROLL_BACKGOUND @"interface_scroll_background"
#define POSITION_INTERFACE_SCROLL_BORDER @"interface_scroll_border"
#define POSITION_INTERFACE_SCROLL_LINE @"interface_scroll_line"
#define POSITION_INTERFACE_ARMOR @"interface_armor"
#define POSITION_INTERFACE_WEAPON @"interface_weapon"
#define POSITION_INTERFACE_TYPE @"interface_type"
#define POSITION_INTERFACE_CLOSE_BUTTON @"interface_close_button"
#define POSITION_INTERFACE_SWITCHING_BUTTONS @"interface_switching_button_"
#define POSITION_INTERFACE_TAB_STATS @"interface_tab_stats"
#define POSITION_INTERFACE_TAB_SKILLS @"interface_tab_skills"
#define POSITION_INTERFACE_XP @"interface_xp"
#define POSITION_INTERFACE_PANE @"interface_pane"
#define POSITION_INTERFACE_BACKGROUND @"interface_background"
#define POSITION_INTERFACE_BACK_IMAGE @"interface_back_image"
#define POSITION_INTERFACE_CASTLE_BUTTON_UPGRADE @"interface_castle_button_upgrade"
#define POSITION_INTERFACE_WEAPON_NAME @"interface_weapon_name"
#define POSITION_INTERFACE_ARMOR_NAME @"interface_armor_name"
#define POSITION_INTERFACE_WEAPON_BONUS_TEXT @"interface_weapon_bonus_text"
#define POSITION_INTERFACE_ARMOR_BONUS_TEXT @"interface_armor_bonus_text"
#define POSITION_INTERFACE_CASTLE_SCROLL @"interface_castle_scroll"
#define POSITION_INTERFACE_CASTLE_SCROLL_FLAGS @"interface_castle_scroll_flag_"
#define POSITION_INTERFACE_CASTLE_UPGRADE_LABEL @"interface_castle_upgrade_label"
#define POSITION_INTERFACE_CASTLE_DICES_LABEL @"interface_castle_dices_label"
#define POSITION_INTERFACE_CASTLE_DICES @"interface_castle_dices"
#define POSITION_INTERFACE_KNIGHT_ANIMATION @"interface_knight_animation"
#define POSITION_INTERFACE_GOLD_STACK @"interface_gold_stack"
#define POSITION_INTERFACE_GOLD_COUNT @"interface_gold_count"
#define POSITION_INTERFACE_UNIT_NAME @"interface_unit_name"
#define POSITION_INTERFACE_UNIT_CLASS_NAME @"interface_unit_class_name"
#define POSITION_INTERFACE_BLACKSMITH_WEAPON @"interface_blacksmith_weapon"
#define POSITION_INTERFACE_BLACKSMITH_ARMOR @"interface_blacksmith_armor"
#define POSITION_INTERFACE_BLACKSMITH_WEAPON_ICON @"interface_blacksmith_weapon_icon"
#define POSITION_INTERFACE_BLACKSMITH_ARMOR_ICON @"interface_blacksmith_armor_icon"
#define POSITION_INTERFACE_BLACKSMITH_WEAPON_LVL @"interface_blacksmith_weapon_lvl"
#define POSITION_INTERFACE_BLACKSMITH_ARMOR_LVL @"interface_blacksmith_armor_lvl"
#define POSITION_INTERFACE_BLACKSMITH_UPGRADE_LABEL @"interface_blacksmith_upgrade_label"
#define POSITION_INTERFACE_BLACKSMITH_UPGRADE_BUTTON @"interface_blacksmith_upgrade_button"
#define POSITION_INTERFACE_BLACKSMITH_WEAPON_NAME @"interface_blacksmith_weapon_name"
#define POSITION_INTERFACE_BLACKSMITH_ARMOR_NAME @"interface_blacksmith_armor_name"
#define POSITION_INTERFACE_BLACKSMITH_STATS @"interface_blacksmith_stat_"
#define POSITION_INTERFACE_TRAINING_YARD_RECRUIT @"interface_training_yard_recruit_button"
#define POSITION_INTERFACE_WARBAND_CAMP_SLOTS @"interface_warband_camp_slot_"
#define POSITION_INTERFACE_WARBAND_CAMP_KNIGHTS @"interface_warband_camp_knight_"
#define POSITION_BUILDING_CASTLE @"building_castle"
#define POSITION_BUILDING_BLACKSMITH @"building_blacksmith"
#define POSITION_BUILDING_GATEHOUSE @"building_gatehouse"
#define POSITION_BUILDING_TRAINING_YARD @"building_training_yard"
#define POSITION_BUILDING_BARRACKS @"building_barracks"
#define POSITION_BUILDING_WARBAND_CAMP @"building_warband_camp"
#define POSITION_HUD_PORTRAITS @"hud_portrait_"
#define POSITION_HUD_SKILLS @"hud_skill_"
#define POSITION_HUD_COMBOS @"hud_combo_"
#define POSITION_HUD_HP_ALLIES @"hud_hp_ally_"
#define POSITION_HUD_DICEPOOL @"hud_dicepool"
#define POSITION_HUD_STATUS_EFFECTS_ALLY @"hud_status_effects_ally_"
#define POSITION_MAIN_MENU_NEW_GAME @"main_menu_new_game"
#define POSITION_MAIN_MENU_CONTINUE @"main_menu_continue"
#define POSITION_WORLD_MENU_MARKER_FARMLANDS @"world_menu_marker_farmlands"
#define POSITION_WORLD_MENU_MARKER_PINEWOODS @"world_menu_marker_pinewoods"
#define POSITION_WORLD_MENU_MARKER_MOUNTAINS @"world_menu_marker_mountains"
#define POSITION_WORLD_MENU_MARKER_SEASHORE @"world_menu_marker_seashore"
#define POSITION_WORLD_MENU_PATH_FARMLANDS @"world_menu_path_farmlands"
#define POSITION_WORLD_MENU_PATH_PINEWOODS @"world_menu_path_pinewoods"
#define POSITION_WORLD_MENU_PATH_MOUNTAINS @"world_menu_path_mountains"
#define POSITION_WORLD_MENU_PATH_SEASHORE @"world_menu_path_seashore"
#define POSITION_TOWN_MENU_OPTION_PANELS @"town_menu_option_panel_"
#define POSITION_TOWN_MENU_SETTINGS_BUTTON @"town_menu_settings_button"
#define POSITION_TOWN_MENU_WEEK_COUNTER_LABEL @"town_menu_week_counter_label"
#define POSITION_TOWN_MENU_WEEK_COUNTER @"town_menu_week_counter"
#define POSITION_BACK_BUTTON @"back_button"

// MARK: METADATA
#define META_INTERFACE_BACKGROUND @"interface_background"
#define META_INTERFACE_SCROLL @"interface_scroll"
#define META_INTERFACE_TAB @"interface_tab"
#define META_INTERFACE_XP @"interface_xp"
#define META_HUD_COMBO_STEP @"hud_combo"
#define META_HUD_HP_ALLY @"hud_hp_ally"
#define META_HUD_DICEPOOL @"hud_dicepool"
#define META_HUD_STATUS_EFFECT_ALLY  @"hud_status_effects_ally"

// MARK: TEXT
#define TEXT_MAIN_MENU_NEW_GAME @"main_menu_new_game"
#define TEXT_MAIN_MENU_CONTINUE @"main_menu_continue"
#define TEXT_INTERFACE_SWITCHING_BUTTONS @"interface_switching_button_"
#define TEXT_INTERFACE_BUTTON_UPGRADE @"interface_button_upgrade"
#define TEXT_INTERFACE_STAT_LABELS @"interface_stat_"
#define TEXT_INTERFACE_UNIT_TYPE @"interface_unit_type"
#define TEXT_INTERFACE_HP @"interface_hp"
#define TEXT_INTERFACE_LVL @"interface_lvl"
#define TEXT_INTERFACE_WEAPON @"interface_weapon_name"
#define TEXT_INTERFACE_ARMOR @"interface_armor_name"
#define TEXT_INTERFACE_QUIRK @"interface_character"
#define TEXT_INTERFACE_TAB_STATS @"interface_tab_stats"
#define TEXT_INTERFACE_TAB_SKILLS @"interface_tab_skills"
#define TEXT_INTERFACE_SKILL_COMBO_LABEL @"interface_skill_combo"
#define TEXT_INTERFACE_SKILL_UPGRADE_LABEL @"interface_skill_upgrade"
#define TEXT_INTERFACE_SKILL_LVL_LABEL @"interface_skill_lvl"
#define TEXT_INTERFACE_BONUS @"interface_bonus_text"
#define TEXT_INTERFACE_CASTLE_DICES_LABEL @"interface_castle_dices_label"
#define TEXT_TOWN_MENU_WEEK_COUNTER_LABEL @"town_menu_week_counter_label"
#define TEXT_INTERFACE_MAX_LVL @"interface_max_lvl"
#define TEXT_UNIT_CLASSES @"unit_class_"

// MARK: VALUE
#define VALUE_DICE_NUM @"num_of_dices"
#define VALUE_UPGRADE_COST @"upgrade_cost"
#define VALUE_UPGRADE_COST_SKILL @"skill"
#define VALUE_UPGRADE_COST_DICES @"dices"
#define VALUE_UPGRADE_COST_EQUIPMENT @"equipment"
#define VALUE_MAX_LVL_SKILLS @"max_skill_lvl"
#define VALUE_MAX_LVL_UNIT @"max_unit_lvl"
#define VALUE_MAX_LVL_EQUIPMENT @"max_equipment_lvl"
#define VALUE_MAX_LVL_DICE @"max_dice_lvl"
#define VALUE_STARTING_GOLD @"starting_gold"
#define VALUE_XP_FOR_LVL @"xp_for_lvl"
#define VALUE_COMBO_FOR_UNIT_TYPE @"combo_for_unit_type"
