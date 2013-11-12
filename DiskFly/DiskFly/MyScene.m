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

@implementation MyScene

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        SKColor *skyBlueColor = [SKColor colorWithRed:(99.0/255.0) green:(184.0/255) blue:(254.0/255) alpha:1];
        
        self.backgroundColor = [SKColor colorWithRed:(99.0/255.0) green:(184.0/255) blue:(254.0/255) alpha:1];
        //self.backgroundColor = [SKColor whiteColor];
        
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
        
        /*SKPhysicsBody *physicsBody;
        physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:25];
        physicsBody.affectedByGravity = NO;
        physicsBody.velocity = CGVectorMake(0, 200);
        physicsBody.linearDamping = 1;*/
        
        Disc *cue = [[Disc alloc] initWithImageNamed:@"yellowdisk.png"];
        cue.size = CGSizeMake(50, 50);
        cue.position = CGPointMake(self.frame.size.width / 2, 37.5);
        //cue.fillColor = [SKColor yellowColor];
        [cue setPhysicsBody];
        [self addChild:cue];
        
        
        Disc *star = [[Disc alloc] initWithImageNamed:@"bluedisk.png"];
        star.size = CGSizeMake(50, 50);
        star.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 2 / 3);
        //star.fillColor = [SKColor blueColor];
        //physicsBody.velocity = CGVectorMake(0, 1);
        [star setPhysicsBody];
        star.physicsBody.velocity = CGVectorMake(0, 0);
        
        [self addChild:star];
        
        /*Pause_Button *PauseButton = [[Pause_Button alloc]init];
        PauseButton.xScale = .5;
        PauseButton.yScale = .5;
        PauseButton.position = CGPointMake(self.frame.size.width *.1, self.frame.size.height *.19);
        [self addChild:PauseButton];*/
        
       
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    
// Uncomment following code to enable menu
    // WARNING: currently breaks touches for the game, as it looks for touches anywhere, then puts up the menu
    
    [self pause];
    
    /*MenuNode *menu = [[MenuNode alloc] initWithColor:[SKColor whiteColor] size: self.frame.size];
    [self addChild:menu];
    self.scene.physicsWorld.speed = 0;*/
}

-(void)update:(CFTimeInterval)currentTime
{
    /*Called before each frame is rendered */
    
}

-(void)pause
{
    self.menu = [[MenuNode alloc] initWithColor:[SKColor whiteColor] size: self.frame.size];
    [self addChild:self.menu];
    self.scene.physicsWorld.speed = 0;
}

-(void) resume
{
    [self.menu resume];
}

@end
