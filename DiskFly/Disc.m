//
//  Disc.m
//  DiskFly
//
//  Created by Kyle Brunnett on 10/31/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "Disc.h"

@interface Disc ()
@property CGPoint lastTouchLocation;
@end

@implementation Disc


-(instancetype) init
{
    self = [super init];
    
    [self createDisc];
    
    return self;
    
}

-(void) createDisc
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake(0, 0) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    /*self.fillColor = [SKColor yellowColor];
    self.strokeColor = [SKColor blackColor];
    self.glowWidth = 1;
    self.path = path.CGPath;*/
    
    
    
    self.userInteractionEnabled = YES;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self];
    
    CGPoint newPosition = self.position;
    newPosition.x = newPosition.x + (touchPoint.x - self.lastTouchLocation.x);
    newPosition.y = newPosition.y + (touchPoint.y - self.lastTouchLocation.y);
    
    self.position = newPosition;
    self.lastTouchLocation = [touch locationInNode:self];
}

@end
