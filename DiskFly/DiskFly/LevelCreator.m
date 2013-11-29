//
//  LevelCreator.m
//  DiskFly
//
//  Created by Erik Miller on 11/21/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "LevelCreator.h"
#import "MyScene.h"
#import "Obstacles.h"
#import "Disc.h"

@implementation LevelCreator

- (NSMutableArray*) createLevel:(int) levelNum inScene: (SKScene*) scene
{
    if([scene isKindOfClass:[MyScene class]])
    {
        NSMutableArray *level = [self getLevel:levelNum];
        return [self putObjectsInScene: scene fromLevel: level];
    }
    else
        return nil;
}

- (NSMutableArray*) getLevel:(int) level
{
    // Each Array represents a level
    // Create more Arrays for additional levels, then combine into an array
    NSArray *l1 = @[ @{@"type": @"rect", @"x":@0, @"y":@400},
                     @{@"type": @"rect", @"x":@300, @"y":@400},
                     @{@"type": @"circle", @"x":@150, @"y":@300}];
    
    NSArray *l2 = @[ @{@"type": @"circle", @"x":@150, @"y":@300}];
    
    NSArray *levels = @[l1, l2];
    // replace with method to return correct arraylist
    return  levels[level - 1];
}

 - (NSMutableArray*) putObjectsInScene: (SKScene*) scene fromLevel: (NSArray*) level
{
    NSMutableArray *obstacles = [[NSMutableArray alloc] init];
    
    for(NSDictionary *object in level)
    {
        if ([object[@"type"] isEqualToString:@"rect"])
        {
            Obstacles *RecObstacle = [[Obstacles alloc] init];
            RecObstacle.position = CGPointMake([object[@"x"] floatValue], [object[@"y"] floatValue]);
            [scene addChild:RecObstacle];
            
            [obstacles addObject:RecObstacle];
        }
        else if ([object[@"type"] isEqualToString:@"circle"])
        {
            if([scene isKindOfClass:[MyScene class]])
            {
                MyScene *myScene = (MyScene*) scene;
                Disc *star = [myScene makeStarReturn];
                
                [obstacles addObject:star];
            }
        }
    }
    return obstacles;
}

@end