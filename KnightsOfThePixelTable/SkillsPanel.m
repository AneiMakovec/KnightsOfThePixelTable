//
//  SkillsPanel.m
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 01/08/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import "SkillsPanel.h"

#import "Pixlron.Knights.h"

@implementation SkillsPanel

- (id) initWithArea:(Rectangle *)area layerDepth:(float)layerDepth font:(SpriteFont *)font {
    self = [super init];
    if (self != nil) {
        // init pane
        skillPane = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropPaneSkills] position:[Vector2 vectorWithX:area.x + 220 y:area.y + 199]];
        skillPane.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_GROUNDBACK;
        [items addObject:skillPane];
        
        // init skill slots
        firstSkill = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotGold] position:[Vector2 vectorWithX:area.x + 238 y:area.y + 208]];
        firstSkill.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:firstSkill];
        
        secondSkill = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotGold] position:[Vector2 vectorWithX:area.x + 238 y:area.y + 263]];
        secondSkill.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:secondSkill];
        
        thirdSkill = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotGold] position:[Vector2 vectorWithX:area.x + 238 y:area.y + 318]];
        thirdSkill.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:thirdSkill];
        
        // init combo slots
        firstSkillCombo1 = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 293 y:area.y + 223]];
        firstSkillCombo1.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:firstSkillCombo1];
        
        firstSkillCombo2 = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 326 y:area.y + 223]];
        firstSkillCombo2.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:firstSkillCombo2];
        
        
        secondSkillCombo1 = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 293 y:area.y + 278]];
        secondSkillCombo1.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:secondSkillCombo1];
        
        secondSkillCombo2 = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 326 y:area.y + 278]];
        secondSkillCombo2.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:secondSkillCombo2];
        
        secondSkillCombo3 = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 359 y:area.y + 278]];
        secondSkillCombo3.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:secondSkillCombo3];
        
        
        thirdSkillCombo1 = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 293 y:area.y + 333]];
        thirdSkillCombo1.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:thirdSkillCombo1];
        
        thirdSkillCombo2 = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 326 y:area.y + 333]];
        thirdSkillCombo2.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:thirdSkillCombo2];
        
        thirdSkillCombo3 = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 359 y:area.y + 333]];
        thirdSkillCombo3.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:thirdSkillCombo3];
        
        thirdSkillCombo4 = [[Image alloc] initWithTexture:[CamelotTextureComponent getInterfaceProp:InterfacePropSlotDice] position:[Vector2 vectorWithX:area.x + 392 y:area.y + 333]];
        thirdSkillCombo4.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        [items addObject:thirdSkillCombo4];
        
        // init upgrade buttons
        upgradeFirstSkill = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 439 y:area.y + 216 width:95 height:32] notPressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonPressed] font:font text:@"100 G"];
        upgradeFirstSkill.pressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeFirstSkill.notPressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeFirstSkill.label.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [upgradeFirstSkill.label setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        [items addObject:upgradeFirstSkill];
        
        upgradeSecondSkill = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 439 y:area.y + 272 width:95 height:32] notPressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonPressed] font:font text:@"100 G"];
        upgradeSecondSkill.pressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeSecondSkill.notPressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeSecondSkill.label.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [upgradeSecondSkill.label setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        [items addObject:upgradeSecondSkill];
        
        upgradeThirdSkill = [[DoubleImageLabelButton alloc] initWithInputArea:[Rectangle rectangleWithX:area.x + 439 y:area.y + 327 width:95 height:32] notPressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonNotPressed] pressedBackground:[CamelotTextureComponent getInterfaceProp:InterfacePropButtonPressed] font:font text:@"100 G"];
        upgradeThirdSkill.pressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeThirdSkill.notPressedImage.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_BACK;
        upgradeThirdSkill.label.layerDepth = layerDepth + INTERFACE_LAYER_DEPTH_MIDDLE;
        [upgradeThirdSkill.label setScaleUniform:INTERFACE_SCALE_FONT_MEDIUM];
        [items addObject:upgradeThirdSkill];
    }
    return self;
}


- (void) updateWithGameTime:(GameTime *)gameTime {
    // TODO: implement skill upgrade
}


- (void) dealloc {
    [skillPane release];
    
    [firstSkill release];
    [secondSkill release];
    [thirdSkill release];
    
    [firstSkillCombo1 release];
    [firstSkillCombo2 release];
    [secondSkillCombo1 release];
    [secondSkillCombo2 release];
    [secondSkillCombo3 release];
    [thirdSkillCombo1 release];
    [thirdSkillCombo2 release];
    [thirdSkillCombo3 release];
    [thirdSkillCombo4 release];
    
    [upgradeFirstSkill release];
    [upgradeSecondSkill release];
    [upgradeThirdSkill release];
    
    [super dealloc];
}

@end
