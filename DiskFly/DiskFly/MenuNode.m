//
//  MenuNode.m
//  DiskFly
//
//  Created by Erik Miller on 10/31/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "MenuNode.h"
#import "Circle.h"
#import "Resume Button.h"
#import "Back Button.h"
#import "RetryButton.h"
#import "Level Select Button.h"
@interface MenuNode()
@property CGPoint lastTouchLocation;
@property Resume_Button *resumeButton;
@end

@implementation MenuNode
// PAUSE MENU FOR IN-GAME
 - (instancetype) initWithColor:(UIColor *)color size:(CGSize)size
{
    self = [super init];
    [self setupBackgroundWithColor:color size:size];
    [self setupMenu];
    
    return self;
}

 - (void) setupMenu
{
    self.resumeButton = [[Resume_Button alloc] init];
    self.resumeButton.position = CGPointMake(-70 + self.screenWidth/2, 130 + self.screenLength/2);
    //self.resumeButton.strokeColor = [SKColor grayColor];
    [self addChild:self.resumeButton];
    
    RetryButton *retryButton = [[RetryButton alloc] init];
    retryButton.position = CGPointMake(70 + self.screenWidth/2, 130 + self.screenLength/2);
    //retryButton.strokeColor = [SKColor grayColor];
    [self addChild:retryButton];
    
    //MAIN MENU BUTTON
    Back_Button *MainMenu = [[Back_Button alloc] init];
    MainMenu.position = CGPointMake(60,300);
    [self addChild:MainMenu];
    
    Level_Select_Button *LevelSelect = [[Level_Select_Button alloc] init];
    LevelSelect.position = CGPointMake(60,225);
    [self addChild:LevelSelect];
    
    /*SKLabelNode *MainMenuLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    MainMenuLabel.text = @"Main Menu";
    MainMenuLabel.fontColor = [SKColor whiteColor];
    MainMenuLabel.fontSize = 40;
    MainMenuLabel.xScale = .80;
    MainMenuLabel.yScale = 1.3;
    MainMenuLabel.position = CGPointMake(100, 30);
    [MainMenu addChild:MainMenuLabel];*/
    
    self.userInteractionEnabled =  YES;
}

 - (void) setupBackgroundWithColor:(UIColor *)color size:(CGSize)size
{
    SKSpriteNode *background = [[SKSpriteNode alloc]initWithColor:color size:size];
    self.screenWidth = background.size.width;
    self.screenLength = background.size.height;
    background.position = CGPointMake(self.screenWidth/2, self.screenLength/2);
    background.alpha = .9;
    
    [self addChild:background];
}

// Called when the resume button is pressed
- (void) resume
{
    self.scene.physicsWorld.speed = 1;
    [self removeFromParent];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Do we Need the following commented code?
    
    //UITouch *touch = [touches anyObject];
    //self.lastTouchLocation = [touch locationInNode:self.resumeButton];
}

@end