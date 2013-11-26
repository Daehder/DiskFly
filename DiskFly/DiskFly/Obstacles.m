//
//  Obstacles.m
//  DiskFly
//
//  Created by Austin Graham on 11/19/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "Obstacles.h"

@implementation Obstacles

-(instancetype) initWithImageNamed:(NSString *)name
{
   
    
    self = [super initWithImageNamed:@"blacksquare"];
    
    self.size = CGSizeMake(50, 50);
    
    SKPhysicsBody *physicsBody;
    physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    physicsBody.usesPreciseCollisionDetection = YES;
    self.physicsBody = physicsBody;


    
    
    
    return self;
}
/*- (void) setPhysicsBody {
    
    SKPhysicsBody *physicsBody;
    physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
    
    self.physicsBody = physicsBody;
}
*/

@end
