//
//  CongratulationsScene.h
//  DiskFly
//
//  Created by Tristan Honda on 11/5/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "NextLevelButton.h"

@interface CongratulationsScene : SKScene

@property int currentLevelNumber;
@property NextLevelButton *nextLevel;

- (void) displayStars: (int) starsEarned;
- (void) setNextLevelButtonNumber:(int)currentLevelNumber;

@end
