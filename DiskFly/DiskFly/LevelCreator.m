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
    /*NSArray *l1 = @[ @{@"type": @"rect", @"x":@25, @"y":@400},
                     @{@"type": @"rect", @"x":@295, @"y":@400},
                     @{@"type": @"circle", @"x":@150, @"y":@300}];*/
    
    NSArray *l2 = @[ @{@"type": @"circle", @"x":@150, @"y":@300}];
    
    NSArray *l1 = @[ @{@"type": @"rect", @"x":@25, @"y":@200},
                     @{@"type": @"rect", @"x":@75, @"y":@200},
                     @{@"type": @"rect", @"x":@125, @"y":@200},
                     @{@"type": @"rect", @"x":@175, @"y":@200},
                     @{@"type": @"rect", @"x":@145, @"y":@400},
                     @{@"type": @"rect", @"x":@195, @"y":@400},
                     @{@"type": @"rect", @"x":@245, @"y":@400},
                     @{@"type": @"rect", @"x":@295, @"y":@400},
                     @{@"type": @"circle", @"x":@150, @"y":@300}];
    
    NSArray *levels = @[l1, l2];
    
    NSLog(@"sequence = %lu",(unsigned long)level);
    
    if(level >= [levels count])
        return levels[[levels count] - 1];
    else if (level < 1)
        return levels[0];
    else
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
                Disc *star = [myScene makeStarReturnwithX:[object[@"x"] floatValue] andY:[object[@"y"] floatValue]];
                
                [obstacles addObject:star];
            }
        }
    }
    return obstacles;
}

@end