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
#import "MenuNode.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        
        self.backgroundColor = [SKColor whiteColor];
        
        Disc *cue = [[Disc alloc] init];
        cue.position = CGPointMake(self.frame.size.width / 2, 50);
        cue.fillColor = [SKColor yellowColor];
        [self addChild:cue];
        
        Disc *star = [[Disc alloc] init];
        star.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 2 / 3);
        star.fillColor = [SKColor blueColor];
        [self addChild:star];
        
        GoalNode *outsideGoal = [[GoalNode alloc] initWithWidth:self.frame.size.width - 30
                                                      andHeight:100
                                                       andScene:self];
        [self addChild:outsideGoal];
        
        GoalNode *middleGoal = [[GoalNode alloc] initWithWidth:self.frame.size.width - 60
                                                     andHeight:80
                                                      andScene:self];
        middleGoal.strokeColor = [SKColor whiteColor];
        middleGoal.fillColor = [SKColor whiteColor];
        [self addChild:middleGoal];
        
        GoalNode *insideGoal = [[GoalNode alloc] initWithWidth:self.frame.size.width - 90
                                                     andHeight:60
                                                      andScene:self];
        [self addChild:insideGoal];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    
    /*for (UITouch *touch in touches)
    {
        
    }*/
    MenuNode *menu = [[MenuNode alloc] initWithColor:[SKColor whiteColor] size: self.frame.size];
    [self addChild:menu];
}

-(void)update:(CFTimeInterval)currentTime
{
    /* Called before each frame is rendered */
}

@end
