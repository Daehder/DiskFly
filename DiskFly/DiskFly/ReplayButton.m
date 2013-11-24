//
//  ReplayButton.m
//  DiskFly
//
//  Created by Tristan Honda on 11/21/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "ReplayButton.h"
#import "RectangleNode.h"
#import "MyScene.h"

@interface ReplayButton()
@property CGPoint lastTouchLocation;
@end

@implementation ReplayButton
-(instancetype) init

{   self = [super init];
    [self ReplayButton];
    self.userInteractionEnabled = YES;
    
    return self; }

- (void) ReplayButton
{
    SKShapeNode *Button;
    Button = [[RectangleNode alloc] initWithRadius:.5];
    Button.lineWidth = 0;
    Button.fillColor = [SKColor grayColor];
    [self addChild:Button];
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self];
    
    SKAction *fadeout = [SKAction fadeOutWithDuration:.1];
    [self runAction:fadeout completion:^
     {
         MyScene *scene = [MyScene sceneWithSize:self.scene.size];
         scene.scaleMode = SKSceneScaleModeAspectFill;
         [self.scene.view presentScene:scene];
     }];
}




@end
