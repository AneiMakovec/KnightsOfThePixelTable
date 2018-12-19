//
//  IUpgradable.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 19/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

@protocol IUpgradable <NSObject>

@property (nonatomic, readonly) int maxUpgradeLevel;
@property (nonatomic, readonly) int currentUpgradeLevel;
@property (nonatomic, readonly) int upgradeMargin;

- (void) upgrade;

@end
