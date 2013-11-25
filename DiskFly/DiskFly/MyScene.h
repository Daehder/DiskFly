//
//  MyScene.h
//  DiskFly
//

//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "MenuNode.h"

@interface MyScene : SKScene

-(void) pause;
-(void) resume;
-(Boolean)targetRestingInGoal;
-(Boolean)diskCanReset;
-(int) starsEarned;


@property MenuNode *menu;

@end
