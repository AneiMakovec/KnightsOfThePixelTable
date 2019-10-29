//
//  EntityData.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 28/10/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntityData : NSObject {
//    NSString *keyID;
    
    DamageType dmgType;
    int hp;
    Lvl lvl;
    
    Skill *skills[SkillTypes];
    int stats[StatTypes];
}

//@property (nonatomic, readonly) NSString *keyID;

@property (nonatomic, readonly) DamageType dmgType;
@property (nonatomic, readonly) int hp;
@property (nonatomic, readonly) Lvl lvl;

- (id) initWithDamageType:(DamageType)dType hp:(int)health lvl:(Lvl)level;

- (int) getValueOfStat:(StatType)stat;

- (Skill *) getSkill:(SkillType)skill;

@end

NS_ASSUME_NONNULL_END
