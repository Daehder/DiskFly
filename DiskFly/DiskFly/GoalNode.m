//
//  GoalNode.m
//  MockUp
//
//  Created by Kyle Brunnett on 10/17/13.
//  Copyright (c) 2013 Kyle Brunnett. All rights reserved.
//

#import "GoalNode.h"

@implementation GoalNode

-(instancetype) initWithWidth:(int) width andHeight:(int) height andScene:(SKScene*) scene
{
    self = [super init];
    UIBezierPath *goal;
    goal = [[UIBezierPath alloc] init];
    self.fillColor = [[SKColor alloc] initWithRed:0 green:1 blue:0 alpha:.5];
    self.strokeColor = [[SKColor alloc] initWithRed:0 green:1 blue:0 alpha:.5];

    [goal moveToPoint:CGPointMake((scene.frame.size.width - width) / 2, scene.frame.size.height - (57.5 + height / 2))];
    [goal addLineToPoint:CGPointMake((scene.frame.size.width + width) / 2, scene.frame.size.height - (57.5 + height / 2))];
    [goal addLineToPoint:CGPointMake((scene.frame.size.width + width) / 2, scene.frame.size.height - (57.5 - height / 2))];
    [goal addLineToPoint:CGPointMake((scene.frame.size.width - width) / 2, scene.frame.size.height - (57.5 - height / 2))];
    [goal addLineToPoint:CGPointMake((scene.frame.size.width - width) / 2, scene.frame.size.height - (57.5 + height / 2))];
    
    self.path = goal.CGPath;
    
    return self;
}

-(instancetype) initWithWidth:(int) width andHeight:(int) height andScene:(SKScene*) scene andColor: (SKColor*) color
{
    self = [self initWithWidth:width andHeight:height andScene:scene];
    
    self.strokeColor = color;
    self.fillColor = color;
    
    return self;
}



@end
