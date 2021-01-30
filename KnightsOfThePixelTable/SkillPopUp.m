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
        background = [GraphicsComponent getImageWithKey:TOWN_MENU_INTERFACE_POP_UP atPosition:[Vector2 vectorWithX:position.x y:position.y] width:288 height:200];
//        [background setScaleUniform:2.0f];
        background.layerDepth = depth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:background];
        
        // init skill name
        skillName = [GraphicsComponent getLabelWithText:@"" atPosition:[Vector2 vectorWithX:position.x + 10 y:position.y + 12]];
        skillName.layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
        skillName.horizontalAlign = HorizontalAlignLeft;
        skillName.verticalAlign = VerticalAlignMiddle;
        [skillName setScaleUniform:FONT_SCALE_BIG];
        [items addObject:skillName];
        
        
        // init skill info
        info = [[DynamicLabel alloc] initWithPosition:[Vector2 vectorWithX:position.x + 10 y:position.y + 37] lineWidth:268 lineSpacing:20 charWidth:10.5f charHeight:13.5f  spaceWidth:5];
        [items addObject:info];
        
        // init colors
        conditionColors[Bleeding] = [Color red];
        conditionColors[Burning] = [Color orangeRed];
        conditionColors[Poison] = [Color violet];
        conditionColors[Frostbite] = [Color cornflowerBlue];
        conditionColors[Stun] = [Color yellow];
        conditionColors[Invisible] = [Color paleVioletRed];
        
        for (int i = BuffSTR; i < DebuffSTR; i++) {
            conditionColors[i] = [Color skyBlue];
        }
        
        for (int i = DebuffSTR; i < Taunt; i++) {
            conditionColors[i] = [Color orangeRed];
        }
        
        conditionColors[Taunt] = [Color mediumVioletRed];
        conditionColors[Protect] = [Color lightBlue];
        conditionColors[Parry] = [Color lightGray];
        conditionColors[Immune] = [Color seaGreen];
        conditionColors[Regen] = [Color greenYellow];
        conditionColors[HelpingHand] = [Color lawnGreen];
        conditionColors[RemoveCondition] = [Color yellowGreen];
        
        
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
        
        NSString *conditionTexts[ConditionTypes] = {@"BLEED", @"BURN", @"POISON", @"FROST", @"STUN", @"INVISIBILITY", @"STR BUFF", @"ACC BUFF", @"CUN BUFF", @"DEF BUFF", @"AGI BUFF", @"STD BUFF", @"STR DEBUFF", @"ACC DEBUFF", @"CUN DEBUFF", @"DEF DEBUFF", @"AGI DEBUFF", @"STD DEBUFF", @"TAUNT", @"PROTECT", @"SHIELD", @"IMMUNITY", @"REGEN", @"HELPING HAND", @"REMOVES CONDITION"};
        for (int i = 0; i < ConditionTypes; i++) {
            conditions[i] = [GraphicsComponent getLabelWithText:conditionTexts[i] atPosition:[Vector2 vectorWithX:0 y:0]];
            conditions[i].layerDepth = depth + INTERFACE_LAYER_DEPTH_MIDDLE;
            conditions[i].horizontalAlign = HorizontalAlignLeft;
            conditions[i].verticalAlign = VerticalAlignMiddle;
            conditions[i].color = conditionColors[i];
            [conditions[i] setScaleUniform:FONT_SCALE_MEDIUM];
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
        
        skillName.text = skill.name;
        
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
        } else if (skill.function == Heal) {
            Label *heals = [GraphicsComponent getLabelWithText:@"Heals" atPosition:[Vector2 zero]];
            heals.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            heals.horizontalAlign = HorizontalAlignLeft;
            heals.verticalAlign = VerticalAlignMiddle;
            heals.color = [Color lightGreen];
            [heals setScaleUniform:FONT_SCALE_MEDIUM];
            [info addLabel:heals];
            [heals release];
            
            Label *amount = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:@"%d%%", (int) (100 * skill.damage)] atPosition:[Vector2 zero]];
            amount.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            amount.horizontalAlign = HorizontalAlignLeft;
            amount.verticalAlign = VerticalAlignMiddle;
            amount.color = [Color lightGreen];
            [amount setScaleUniform:FONT_SCALE_MEDIUM];
            [info addLabel:amount];
            [amount release];
            
            Label *hp = [GraphicsComponent getLabelWithText:@"HP" atPosition:[Vector2 zero]];
            hp.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            hp.horizontalAlign = HorizontalAlignLeft;
            hp.verticalAlign = VerticalAlignMiddle;
            hp.color = [Color lightGreen];
            [hp setScaleUniform:FONT_SCALE_MEDIUM];
            [info addLabel:hp];
            [hp release];
            
            Label *forLabel = [GraphicsComponent getLabelWithText:@"to" atPosition:[Vector2 zero]];
            forLabel.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
            forLabel.horizontalAlign = HorizontalAlignLeft;
            forLabel.verticalAlign = VerticalAlignMiddle;
            [forLabel setScaleUniform:FONT_SCALE_MEDIUM];
            [info addLabel:forLabel];
            [forLabel release];
            
            [info addLabel:targets[skill.target]];
        }
        
        Target targetType = Targets;
        for (int i = 0; i < Targets; i++) {
//            Label *gives = [GraphicsComponent getLabelWithText:@"Gives" atPosition:[Vector2 zero]];
//            gives.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
//            gives.horizontalAlign = HorizontalAlignLeft;
//            gives.verticalAlign = VerticalAlignMiddle;
//            [gives setScaleUniform:FONT_SCALE_MEDIUM];
//            [info addLabel:gives];
//            [gives release];
            targetType = Targets;
            for (ConditionData *condData in skill.conditions) {
                if (condData.target == i && condData.type != RemoveCondition) {
                    [info addLabel:conditions[condData.type]];
                    
                    Label *chanceNum = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:@"(%d%%", (int) (100 * condData.chance)] atPosition:[Vector2 zero]];
                    chanceNum.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                    chanceNum.horizontalAlign = HorizontalAlignLeft;
                    chanceNum.verticalAlign = VerticalAlignMiddle;
                    [chanceNum setScaleUniform:FONT_SCALE_MEDIUM];
                    [info addLabel:chanceNum];
                    [chanceNum release];

                    Label *chance = [GraphicsComponent getLabelWithText:@"chance)" atPosition:[Vector2 zero]];
                    chance.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                    chance.horizontalAlign = HorizontalAlignLeft;
                    chance.verticalAlign = VerticalAlignMiddle;
                    [chance setScaleUniform:FONT_SCALE_MEDIUM];
                    [info addLabel:chance];
                    [chance release];
                    
                    if (condData.duration > 0) {
                        Label *forL = [GraphicsComponent getLabelWithText:@"for" atPosition:[Vector2 zero]];
                        forL.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                        forL.horizontalAlign = HorizontalAlignLeft;
                        forL.verticalAlign = VerticalAlignMiddle;
                        [forL setScaleUniform:FONT_SCALE_MEDIUM];
                        [info addLabel:forL];
                        [forL release];
                        
                        Label *duration = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:@"%d", condData.duration] atPosition:[Vector2 zero]];
                        duration.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                        duration.horizontalAlign = HorizontalAlignLeft;
                        duration.verticalAlign = VerticalAlignMiddle;
                        [duration setScaleUniform:FONT_SCALE_MEDIUM];
                        [info addLabel:duration];
                        [duration release];
                        
                        Label *turns = [GraphicsComponent getLabelWithText:@"turns" atPosition:[Vector2 zero]];
                        turns.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                        turns.horizontalAlign = HorizontalAlignLeft;
                        turns.verticalAlign = VerticalAlignMiddle;
                        [turns setScaleUniform:FONT_SCALE_MEDIUM];
                        [info addLabel:turns];
                        [turns release];
                    }
                    
                    // if is buff or debuff, add stat text
//                    if (condData.type == BBuff || condData.type == DDebuff) {
//                        Label *buffLabel = [GraphicsComponent getLabelWithText:[NSString stringWithFormat:conditions[condData.type].text, stats[condData.statType].text] atPosition:[Vector2 zero]];
//                        buffLabel.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
//                        buffLabel.horizontalAlign = HorizontalAlignLeft;
//                        buffLabel.verticalAlign = VerticalAlignMiddle;
//                        buffLabel.color = conditionColors[condData.type];
//                        [buffLabel setScaleUniform:FONT_SCALE_MEDIUM];
//                        [info addLabel:buffLabel];
//                        [buffLabel release];
//                    } else {
//                        [info addLabel:conditions[condData.type]];
//                    }
                    
                    targetType = condData.target;
                }
            }
            
            Label *to;
            if (targetType != Targets) {
                if (skill.target == i) {
                    if (skill.function == Utility) {
                        to = [GraphicsComponent getLabelWithText:@"to" atPosition:[Vector2 zero]];
                        to.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                        to.horizontalAlign = HorizontalAlignLeft;
                        to.verticalAlign = VerticalAlignMiddle;
                        [to setScaleUniform:FONT_SCALE_MEDIUM];
                        [info addLabel:to];
                        [to release];
                        
                        [info addLabel:targets[i]];
                    } else {
                        to = [GraphicsComponent getLabelWithText:@"to" atPosition:[Vector2 zero]];
                        to.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                        to.horizontalAlign = HorizontalAlignLeft;
                        to.verticalAlign = VerticalAlignMiddle;
                        [to setScaleUniform:FONT_SCALE_MEDIUM];
                        [info addLabel:to];
                        [to release];
                        
                        Label *target = [GraphicsComponent getLabelWithText:@"targets." atPosition:[Vector2 zero]];
                        target.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                        target.horizontalAlign = HorizontalAlignLeft;
                        target.verticalAlign = VerticalAlignMiddle;
                        target.color = [Color orange];
                        [target setScaleUniform:FONT_SCALE_MEDIUM];
                        [info addLabel:target];
                        [target release];
                    }
                } else {
                    to = [GraphicsComponent getLabelWithText:@"to" atPosition:[Vector2 zero]];
                    to.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                    to.horizontalAlign = HorizontalAlignLeft;
                    to.verticalAlign = VerticalAlignMiddle;
                    [to setScaleUniform:FONT_SCALE_MEDIUM];
                    [info addLabel:to];
                    [to release];
                    
                    [info addLabel:targets[i]];
                }
            }
        }
        
        for (ConditionData *condData in skill.conditions) {
            if (condData.type == RemoveCondition){
                [info addLabel:conditions[condData.type]];
                
                Label *from = [GraphicsComponent getLabelWithText:@"from" atPosition:[Vector2 zero]];
                from.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                from.horizontalAlign = HorizontalAlignLeft;
                from.verticalAlign = VerticalAlignMiddle;
                [from setScaleUniform:FONT_SCALE_MEDIUM];
                [info addLabel:from];
                [from release];
                
                if (skill.target == condData.target) {
                    Label *target = [GraphicsComponent getLabelWithText:@"targets." atPosition:[Vector2 zero]];
                    target.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                    target.horizontalAlign = HorizontalAlignLeft;
                    target.verticalAlign = VerticalAlignMiddle;
                    target.color = [Color orange];
                    [target setScaleUniform:FONT_SCALE_MEDIUM];
                    [info addLabel:target];
                    [target release];
                } else {
                    Label *targ = [GraphicsComponent getLabelWithText:targets[condData.target].text atPosition:[Vector2 zero]];
                    targ.layerDepth = curDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
                    targ.horizontalAlign = HorizontalAlignLeft;
                    targ.verticalAlign = VerticalAlignMiddle;
                    targ.color = [Color orange];
                    [targ setScaleUniform:FONT_SCALE_MEDIUM];
                    [info addLabel:targ];
                    [targ release];
                }
            }
        }
    } else {
        skillName.text = @"";
    }
}



- (void) updateDepth:(float)depth {
    [self updateDepth:depth toItem:background];
    
    [self updateDepth:depth toItem:skillName];
    
    for (int i = 0; i < DamageTypes; i++) {
        [self updateDepth:depth toItem:dmgType[i]];
    }
    
    for (int i = 0; i < Targets; i++) {
        [self updateDepth:depth toItem:targets[i]];
    }
    
    for (int i = 0; i < ConditionTypes; i++) {
        [self updateDepth:depth toItem:conditions[i]];
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
