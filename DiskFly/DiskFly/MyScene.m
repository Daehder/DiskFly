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
#import "MoveZone.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor whiteColor];
        
        MoveZone *zone = [[MoveZone alloc] initWithWidth:self.frame.size.width andHeight:75 andScene:self];
        zone.fillColor = [SKColor grayColor];
        [self addChild:zone];
        
        
        Disc *cue = [[Disc alloc] init];
        cue.position = CGPointMake(self.frame.size.width / 2, 37.5);
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

@end
