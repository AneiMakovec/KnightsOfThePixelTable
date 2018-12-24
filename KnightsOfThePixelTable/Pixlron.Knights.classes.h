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

// Physics
@class PhysicsEngine;

// Scene
@class DicepoolLimit;

@class Battlefield, Dicepool;

@protocol IDice;
@class Dice;

@protocol ICombatEntity;
@class CombatEntity;
@protocol IUpgradable;
@class StatValue, AttackValue;
@class ComboSlot;

@class Knight, KnightLancelot;

@class Monster, MonsterWarrior;

@class Level, FarmlandsLevel, PinewoodsLevel, MountainsLevel, SeashoreLevel, FinalLevel;

// Player
@class HumanPlayer, AIPlayer;

// Game
@class KOTPT, Gameplay;

// Audio
@class SoundEngine;

// Other
@class Constants;
