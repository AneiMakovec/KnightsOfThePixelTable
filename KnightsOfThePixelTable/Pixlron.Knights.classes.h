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

@class ScreenComponentt;

@class GraphicsComponent;

// HUD
@class GameHud;
@class Indicator, AnimatedIndicator;
@class RetreatInterface, DungeonEndInterface;

// Camelot interfaces
@class Interface;
@class CastleInterface, BarracksInterface, WarbandCampInterface, TrainingYardInterface, BlacksmithInterface;
@class StatsPanel, SkillsPanel;
@class Rooster, RoosterEntry;
@class SkillPopUp, XpPopUp, CharacterTypePopUp, DamageTypePopUp;

// Physics
@class PhysicsEngine;

// Level
@class DicepoolLimit;

@class Battlefield, Dicepool;

@protocol IDice;
@class Dice;

@protocol ICombatEntity;
@class CombatEntity;
@class Knight, Monster;

@protocol IUpgradable;
@class Stat, Skill;
@class SkillFactory;

@class StatEffectFactory;
@class StatEffect;
@class Buff, Debuff, Condition;

@class ComboSlot;

@class Projectile;

@class Level;

// Player
@protocol IPlayer;
@class HumanPlayer, AIPlayer;

// Combat
@class TurnManager;

// Game states
@class GameState;
@class Gameplay;
@class Menu, MainMenu;
@class TownMenu, WorldMenu, InterfaceMenu;

// Game progress
@class GameProgress;
@class EntityData, KnightData, MonsterData, ConditionData;

// Game
@class KOTPT;

// Audio
@class SoundEngine;

// Other
@class Constants, MetaData;
