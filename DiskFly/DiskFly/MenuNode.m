//
//  MenuNode.m
//  DiskFly
//
//  Created by Erik Miller on 10/31/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "MenuNode.h"
#import "Circle.h"

@interface MenuNode90
@property ScreenSize;
@end

@implementation MenuNode

 - (instancetype) initWithColor:(UIColor *)color size:(CGSize)size
{
    self = [super initWithColor:color size:size];
    self.position = CGPointMake(160, 284);
    self.alpha = .5;
    
    [self setupMenu];
    
    return self;
}

 - (void) setupMenu
{
    Circle *playButton = [[Circle alloc] init];
    playButton.position = CGPointMake(-70, 130);
    [self addChild:playButton];
    
    Circle *restartButton = [[Circle alloc] init];
    restartButton.position = CGPointMake(70, 130);
    [self addChild:restartButton];
}

@end