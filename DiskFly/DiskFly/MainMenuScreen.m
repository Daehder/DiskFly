//
//  MainMenuScreen.m
//  DiskFly
//
//  Created by Derek T. Nguyen on 11/7/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "MainMenuScreen.h"
#import "Level Select Button.h"
@interface MainMenuScreen ()
@property BOOL contentCreated;
@end

@implementation MainMenuScreen
-(void) didMoveToView:(SKView *)view
{
    if(!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
        
    }
}

-(void) createSceneContents
{
    self.backgroundColor = [SKColor colorWithRed:(99.0/255.0) green:(184.0/255) blue:(254.0/255) alpha:1];
    self.scaleMode = SKSceneScaleModeAspectFill;
    
    //Game name to be replace with logo
    SKLabelNode *DISKFLY;
    DISKFLY = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    DISKFLY.text = @"DISK FLY";
    DISKFLY.fontSize = 50;
    DISKFLY.fontColor = [SKColor grayColor];
    DISKFLY.position  = CGPointMake(self.frame.size.width * .5, self.frame.size.height * .8);
    [self addChild:DISKFLY];
    
    //Buttons
    Level_Select_Button *LevelSelect = [[Level_Select_Button alloc] init];
    LevelSelect.position = CGPointMake(self.frame.size.width *.18, self.frame.size.height *.30);
    [self addChild:LevelSelect];
}

@end
