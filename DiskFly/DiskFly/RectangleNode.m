//
//  RectangleNode.m
//  DiskFly
//
//  Created by Derek T. Nguyen on 11/7/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "RectangleNode.h"

@implementation RectangleNode

- (instancetype) initWithRadius: (double) radius
{
    self = [super init];
    UIBezierPath *path;
    path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(100 / radius, 0)];
    [path addLineToPoint:CGPointMake(100/radius, 25/radius)];
    [path addLineToPoint:CGPointMake(0, 25 / radius)];
    [path closePath];
    
    self.path = path.CGPath;
    return self;
}

- (instancetype) initNarrow
{
    self = [super init];
    UIBezierPath *path;
    path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(125, 0)];
    [path addLineToPoint:CGPointMake(125, 50)];
    [path addLineToPoint:CGPointMake(0, 50)];
    [path closePath];
    
    self.path = path.CGPath;
    return self;
}

- (instancetype) initWithWidth:(int)width andHeight:(int)height
{
    self = [super init];
    UIBezierPath *path;
    path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(width, 0)];
    [path addLineToPoint:CGPointMake(width, height)];
    [path addLineToPoint:CGPointMake(0, height)];
    [path closePath];
    
    self.path = path.CGPath;
    return self;
}

@end
