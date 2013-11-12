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
@property CGPoint touchLocation;
@property UIPanGestureRecognizer *flick;
@property UIView *flickView;
@property CGPoint flickVector;
@end

@implementation Disc


-(instancetype) initWithImage:(NSString *)fileName andLocation:(CGPoint)location andUserInteraction:(BOOL)interactable
{
    self = [super initWithImageNamed:fileName];
    self.position = location;
    self.userInteractionEnabled = interactable;
    self.size = CGSizeMake(50, 50);
    [self setPhysicsBody];
    
    return self;
}

-(void) setPhysicsBody {
    
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:25];
    physicsBody.velocity = CGVectorMake(0, 0);
    physicsBody.linearDamping = 1;
    physicsBody.affectedByGravity = NO;
    
    self.physicsBody = physicsBody;
}



-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInNode:self];
    
    self.flickView = [[UIView alloc] initWithFrame:self.frame];
    
    self.flick = [[UIPanGestureRecognizer alloc] init];
    self.flick.minimumNumberOfTouches = self.flick.maximumNumberOfTouches = 1;
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
    self.flickVector = [self.flick velocityInView:self.flickView];
    
    NSLog([NSString stringWithFormat:@"Velocity - X-Axis - %f ", self.flickVector.x]);
    NSLog([NSString stringWithFormat:@"Velocity - Y-Axis - %f ", self.flickVector.y]);
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.touchLocation = [touch locationInNode:self];
    
    /*if(self.touchLocation.y > 50)
     {
     //self.physicsBody.velocity = "velocity of swipe"
     self.physicsBody.velocity = CGVectorMake(self.flickVector.x, self.flickVector.y);
     }
     else
     {
     self.physicsBody.velocity = CGVectorMake(0, 0);
     }*/
    
    
    self.physicsBody.velocity = CGVectorMake(self.flickVector.x, self.flickVector.y);
    
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
