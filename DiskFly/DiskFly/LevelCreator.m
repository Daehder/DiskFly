//
//  LevelCreator.m
//  DiskFly
//
//  Created by Erik Miller on 11/21/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "LevelCreator.h"
#import "MyScene.h"

@implementation LevelCreator

 - (NSDictionary*) getLevel:(int) level
{
    // Each dictonary represents a level
    // Create more dictionaries for additional levels, then combine into an arraylist
    NSDictionary *l1 = @{@"type": @"rect", @"x":@10.00, @"y":@0.0,
                         @"type": @"circle", @"x":@10.00, @"y":@50.00};
    
    // replace with method to return correct arraylist
    return  l1;
}

- (void) createLevel:(int) levelNum inScene: (SKScene*) scene
{
    if([scene isKindOfClass:[MyScene class]])
    {
        MyScene *scene = (MyScene*) scene;
        
        NSDictionary *level = [self getLevel:levelNum];
        [self putObjectsInScene: scene fromLevel: level];
    }
}

 - (void) putObjectsInScene: (SKScene*) scene fromLevel: (NSDictionary*) level
{
    for(NSDictionary *ob in level)
    {
        if ([ob[@"type"] isEqualToString:@"rect"])
        {
            // Create a rectangle at x, y
        }
        else if ([ob[@"type"] isEqualToString:@"circle"])
        {
            // Create a circle at x, y
        }
    }
}

@end