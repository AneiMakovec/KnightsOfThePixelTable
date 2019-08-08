//
//  Pixlron.Knights.classes.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 03/11/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

// Enums
#import "KOTPTEnums.h"

// Graphics
@class GameRenderer, GUIRenderer;

@class ScreenComponent, TextureComponent, CamelotTextureComponent;

// HUD
@class GameHud;
@class Indicator, AnimatedIndicator;
@class RetreatInterface, DungeonEndInterface;

// Camelot interfaces
@class Interface;
@class CastleInterface, BarracksInterface, WarbandCampInterface, TrainingYardInterface, BlacksmithInterface;
@class StatsPanel, SkillsPanel, EquipmentPanel;
@class Rooster, RoosterEntry;

// Physics
@class PhysicsEngine;

// Level
@class DicepoolLimit;

@class Battlefield, Dicepool;

@protocol IDice;
@class Dice;

@protocol ICombatEntity;
@class CombatEntity;

@protocol IUpgradable;
@class Stat, Skill;
@class SkillFactory;

@class StatEffectFactory;
@class StatEffect;
@class Buff, Debuff, Condition;

@class ComboSlot;

@class Projectile;

@class Knight, KnightBrawler, KnightBowman, KnightPaladin, KnightFireEnchantress;

@class Monster, MonsterWarrior, MonsterBrute, MonsterBossViking, MonsterBoosKnight;

@class Level, FarmlandsLevel, PinewoodsLevel, MountainsLevel, SeashoreLevel, FinalLevel;

// Player
@protocol IPlayer;
@class HumanPlayer, AIPlayer;

// Combat
@class TurnManager;

// Game states
@class GameState;
@class Gameplay;
@class Menu, MainMenu, OptionsMenu;
@class CamelotMenu, WorldMenu;

// Game progress
@class GameProgress;
@class KnightData;

// Game
@class KOTPT;

// Audio
@class SoundEngine;

// Other
@class Constants;
