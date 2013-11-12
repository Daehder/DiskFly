//
//  Resume Button.m
//  DiskFly
//
//  Created by Derek T. Nguyen on 11/12/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "Resume Button.h"
#import "Triangle.h"
#import "Circle.h"
@interface Resume_Button()
@property CGPoint lastTouchLocation;
@end

@implementation Resume_Button
-(instancetype) init
{
    self = [super init];
    [self ResumeButton];
    self.userInteractionEnabled = YES;
    
    return self;
}

-(void) ResumeButton
{
    SKShapeNode *Button;
    Button = [[Circle alloc] init];
    Button.strokeColor = [SKColor grayColor];
    [self addChild:Button];
    
    SKShapeNode *Resume;
    Resume = [[Triangle alloc]init];
    Resume.position = CGPointMake(-15, -30);
    Resume.strokeColor = [SKColor grayColor];
    Resume.fillColor = [SKColor grayColor];
    Resume.yScale = .6;
    Resume.xScale = .9;
    [self addChild:Resume];
}

/*-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self];
    
    
}*/
@end
