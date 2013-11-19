//
//  Level1Node.m
//  DiskFly
//
//  Created by Derek T. Nguyen on 11/7/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "Level1Node.h"
#import "Circle.h"
#import "MyScene.h"
@interface Level1Node ()
@property CGPoint lastTouchLocation;
@end

@implementation Level1Node
-(instancetype) init
{
    self = [super init];
    [self Level1Button];
    self.userInteractionEnabled = YES;
    
    return self;
}
-(void) Level1Button
{
    SKShapeNode *Button;
    Button = [[Circle alloc]init];
    Button.fillColor = [SKColor clearColor];
    Button.strokeColor = [SKColor grayColor];
    Button.lineWidth = .5;
    [self addChild:Button];
    
    SKLabelNode *Label;
    Label = [SKLabelNode labelNodeWithFontNamed:@"helvetica"];
    Label.text = @"1";
    Label.fontSize = 55;
    Label.position = CGPointMake(-3.5, -18.5);
    Label.fontColor = [SKColor blackColor];
    [self addChild:Label];
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self];
    
    SKAction *fadeout = [SKAction fadeOutWithDuration:.1];
    [self runAction:fadeout completion:^
     {
         MyScene *Play = [MyScene sceneWithSize:self.scene.size];
         Play.scaleMode = SKSceneScaleModeAspectFill;
         [self.scene.view presentScene:Play];
     }];
}

@end
