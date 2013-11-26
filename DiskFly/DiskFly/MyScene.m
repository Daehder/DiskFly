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
#import "Obstacles.h"

@interface MyScene()
@property Disc *cue;
@property Disc *star;
@property int stillFrames;
@property MoveZone *zone;
@property int swipes;
@end

@implementation MyScene

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        self.stillFrames = 0;
        self.swipes = 0;
        
        [self makeGoal];
        [self makeObstacles];
        
        self.cue = [[Disc alloc] initWithImage:@"yellowdisk"
                                   andLocation:CGPointMake(self.frame.size.width / 2, 37.5)
                            andUserInteraction:YES];
        [self addChild:self.cue];

                [self makeStar];
        
        [self makeInterface];
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
    self.physicsBody.restitution = .4;
    
    self.zone = [[MoveZone alloc] initWithWidth:self.frame.size.width andHeight:75 andScene:self];
    self.zone.fillColor = [SKColor grayColor];
    [self addChild:self.zone];
    
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

- (void) makeObstacles
{
    Obstacles *RecObstacle;
    RecObstacle = [[Obstacles alloc] initWithImageNamed:@"blacksquare"];
    RecObstacle.position = CGPointMake(50, 150);
    
    [self addChild: RecObstacle];
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
    self.star.position.y > self.scene.frame.size.height - 140;
}

-(Boolean)diskCanReset
{
    return self.cue.physicsBody.velocity.dx < .1 &&
           self.cue.physicsBody.velocity.dy < .1 &&
           self.cue.physicsBody.velocity.dx > -.1 &&
           self.cue.physicsBody.velocity.dy > -.1 &&
           self.cue.canReset &&
           self.scene.physicsWorld.speed != 0;
}

-(void)update:(CFTimeInterval)currentTime
{
    if (self.cue.position.y > 100) {
        [self.zone makePhysicsBody];
        self.zone.physicsBody.categoryBitMask = 0xFFFFFFFF;
    }
    
    if ([self diskCanReset])
    {
        if (self.stillFrames++ > 30 &&
            self.star.physicsBody.velocity.dx < .5 &&
            self.star.physicsBody.velocity.dx > -.5 &&
            self.star.physicsBody.velocity.dy < .5 &&
            self.star.physicsBody.velocity.dy > -.5) {
            
            [self.cue deleteDisc];
            
            self.cue = [[Disc alloc] initWithImage:@"yellowdisk"
                                       andLocation:CGPointMake(self.frame.size.width / 2, 37.5)
                                andUserInteraction:YES];
            [self addChild:self.cue];
            
            self.zone.physicsBody.categoryBitMask = 0x0;
            
            self.stillFrames = 0;
            self.swipes ++;
        }
    }
    
    if([self targetRestingInGoal])
    {
        CongratulationsScene * scene = [CongratulationsScene sceneWithSize:self.scene.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        [scene displayStars: [self starsEarned]];
        
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

-(int) starsEarned{
    
    if ([self starInInsideGoal]) {
        return 5 - self.swipes;
    }
    
    else if ([self starInMiddleGoal]){
        return 4 - self.swipes;
        
    }
    
    else if ([self starInOutsideGoal]){
        return 3 - self.swipes;
    }
    
    else if ([self starTouchingGoal]){
        return 1 - self.swipes;
    }
    
    return 0;
}

-(BOOL) starInOutsideGoal{
    return  self.star.position.x > 40 &&
            self.star.position.x < self.scene.size.width - 40 &&
            self.star.position.y > self.scene.size.height - 90 &&
            self.star.position.y < self.scene.size.height - 40;
}

-(BOOL) starInMiddleGoal {
    return  self.star.position.x > 55 &&
            self.star.position.x < self.scene.size.width - 55 &&
            self.star.position.y > self.scene.size.height - 80 &&
            self.star.position.y < self.scene.size.height - 50;
}

-(BOOL) starInInsideGoal {
    return  self.star.position.x > 70 &&
            self.star.position.x < self.scene.size.width - 70 &&
            self.star.position.y > self.scene.size.height - 70 &&
            self.star.position.y < self.scene.size.height - 60;
}

-(BOOL) starTouchingGoal {
    return self.star.position.y > self.scene.size.height - 140;
}

@end