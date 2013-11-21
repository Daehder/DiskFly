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
@property CGPoint firstTouchLocation;
@property NSDate *startTime;
@end

@implementation Disc


-(instancetype) initWithImage:(NSString *)fileName andLocation:(CGPoint)location andUserInteraction:(BOOL)interactable
{
    self = [super initWithImageNamed:fileName];
    self.position = location;
    self.userInteractionEnabled = interactable;
    self.size = CGSizeMake(50, 50);
    [self setPhysicsBody];
    self.canReset = NO;
    self.physicsBody.restitution = .5;
    self.physicsBody.usesPreciseCollisionDetection = YES;
    
    return self;
}

-(void) createDisc
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake(0, 0) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    [self setPhysicsBody];
    
    self.userInteractionEnabled = YES;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setPhysicsBody];
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self];
    self.physicsBody.velocity = CGVectorMake(0, 0);
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self];
    
    //NSLog([NSString stringWithFormat:@"touchPoint: (%.2f, %.2f)", touchPoint.x, touchPoint.y]);
    
    CGPoint newPosition = self.position;
    newPosition.x = newPosition.x + (touchPoint.x - self.lastTouchLocation.x);
    newPosition.y = newPosition.y + (touchPoint.y - self.lastTouchLocation.y);
    
    self.position = newPosition;
    self.lastTouchLocation = [touch locationInNode:self];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}

- (void) setPhysicsBody {
    
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:25];
    physicsBody.velocity = CGVectorMake(0, 0);
    physicsBody.linearDamping = 1;
    physicsBody.affectedByGravity = NO;
    physicsBody.allowsRotation = NO;
    
    self.physicsBody = physicsBody;
}

-(void) resetDisc {
    self.position = self.startPosition;
}

-(void) deleteDisc
{
    [self removeFromParent];
}

@end
