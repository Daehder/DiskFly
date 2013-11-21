//
//  Obstacles.m
//  DiskFly
//
//  Created by Austin Graham on 11/19/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "Obstacles.h"

@implementation Obstacles

-(instancetype) init
{
    self = [super init];
    UIBezierPath *ObstaclePath;
    
    ObstaclePath = [[UIBezierPath alloc] init];
    [ObstaclePath moveToPoint:CGPointMake(0, 0)];
     [ObstaclePath addLineToPoint:CGPointMake(100 , 0)];
     [ObstaclePath addLineToPoint:CGPointMake(100, 50 )];
     [ObstaclePath addLineToPoint:CGPointMake(0, 50 )];
     [ObstaclePath closePath];
    
    self.fillColor = [[SKColor alloc] initWithRed:0 green:1 blue:0 alpha:.5];
   self.strokeColor = [[SKColor alloc] initWithRed:0 green:1 blue:0 alpha:.5];
    [self setPhysicsBody];
    self.path = ObstaclePath.CGPath;
    return self;
}
- (void) setPhysicsBody
{
    
    SKPhysicsBody *recphysicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    recphysicsBody.velocity = CGVectorMake(0, 0);
    recphysicsBody.linearDamping = 1;
    recphysicsBody.affectedByGravity = NO;

}

@end
