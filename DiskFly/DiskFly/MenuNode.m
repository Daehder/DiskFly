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

@interface MenuNode()
@property CGPoint lastTouchLocation;
@property Resume_Button *resumeButton;
@end

@implementation MenuNode
// PAUSE MENU FOR IN-GAME
 - (instancetype) initWithColor:(UIColor *)color size:(CGSize)size
{
    self = [super init];
    SKSpriteNode *background = [[SKSpriteNode alloc]initWithColor:color size:size];
    self.screenWidth = background.size.width;
    self.screenLength = background.size.height;
    background.position = CGPointMake(self.screenWidth/2, self.screenLength/2);
    background.alpha = .9;
    
    [self addChild:background];
    [self setupMenu];
    
    return self;
}

 - (void) setupMenu
{
    //CHANGE FROM CIRCLE NODE TO RESUME_BUTTON NODE
    self.resumeButton = [[Resume_Button alloc] init];
    self.resumeButton.position = CGPointMake(-70 + self.screenWidth/2, 130 + self.screenLength/2);
    self.resumeButton.strokeColor = [SKColor grayColor];
    [self addChild:self.resumeButton];
    
    Circle *restartButton = [[Circle alloc] init];
    restartButton.position = CGPointMake(70 + self.screenWidth/2, 130 + self.screenLength/2);
    restartButton.strokeColor = [SKColor grayColor];
    [self addChild:restartButton];
    
    self.userInteractionEnabled =  YES;
}

// Called when the resume button is pressed
- (void) resume
{
    self.scene.physicsWorld.speed = 1;
    [self removeFromParent];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self.resumeButton];
}

@end