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
@class GameRenderer;
@class ScreenComponent;
@class GUIRenderer;

// HUD
@class GameHud;

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

@class StatEffectFactory;
@class StatEffect;
@class Buff, Debuff, Condition;

@class ComboSlot;

@class Knight, KnightLancelot;

@class Monster, MonsterWarrior;

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
@class CamelotMenu;

// Game progress
@class GameProgress;

// Game
@class KOTPT;

// Audio
@class SoundEngine;

// Other
@class Constants;
