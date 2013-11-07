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
    [path addLineToPoint:CGPointMake(100/radius, 50/radius)];
    [path addLineToPoint:CGPointMake(0, 50 / radius)];
    [path closePath];
    
    self.path = path.CGPath;
    return self;
}
@end
