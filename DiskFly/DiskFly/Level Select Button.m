//
//  Level Select Button.m
//  DiskFly
//
//  Created by Derek T. Nguyen on 11/7/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "Level Select Button.h"
#import "RectangleNode.h"
#import "Level Select Scene.h"
@interface Level_Select_Button()
@property CGPoint lastTouchLocation;
@end

@implementation Level_Select_Button
- (instancetype) init
{
    self = [super init];
    
    [self LevelSelectButton];
    self.userInteractionEnabled = YES;
    
    return self;
}
- (void) LevelSelectButton
{
    SKShapeNode *Button;
    Button = [[RectangleNode alloc] initWithWidth:200 andHeight:50];
    Button.fillColor = [SKColor grayColor];
    Button.lineWidth = 0;
    [self addChild:Button];
    
    
    SKLabelNode *Text;
    Text = [SKLabelNode labelNodeWithFontNamed:@"helvetica"];
    Text.text = @"Level Select";
    Text.fontSize = 30;
    Text.fontColor = [SKColor blackColor];
    Text.position = CGPointMake(100, 15);
    [self addChild:Text];
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self];
    
    SKAction *fadeout = [SKAction fadeOutWithDuration:.1];
    [self runAction:fadeout completion:^
     {
         Level_Select_Scene *LevelScreen = [Level_Select_Scene sceneWithSize:self.scene.size];
         LevelScreen.scaleMode = SKSceneScaleModeAspectFill;
         [self.scene.view presentScene:LevelScreen];
     }];
}

@end
