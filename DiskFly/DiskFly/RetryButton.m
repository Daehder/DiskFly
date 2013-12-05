//
//  Pause Button.m
//  DiskFly
//
//  Created by Derek T. Nguyen on 11/11/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "RetryButton.h"
#import "Circle.h"
#import "MenuNode.h"
#import "MyScene.h"
#import "Triangle.h"

@interface RetryButton()
@property CGPoint lastTouchLocation;
@end

@implementation RetryButton
-(instancetype) init
{
    self = [super init];
    [self RetryButton];
    self.userInteractionEnabled = YES;
    
    return self;
}

-(void) RetryButton
{
    SKShapeNode *Button;
    Button = [[Circle alloc]init];
    Button.lineWidth = 1;
    Button.strokeColor = [SKColor grayColor];
    Button.fillColor = [SKColor clearColor];
    [self addChild:Button];
    
    SKShapeNode *reloadButton;
    reloadButton = [[Circle alloc] initReloadCircle];
    reloadButton.lineWidth = 2;
    reloadButton.strokeColor = [SKColor grayColor];
    reloadButton.fillColor = [SKColor clearColor];
    reloadButton.position = CGPointMake(0, 0);
    [self addChild:reloadButton];
    
    SKShapeNode *triangle;
    triangle = [[Triangle alloc]init];
    triangle.position = CGPointMake(0, 25 - 7.5);
    triangle.strokeColor = [SKColor grayColor];
    triangle.fillColor = [SKColor grayColor];
    triangle.yScale = .15;
    triangle.xScale = .225;
    [self addChild:triangle];
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self];
    
    if([self.scene isKindOfClass:[MyScene class]])
    {
        MyScene *scene = (MyScene*) self.scene;
        [scene retry];
    }
}
@end
