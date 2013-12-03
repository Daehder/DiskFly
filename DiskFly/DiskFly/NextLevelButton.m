//
//  NextLevelButton.m
//  DiskFly
//
//  Created by Erik Miller on 12/2/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "NextLevelButton.h"
#import "RectangleNode.h"
#import "MyScene.h"

@implementation NextLevelButton

-(instancetype) init

{
    self = [super init];
    [self createNextLevelButton];
    self.userInteractionEnabled = YES;
    
    return self;
}

- (void) createNextLevelButton
{
    SKShapeNode *Button = [[RectangleNode alloc] initNarrow];
    Button.lineWidth = 0;
    Button.fillColor = [SKColor grayColor];
    [self addChild:Button];
    
    SKLabelNode *nextLevel;
    nextLevel = [SKLabelNode labelNodeWithFontNamed:@"helvetica"];
    nextLevel.text = @"Next";
    nextLevel.fontSize = 35;
    nextLevel.fontColor = [SKColor whiteColor];
    nextLevel.position = CGPointMake(65, 12);
    [self addChild:nextLevel];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self];
    
    SKAction *fadeout = [SKAction fadeOutWithDuration:.1];
    [self runAction:fadeout completion:^
     {
         MyScene *nextLevel = [MyScene sceneWithSize:self.scene.size];
         nextLevel.scaleMode = SKSceneScaleModeAspectFill;
         int nextLevelNumber = self.currentLevelNumber + 1;
         [nextLevel loadLevel: nextLevelNumber];
         
         [self.scene.view presentScene:nextLevel];
     }];
}

@end
