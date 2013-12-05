//
//  Level Select Scene.m
//  DiskFly
//
//  Created by Derek T. Nguyen on 11/7/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "Level Select Scene.h"
#import "Back Button.h"
#import "Level1Node.h"
@interface Level_Select_Scene()

@property BOOL contentCreated;

@end

@implementation Level_Select_Scene

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
    
    SKLabelNode *Label;
    Label = [SKLabelNode labelNodeWithFontNamed:@"helvetica"];
    Label.text = @"LEVEL SELECT";
    Label.fontSize = 22;
    Label.fontColor = [SKColor whiteColor];
    Label.position = CGPointMake(self.frame.size.width *.525, self.frame.size.height *.90);
    [self addChild:Label];
    
    SKShapeNode *BackButton;
    BackButton = [[Back_Button alloc]initBackButton];
    BackButton.position = CGPointMake(self.frame.size.width *.05, self.frame.size.height *.89);
    [self addChild:BackButton];
    
    SKShapeNode *Level1;
    Level1 = [[Level1Node alloc] initWithLevel:1];
    Level1.position = CGPointMake(self.frame.size.width *.20, self.frame.size.height *.77);
    [self addChild:Level1];
    
    SKShapeNode *Level2;
    Level2 = [[Level1Node alloc] initWithLevel:2];
    Level2.position = CGPointMake(self.frame.size.width *.50, self.frame.size.height *.77);
    [self addChild:Level2];
    
    SKShapeNode *Level3;
    Level3 = [[Level1Node alloc] initWithLevel:3];
    Level3.position = CGPointMake(self.frame.size.width *.80, self.frame.size.height *.77);
    [self addChild:Level3];
    
    SKShapeNode *Level4;
    Level4 = [[Level1Node alloc] initWithLevel:4];
    Level4.position = CGPointMake(self.frame.size.width *.20, self.frame.size.height *.60);
    [self addChild:Level4];
    
    SKShapeNode *Level5;
    Level5 = [[Level1Node alloc] initWithLevel:5];
    Level5.position = CGPointMake(self.frame.size.width *.50, self.frame.size.height *.60);
    [self addChild:Level5];
    
    SKShapeNode *Level6;
    Level6 = [[Level1Node alloc] initWithLevel:6];
    Level6.position = CGPointMake(self.frame.size.width *.80, self.frame.size.height *.60);
    [self addChild:Level6];
    
    SKShapeNode *Level7;
    Level7 = [[Level1Node alloc] initWithLevel:7];
    Level7.position = CGPointMake(self.frame.size.width *.20, self.frame.size.height *.435);
    [self addChild:Level7];
    
    SKShapeNode *Level8;
    Level8 = [[Level1Node alloc] initWithLevel:8];
    Level8.position = CGPointMake(self.frame.size.width *.50, self.frame.size.height *.435);
    [self addChild:Level8];
    
    SKShapeNode *Level9;
    Level9 = [[Level1Node alloc] initWithLevel:9];
    Level9.position = CGPointMake(self.frame.size.width *.80, self.frame.size.height *.435);
    [self addChild:Level9];
    
}
@end
