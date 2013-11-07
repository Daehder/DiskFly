//
//  Level Select Button.m
//  DiskFly
//
//  Created by Derek T. Nguyen on 11/7/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "Level Select Button.h"
#import "RectangleNode.h"
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
    Button = [[RectangleNode alloc] initWithRadius:1];
    Button.xScale = 2;
    Button.fillColor = [SKColor grayColor];
    Button.lineWidth = 0;
    [self addChild:Button];
    
    SKLabelNode *Text;
    Text = [SKLabelNode labelNodeWithFontNamed:@"helvetica"];
    Text.text = @"Level Select";
    Text.fontSize = 30;
    Text.position = CGPointMake(100, 15);
    [self addChild:Text];
}
@end
