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
    
    SKLabelNode *Lable;
    Lable = [SKLabelNode labelNodeWithFontNamed:@"helvetica"];
    Lable.text = @"l l";
    Lable.fontSize = 50;
    Lable.fontColor = [SKColor whiteColor];
    Lable.position = CGPointMake(0, -18);
    [self addChild:Lable];
    
}


//Erik: put in the menunode.
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self];
    
    MenuNode *menu = [[MenuNode alloc] initWithColor:[SKColor whiteColor] size: self.scene.frame.size];
    [self.scene addChild:menu];
    self.scene.physicsWorld.speed = 0;
    
    
    
    [self removeFromParent];
}
@end
