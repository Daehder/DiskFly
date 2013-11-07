//
//  Disc.m
//  DiskFly
//
//  Created by Kyle Brunnett on 10/31/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "Disc.h"

@implementation Disc

-(instancetype) init
{
    self = [super init];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake(0, 0) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    /*self.fillColor = [SKColor yellowColor];
    self.strokeColor = [SKColor blackColor];
    self.glowWidth = 1;
    self.path = path.CGPath;*/
    
    
    
    return self;
    
    
}


- (void) setPhysicsBody {
    
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:25];
    physicsBody.affectedByGravity = NO;
    physicsBody.velocity = CGVectorMake(25, 450);
    physicsBody.linearDamping = 1.1;


    self.physicsBody = physicsBody;
}

@end
