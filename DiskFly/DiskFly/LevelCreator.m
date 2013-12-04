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
    NSArray *l1 = @[ @{@"type": @"circle", @"x":@160, @"y":@300}];
    
    NSArray *l2 = @[ @{@"type": @"rect", @"x":@0, @"y":@400},
                     @{@"type": @"rect", @"x":@300, @"y":@400},
                     @{@"type": @"circle", @"x":@150, @"y":@300}];
    
    NSArray *l3 = @[ @{@"type": @"rect", @"x":@0, @"y":@400},
                     @{@"type": @"rect", @"x":@300, @"y":@400},
                     @{@"type": @"circle", @"x":@160, @"y":@300}];
    
    NSArray *l4 = @[ @{@"type": @"rect", @"x":@0, @"y":@400},
                     @{@"type": @"rect", @"x":@300, @"y":@400},
                     @{@"type": @"circle", @"x":@160, @"y":@300}];
    
    NSArray *l5 = @[ @{@"type": @"rect", @"x":@0, @"y":@400},
                     @{@"type": @"rect", @"x":@300, @"y":@400},
                     @{@"type": @"circle", @"x":@160, @"y":@300}];
    
    NSArray *l6 = @[ @{@"type": @"rect", @"x":@0, @"y":@400},
                     @{@"type": @"rect", @"x":@300, @"y":@400},
                     @{@"type": @"circle", @"x":@160, @"y":@300}];
    
    NSArray *l7 = @[ @{@"type": @"rect", @"x":@0, @"y":@400},
                     @{@"type": @"rect", @"x":@300, @"y":@400},
                     @{@"type": @"circle", @"x":@160, @"y":@300}];
    
    NSArray *l8 = @[ @{@"type": @"rect", @"x":@0, @"y":@400},
                     @{@"type": @"rect", @"x":@300, @"y":@400},
                     @{@"type": @"circle", @"x":@160, @"y":@300}];
    
    NSArray *l9 = @[ @{@"type": @"rect", @"x":@100, @"y":@400},
                     @{@"type": @"rect", @"x":@150, @"y":@400},
                     @{@"type": @"rect", @"x":@50, @"y":@400},
                     @{@"type": @"rect", @"x":@200, @"y":@400},
                     @{@"type": @"rect", @"x":@225, @"y":@400},
                     @{@"type": @"circle", @"x":@160, @"y":@200}];
    
    NSArray *levels = @[l1, l2, l3, l4, l5, l6, l7, l8, l9 ];
    
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