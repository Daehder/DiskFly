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
@property CGPoint startPosition;
@end

@implementation Disc


-(instancetype) initWithImage:(NSString *)fileName andLocation:(CGPoint)location andUserInteraction:(BOOL)interactable
{
    self = [super initWithImageNamed:fileName];
    self.position = location;
    self.userInteractionEnabled = interactable;
    self.size = CGSizeMake(50, 50);
    self.startPosition = location;
    [self setPhysicsBody];
    self.userHasInteracted = NO;
    
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
    UITouch *touch = [touches anyObject];
    self.firstTouchLocation = [touch locationInView:self.scene.view];
    self.lastTouchLocation = [touch locationInNode:self];
    self.startTime = [NSDate date];
    self.physicsBody.velocity = CGVectorMake(0, 0);
    self.userHasInteracted = YES;
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
    
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint endTouchLocation = [touch locationInView:self.scene.view];
    NSTimeInterval swipeTime = [self.startTime timeIntervalSinceNow];
    
    if (self.position.y > 75) {
        self.physicsBody.velocity = CGVectorMake((endTouchLocation.x - self.firstTouchLocation.x) / (- swipeTime), (endTouchLocation.y - self.firstTouchLocation.y) / swipeTime);
    }
    
}

- (void) setPhysicsBody {
    
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:25];
    physicsBody.velocity = CGVectorMake(0, 0);
    physicsBody.linearDamping = 1;
    physicsBody.affectedByGravity = NO;
    
    self.physicsBody = physicsBody;
}

-(void) resetDisc {
    self.position = self.startPosition;
    self.userHasInteracted = NO;
}

@end