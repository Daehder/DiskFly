//
//  MyScene.m
//  DiskFly
//
//  Created by Erik Miller on 10/27/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "MyScene.h"
#import "Disc.h"
#import "GoalNode.h"
#import "CongratulationsScene.h"
#import "MenuNode.h"
#import "MoveZone.h"
#import "Pause Button.h"

@interface MyScene()
@property Disc *cue;
@property Disc *star;
@property int stillFrames;
@end

@implementation MyScene

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        self.stillFrames = 0;
        [self makeGoal];
        [self makeInterface];
        self.cue = [[Disc alloc] initWithImage:@"yellowdisk"
                                    andLocation:CGPointMake(self.frame.size.width / 2, 37.5)
                             andUserInteraction:YES];
        [self addChild:self.cue]; 
        //[self makeStar];
    }
    return self;
}

-(void)makeGoal
{
    SKColor *skyBlueColor = [SKColor colorWithRed:(99.0/255.0) green:(184.0/255) blue:(254.0/255) alpha:1];
    
    self.backgroundColor = [SKColor colorWithRed:(99.0/255.0) green:(184.0/255) blue:(254.0/255) alpha:1];
    //self.backgroundColor = [SKColor whiteColor];
    
    SKPhysicsBody *edge = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    edge.restitution = .5;
    self.physicsBody = edge;
    
    MoveZone *zone = [[MoveZone alloc] initWithWidth:self.frame.size.width andHeight:75 andScene:self];
    zone.fillColor = [SKColor grayColor];
    [self addChild:zone];
    
    GoalNode *outsideGoal = [[GoalNode alloc] initWithWidth:self.frame.size.width - 30
                                                  andHeight:100
                                                   andScene:self];
    [self addChild:outsideGoal];
    
    GoalNode *middleGoal = [[GoalNode alloc] initWithWidth:self.frame.size.width - 60
                                                 andHeight:80
                                                  andScene:self
                                                  andColor:skyBlueColor];
    [self addChild:middleGoal];
    
    GoalNode *insideGoal = [[GoalNode alloc] initWithWidth:self.frame.size.width - 90
                                                 andHeight:60
                                                  andScene:self];
    [self addChild:insideGoal];
}

-(void)makeStar
{
    self.star = [[Disc alloc] initWithImage:@"bluedisk"
                                andLocation:CGPointMake(self.frame.size.width / 2, self.frame.size.height * 2 / 3)
                         andUserInteraction:NO];
    [self addChild:self.star];
}

-(void)makeInterface
{
    self.menu = [[MenuNode alloc] initWithColor:[SKColor whiteColor] size: self.frame.size];
    
    Pause_Button *PauseButton = [[Pause_Button alloc]init];
    PauseButton.xScale = .5;
    PauseButton.yScale = .5;
    //PauseButton.position = CGPointMake(self.frame.size.width *.1, self.frame.size.height *.95);
    PauseButton.position = CGPointMake(self.frame.size.width *.1, self.frame.size.height *.19);
    [self addChild:PauseButton];
}

-(Boolean)targetRestingInGoal
{
    return self.star.physicsBody.velocity.dx < .5 &&
    self.star.physicsBody.velocity.dx > -.5 &&
    self.star.physicsBody.velocity.dy < .5 &&
    self.star.physicsBody.velocity.dy > -.5 &&
    self.star.position.y > 470 &&
    self.star.position.y < 545;
}

-(Boolean)diskCanReset
{
    return self.cue.physicsBody.velocity.dx < .1 &&
           self.cue.physicsBody.velocity.dy < .1 &&
           self.cue.position.y > 75 &&
           self.cue.canReset&&
           self.scene.physicsWorld.speed != 0;
}

-(void)update:(CFTimeInterval)currentTime
{
    /*if (self.cue.physicsBody.resting && self.cue.userHasInteracted && self.cue.position.y > 75) {
        self.cue.position = CGPointMake(self.frame.size.width / 2, 37.5);
    }*/
    
    
    
    if ([self diskCanReset])
    {
        if (self.stillFrames++ == 30) {
            //self.cue.position = CGPointMake(self.frame.size.width / 2, 37.5);
            //self.cue.physicsBody.velocity = CGVectorMake(0, 0);
            [self.cue deleteDisc];
            
            self.cue = [[Disc alloc] initWithImage:@"yellowdisk"
                                       andLocation:CGPointMake(self.frame.size.width / 2, 37.5)
                                andUserInteraction:YES];
            [self addChild:self.cue];
            
            self.stillFrames = 0;
        }
    }
    
    if([self targetRestingInGoal])
    {
        CongratulationsScene * scene = [CongratulationsScene sceneWithSize:self.scene.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        [self.view presentScene:scene];
    }
    
}

-(void)pause
{
    [self addChild:self.menu];
    self.scene.physicsWorld.speed = 0;
}

-(void) resume
{
    [self.menu resume];
}

@end
