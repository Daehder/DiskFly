//
//  Circle.m
//  DiskFly
//
//  Created by Erik Miller on 11/5/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "Circle.h"

@implementation Circle

- (instancetype) init
{
    return [self initWithRadius:40];
}

- (instancetype) initWithRadius: (double) radius
{
    self = [super init];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake(0, 0) radius:radius startAngle:0 endAngle: 2 * M_PI clockwise:YES];
    
    self.path = path.CGPath;
    
    return self;
}

- (instancetype) initReloadCircle
{
    self = [super init];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake(0, 0) radius: 25 startAngle:M_PI / 2 endAngle: 0 clockwise:YES];
    
    self.path = path.CGPath;
    
    return self;
}

@end
