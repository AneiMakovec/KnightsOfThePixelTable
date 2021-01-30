//
//  IPlayer.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 27/12/2018.
//  Copyright © 2018 Anei Makovec. All rights reserved.
//

@protocol IPlayer <NSObject>

@property (nonatomic, readonly) BOOL myTurn;

- (void) startTurn;

- (void) endTurn;

@end
