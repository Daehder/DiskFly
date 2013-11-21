//
//  Pause Button.m
//  DiskFly
//
//  Created by Derek T. Nguyen on 11/11/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "Pause Button.h"
#import "Circle.h"
#import "MenuNode.h"
#import "MyScene.h"

@interface Pause_Button()
@property CGPoint lastTouchLocation;
@end

@implementation Pause_Button
-(instancetype) init
{
    self = [super init];
    [self PauseButton];
    self.userInteractionEnabled = YES;
    
    return self;
}

-(void) PauseButton
{
    SKShapeNode *Button;
    Button = [[Circle alloc]init];
    Button.lineWidth = 1;
    Button.strokeColor = [SKColor whiteColor];
    Button.fillColor = [SKColor clearColor];
    [self addChild:Button];
    
    SKLabelNode *Label;
    Label = [SKLabelNode labelNodeWithFontNamed:@"helvetica"];
    Label.text = @"l l";
    Label.fontSize = 60;
    Label.fontColor = [SKColor whiteColor];
    Label.position = CGPointMake(0, -23);
    [self addChild:Label];
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self];
    
    if([self.scene isKindOfClass:[MyScene class]])
    {
        MyScene *scene = (MyScene*) self.scene;
        [scene pause];
    }
}
@end
