//
//  MenuNode.m
//  DiskFly
//
//  Created by Erik Miller on 10/31/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "MenuNode.h"
#import "Circle.h"
@interface MenuNode()
@property CGPoint lastTouchLocation;
@end

@implementation MenuNode
// PAUSE MENU FOR IN-GAME
 - (instancetype) initWithColor:(UIColor *)color size:(CGSize)size
{
    self = [super initWithColor:color size:size];
    self.screenWidth = self.size.width;
    self.screenLength = self.size.height;
    self.position = CGPointMake(self.screenWidth/2, self.screenLength/2);
    self.alpha = .5;
    
    [self setupMenu];
    
    return self;
}

 - (void) setupMenu
{
    Circle *resumeButton = [[Circle alloc] init];
    resumeButton.position = CGPointMake(-70, 130);
    [self addChild:resumeButton];
    
    Circle *restartButton = [[Circle alloc] init];
    restartButton.position = CGPointMake(70, 130);
    [self addChild:restartButton];
    
    self.userInteractionEnabled =  YES;
}

// Called when the resume button is pressed
- (void) resume
{
    [self removeFromParent];
    
    // put in code to resume regular movement
    
}

 - (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self];
    [self resume];
    [self removeFromParent];
}

@end