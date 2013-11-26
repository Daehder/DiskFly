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

- (void) createLevel:(int) levelNum inScene: (SKScene*) scene
{
    if([scene isKindOfClass:[MyScene class]])
    {
        NSArray *level = [self getLevel:levelNum];
        [self putObjectsInScene: scene fromLevel: level];
    }
}

- (NSArray*) getLevel:(int) level
{
    // Each Array represents a level
    // Create more Arrays for additional levels, then combine into an array
    NSArray *l1 = @[ @{@"type": @"rect", @"x":@0, @"y":@400},
                     @{@"type": @"rect", @"x":@300, @"y":@400},
                     @{@"type": @"circle", @"x":@150, @"y":@300}];
    
    // replace with method to return correct arraylist
    return  l1;
}

 - (void) putObjectsInScene: (SKScene*) scene fromLevel: (NSArray*) level
{
    for(NSDictionary *object in level)
    {
        if ([object[@"type"] isEqualToString:@"rect"])
        {
            Obstacles *RecObstacle = [[Obstacles alloc] init];
            RecObstacle.position = CGPointMake([object[@"x"] floatValue], [object[@"y"] floatValue]);
            [scene addChild:RecObstacle];
        }
        else if ([object[@"type"] isEqualToString:@"circle"])
        {
            if([scene isKindOfClass:[MyScene class]])
            {
                MyScene *myScene = (MyScene*) scene;
                [myScene makeStar];
            }
        }
    }
}

@end