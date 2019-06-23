//
//  DungeonEndInterface.h
//  KnightsOfThePixelTable
//
//  Created by Anei Makovec on 29/01/2019.
//  Copyright © 2019 Anei Makovec. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pixlron.Knights.classes.h"
#import "PixEngine.GUI.h"

NS_ASSUME_NONNULL_BEGIN

@interface DungeonEndInterface : GuiPanel {
    GameHud *hud;
    
    CompositeImage *background;
    
    ImageButton *confirmButton;
}

- (id) initWithHud:(GameHud *)theHud contentManager:(ContentManager *)manager font:(SpriteFont *)font backgroundTextures:(NSMutableArray *)textures camera:(Matrix *)camera win:(BOOL)win;

@end

NS_ASSUME_NONNULL_END
