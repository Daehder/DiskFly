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

@interface MyScene()
@property Disc *cue;
@property Disc *star;
@end

@implementation MyScene



-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        self.backgroundColor = [SKColor colorWithRed:(99.0/255.0) green:(184.0/255) blue:(254.0/255) alpha:1];
        //self.backgroundColor = [SKColor whiteColor];
        
        SKPhysicsBody *edge = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
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
                                                      andColor: [SKColor colorWithRed:(99.0/255.0) green:(184.0/255) blue:(254.0/255) alpha:1]];
        [self addChild:middleGoal];
        
        GoalNode *insideGoal = [[GoalNode alloc] initWithWidth:self.frame.size.width - 90
                                                     andHeight:60
                                                      andScene:self];
        [self addChild:insideGoal];
        
        
        self.cue = [[Disc alloc] initWithImage:@"yellowdisk"
                                    andLocation:CGPointMake(self.frame.size.width / 2, 37.5)
                             andUserInteraction:YES];
        [self addChild:self.cue];
        
        
        self.star = [[Disc alloc] initWithImage:@"bluedisk"
                                     andLocation:CGPointMake(self.frame.size.width / 2, self.frame.size.height * 2 / 3)
                              andUserInteraction:NO];
        [self addChild:self.star];
        

        
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
    
    /*MenuNode *menu = [[MenuNode alloc] initWithColor:[SKColor whiteColor] size: self.frame.size];
    [self addChild:menu];*/
}

-(void)update:(CFTimeInterval)currentTime
{
    if (self.cue.physicsBody.resting && self.cue.userHasInteracted) {
        [self.cue resetDisc];
    }
}

@end