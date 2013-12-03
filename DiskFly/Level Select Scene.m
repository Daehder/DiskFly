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
    Label.fontSize = 20;
    Label.fontColor = [SKColor blackColor];
    Label.position = CGPointMake(self.frame.size.width *.535, self.frame.size.height *.90);
    [self addChild:Label];
    
    SKShapeNode *BackButton;
    BackButton = [[Back_Button alloc]initBackButton];
    BackButton.position = CGPointMake(self.frame.size.width *.05, self.frame.size.height *.89);
    //ttBackButton.xScale = .3;
    //BackButton.yScale = .3;
    [self addChild:BackButton];
    
    /*SKLabelNode *Back;
    Back = [SKLabelNode labelNodeWithFontNamed:@"helvetica"];
    Back.text = @"BACK";
    Back.fontSize = 60;
    Back.fontColor = [SKColor blackColor];
    Back.position = CGPointMake(105,28);
    [BackButton addChild:Back];*/
    
    SKShapeNode *Level1;
    Level1 = [[Level1Node alloc] initWithLevel:1];
    //Level1.xScale = .8;
    //Level1.yScale = .8;
    Level1.position = CGPointMake(self.frame.size.width *.17, self.frame.size.height *.77);
    [self addChild:Level1];
}
@end
