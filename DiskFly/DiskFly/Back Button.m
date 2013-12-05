//
//  Back Button.m
//  DiskFly
//
//  Created by Derek T. Nguyen on 11/7/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "Back Button.h"
#import "RectangleNode.h"
#import "MainMenuScreen.h"
@interface Back_Button()
@property CGPoint lastTouchLocation;
@end

@implementation Back_Button
-(instancetype) init
{
    self = [super init];
    [self mainMenuButton];
    self.userInteractionEnabled = YES;
    
    return self;
}

-(instancetype) initBackButton
{
    self = [super init];
    [self backButton];
    self.userInteractionEnabled = YES;
    
    return self;
}

-(void) mainMenuButton
{
    SKShapeNode *Button;
    Button = [[RectangleNode alloc] initWithRadius:.5];
    Button.fillColor = [SKColor grayColor];
    Button.lineWidth = 0;
    [self addChild:Button];
    
    SKLabelNode *mainMenu;
    mainMenu = [SKLabelNode labelNodeWithFontNamed:@"helvetica"];
    mainMenu.text = @"Main Menu";
    mainMenu.fontSize = 35;
    mainMenu.fontColor = [SKColor whiteColor];
    mainMenu.position = CGPointMake(100, 12);
    [self addChild:mainMenu];
}

-(void) backButton
{
    SKShapeNode *Button;
    Button = [[RectangleNode alloc] initWithWidth:58 andHeight:30];
    Button.fillColor = [SKColor grayColor];
    Button.lineWidth = 0;
    [self addChild:Button];
    
    SKLabelNode *Back;
    Back = [SKLabelNode labelNodeWithFontNamed:@"helvetica"];
    Back.text = @"Back";
    Back.fontSize = 20;
    Back.fontColor = [SKColor whiteColor];
    Back.position = CGPointMake(29,7);
    [self addChild:Back];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self];
    
    SKAction *fadeout = [SKAction fadeOutWithDuration:.1];
    [self runAction:fadeout completion:^
     {
         MainMenuScreen *MenuScreen = [MainMenuScreen sceneWithSize:self.scene.size];
         MenuScreen.scaleMode = SKSceneScaleModeAspectFill;
         [self.scene.view presentScene:MenuScreen];
     }];
}
@end
