//
//  Triangle.m
//  DiskFly
//
//  Created by Derek T. Nguyen on 11/12/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "Triangle.h"

@implementation Triangle
- (instancetype) init
{
    self = [super init];
    UIBezierPath *path;
    path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(0, 100)];
    [path addLineToPoint:CGPointMake(50, 50)];
    [path closePath];
    self.path = path.CGPath;
    return self;
}
@end
