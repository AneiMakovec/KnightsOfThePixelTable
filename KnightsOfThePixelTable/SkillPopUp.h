//
//  SkillPopUp.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 26/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixEngine.GUI.h"

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface SkillPopUp : GuiPanel {
    float curDepth;
    
    SkillType skillType;
    
    Vector2 *position;
    
    Image *background;
    
    DynamicLabel *info;
    
    Label *dmgType[DamageTypes], *targets[Targets], *conditions[ConditionTypes], *stats[StatTypes];
}

- (id) initForSkill:(SkillType)skill layerDepth:(float)depth;

- (void) updateDepth:(float)depth;

- (void) updateToKnight:(KnightData *)data;

@end

NS_ASSUME_NONNULL_END
