//
//  SkillPopUp.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 26/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "SkillPopUp.h"

#import "Pixlron.Knights.h"

#define MAX_CHARS 17

@implementation SkillPopUp

- (id) initForSkill:(SkillType)skill layerDepth:(float)depth {
    self = [super init];
    if (self != nil) {
        curDepth = depth;
        
        skillType = skill;
        
        // pop up position
        NSString *posKey = POSITION_INTERFACE_SKILL_POP_UPS;
        position = [[Constants getPositionDataForKey:[posKey stringByAppendingString:[NSString stringWithFormat:@"%d", skill]]] retain];
        
        // init background
        background = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_POP_UP atPosition:[Vector2 vectorWithX:position.x y:position.y] width:288 height:128];
//        [background setScaleUniform:2.0f];
        background.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:background];
        
        info = [[DynamicLabel alloc] initWithPosition:[Vector2 vectorWithX:position.x + 7 y:position.y + 12] lineWidth:28 * 10 lineSpacing:20 charWidth:10 charHeight:14];
        [items addObject:info];
        
        
        
        // init labels
        dmgType[DamageTypePhysical] = [GraphicsComponent getLabelWithText:@"PHISICAL" atPosition:[Vector2 vectorWithX:0 y:0]];
        dmgType[DamageTypePhysical].color = [Color red];
        dmgType[DamageTypePhysical].layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        dmgType[DamageTypePhysical].horizontalAlign = HorizontalAlignLeft;
        dmgType[DamageTypePhysical].verticalAlign = VerticalAlignMiddle;
        [dmgType[DamageTypePhysical] setScaleUniform:FONT_SCALE_MEDIUM];
        dmgType[DamageTypeRanged] = [GraphicsComponent getLabelWithText:@"RANGED" atPosition:[Vector2 vectorWithX:0 y:0]];
        dmgType[DamageTypeRanged].color = [Color green];
        dmgType[DamageTypeRanged].layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        dmgType[DamageTypeRanged].horizontalAlign = HorizontalAlignLeft;
        dmgType[DamageTypeRanged].verticalAlign = VerticalAlignMiddle;
        [dmgType[DamageTypeRanged] setScaleUniform:FONT_SCALE_MEDIUM];
        dmgType[DamageTypeMagic] = [GraphicsComponent getLabelWithText:@"MAGIC" atPosition:[Vector2 vectorWithX:0 y:0]];
        dmgType[DamageTypeMagic].color = [Color blue];
        dmgType[DamageTypeMagic].layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        dmgType[DamageTypeMagic].horizontalAlign = HorizontalAlignLeft;
        dmgType[DamageTypeMagic].verticalAlign = VerticalAlignMiddle;
        [dmgType[DamageTypeMagic] setScaleUniform:FONT_SCALE_MEDIUM];
        
        NSString *targetTexts[Targets] = {@"self.", @"single ally.", @"row of allies.", @"column of allies.", @"all allies.", @"single enemy.", @"row of enemies.", @"column of enemies.", @"all enemies."};
        for (int i = 0; i < Targets; i++) {
            targets[i] = [GraphicsComponent getLabelWithText:targetTexts[i] atPosition:[Vector2 vectorWithX:0 y:0]];
            targets[i].color = [Color orange];
            targets[i].layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
            targets[i].horizontalAlign = HorizontalAlignLeft;
            targets[i].verticalAlign = VerticalAlignMiddle;
            [targets[i] setScaleUniform:FONT_SCALE_MEDIUM];
        }
        
        NSString *conditionTexts[ConditionTypes] = {@"BLEEDS", @"BURNS", @"POISONS", @"FREEZES", @"STUNS", @"MAKES INVISIBLE", @"BUFFS %@", @"DEBUFFS %@", @"TAUNTS", @"PROTECTS", @"SHIELDS", @"MAKES IMMUNE", @"REGENERATES", @"HELPS", @"REMOVES CONDITION FROM"};
        for (int i = 0; i < ConditionTypes; i++) {
            conditions[i] = [GraphicsComponent getLabelWithText:conditionTexts[i] atPosition:[Vector2 vectorWithX:0 y:0]];
            conditions[i].layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
            conditions[i].horizontalAlign = HorizontalAlignLeft;
            conditions[i].verticalAlign = VerticalAlignMiddle;
            [conditions[i] setScaleUniform:FONT_SCALE_MEDIUM];
        }
        
        NSString *statTexts[StatTypes] = {@"STR", @"ACC", @"CUN", @"DEF", @"AGI", @"STD"};
        for (int i = 0; i < StatTypes; i++) {
            stats[i] = [GraphicsComponent getLabelWithText:statTexts[i] atPosition:[Vector2 vectorWithX:0 y:0]];
            stats[i].layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
            stats[i].horizontalAlign = HorizontalAlignLeft;
            stats[i].verticalAlign = VerticalAlignMiddle;
            [stats[i] setScaleUniform:FONT_SCALE_MEDIUM];
        }
        
        
        
//        text[6] = [GraphicsComponent getLabelWithText:@"Testing" atPosition:[Vector2 vectorWithX:0 y:0]];
//        text[6].horizontalAlign = HorizontalAlignLeft;
//        text[6].verticalAlign = VerticalAlignMiddle;
//        text[6].layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
//        [text[6] setScaleUniform:FONT_SCALE_MEDIUM];
//        [info addLabel:text[6]];
//        [text[6] release];
    }
    
    return self;
}



- (void) updateToKnight:(KnightData *)data {
    [info reset];
    
    if (data) {
        Skill *skill = [data getSkill:skillType];
        
        if (skill.function == Damage) {
            Label *deals = [GraphicsComponent getLabelWithText:@"Deals" atPosition:[Vector2 zero]];
            deals.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            deals.horizontalAlign = HorizontalAlignLeft;
            deals.verticalAlign = VerticalAlignMiddle;
            [deals setScaleUniform:FONT_SCALE_MEDIUM];
            [info addLabel:deals];
            [deals release];
            
            Label *dmg = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:@"%d%%", (int) (100 * skill.damage)] atPosition:[Vector2 zero]];
            dmg.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            dmg.horizontalAlign = HorizontalAlignLeft;
            dmg.verticalAlign = VerticalAlignMiddle;
            [dmg setScaleUniform:FONT_SCALE_MEDIUM];
            [info addLabel:dmg];
            [dmg release];
            
            [info addLabel:dmgType[skill.damageType]];
            
            Label *dmgLabel = [GraphicsComponent getLabelWithText:@"damage" atPosition:[Vector2 zero]];
            dmgLabel.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            dmgLabel.horizontalAlign = HorizontalAlignLeft;
            dmgLabel.verticalAlign = VerticalAlignMiddle;
            [dmgLabel setScaleUniform:FONT_SCALE_MEDIUM];
            [info addLabel:dmgLabel];
            [dmgLabel release];
            
            Label *dmgTo = [GraphicsComponent getLabelWithText:@"to" atPosition:[Vector2 zero]];
            dmgTo.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            dmgTo.horizontalAlign = HorizontalAlignLeft;
            dmgTo.verticalAlign = VerticalAlignMiddle;
            [dmgTo setScaleUniform:FONT_SCALE_MEDIUM];
            [info addLabel:dmgTo];
            [dmgTo release];
            
            [info addLabel:targets[skill.target]];
        }
        
        for (int i = 0; i < Targets; i++) {
            Target targetType = Targets;
            for (ConditionData *condData in skill.conditions) {
                if (condData.target == i) {
                    Label *chance = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:@"%d%%", (int) (100 * condData.chance)] atPosition:[Vector2 zero]];
                    chance.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                    chance.horizontalAlign = HorizontalAlignLeft;
                    chance.verticalAlign = VerticalAlignMiddle;
                    [chance setScaleUniform:FONT_SCALE_MEDIUM];
                    [info addLabel:chance];
                    [chance release];
                    
                    if (condData.type == BBuff || condData.type == DDebuff) {
                        Label *buffLabel = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:conditions[condData.type].text, stats[condData.statType].text] atPosition:[Vector2 zero]];
                        buffLabel.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                        buffLabel.horizontalAlign = HorizontalAlignLeft;
                        buffLabel.verticalAlign = VerticalAlignMiddle;
                        [buffLabel setScaleUniform:FONT_SCALE_MEDIUM];
                        [info addLabel:buffLabel];
                        [buffLabel release];
                    } else {
                        [info addLabel:conditions[condData.type]];
                    }
                    
                    targetType = condData.target;
                }
            }
            
            if (targetType != Targets) {
                if (skill.target == i) {
                    if (skill.function == Utility) {
                        [info addLabel:targets[i]];
                    } else {
                        Label *target = [GraphicsComponent getLabelWithText:@"targets." atPosition:[Vector2 zero]];
                        target.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                        target.horizontalAlign = HorizontalAlignLeft;
                        target.verticalAlign = VerticalAlignMiddle;
                        [target setScaleUniform:FONT_SCALE_MEDIUM];
                        [info addLabel:target];
                        [target release];
                    }
                } else {
                    [info addLabel:targets[i]];
                }
            }
        }
    }
}



- (void) updateDepth:(float)depth {
    [self updateDepth:depth toItem:background];
    
    for (int i = 0; i < DamageTypes; i++) {
        [self updateDepth:depth toItem:dmgType[i]];
    }
    
    for (int i = 0; i < Targets; i++) {
        [self updateDepth:depth toItem:targets[i]];
    }
    
    for (int i = 0; i < ConditionTypes; i++) {
        [self updateDepth:depth toItem:conditions[i]];
    }
    
    for (int i = 0; i < StatTypes; i++) {
        [self updateDepth:depth toItem:stats[i]];
    }
    
    
    for (Label *item in info.items) {
        if (depth > curDepth) {
            if (item.layerDepth < depth) {
                [self updateDepth:depth toItem:item];
            }
        } else {
            if (item.layerDepth > depth) {
                [self updateDepth:depth toItem:item];
            }
        }
    }
    
    curDepth = depth;
}

- (void) updateDepth:(float)depth toItem:(id)item {
    Image* imageItem = [item isKindOfClass:[Image class]] ? item : nil;
    if (imageItem) {
        imageItem.layerDepth -= curDepth;
        imageItem.layerDepth += depth;
    }
    
    Label *labelItem = [item isKindOfClass:[Label class]] ? item : nil;
    if (labelItem) {
        labelItem.layerDepth -= curDepth;
        labelItem.layerDepth += depth;
    }
}

@end
