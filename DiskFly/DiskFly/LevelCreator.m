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
    
    NSArray *l1 = @[ @{@"type": @"circle", @"x":@160, @"y":@300},
                     @{@"type": @"tutorial", @"x":@0, @"y":@0}];
    
    NSArray *l2 = @[ @{@"type": @"rect", @"x":@160, @"y":@300},
                     @{@"type": @"circle", @"x":@160, @"y":@200}];
    
    NSArray *l3 = @[ @{@"type": @"rect", @"x":@50, @"y":@200},
                     @{@"type": @"rect", @"x":@100, @"y":@300},
                     @{@"type": @"rect", @"x":@150, @"y":@400},
                     @{@"type": @"rect", @"x":@125, @"y":@350},
                     @{@"type": @"rect", @"x":@75, @"y":@250},
                     @{@"type": @"rect", @"x":@275, @"y":@400},
                     @{@"type": @"circle", @"x":@160, @"y":@200}];
    
    NSArray *l4 = @[ @{@"type": @"rect", @"x":@160, @"y":@350},
                     @{@"type": @"rect", @"x":@200, @"y":@350},
                     @{@"type": @"rect", @"x":@120, @"y":@350},
                     @{@"type": @"circle", @"x":@160, @"y":@200}];
    
    NSArray *l5 = @[ @{@"type": @"rect", @"x":@25, @"y":@200},
                     @{@"type": @"rect", @"x":@75, @"y":@200},
                     @{@"type": @"rect", @"x":@125, @"y":@200},
                     @{@"type": @"rect", @"x":@175, @"y":@200},
                     @{@"type": @"circle", @"x":@160, @"y":@300}];
    
    NSArray *l6 = @[ @{@"type": @"rect", @"x":@210, @"y":@250},
                     @{@"type": @"rect", @"x":@160, @"y":@300},
                     @{@"type": @"rect", @"x":@260, @"y":@200},
                     @{@"type": @"rect", @"x":@310, @"y":@250},
                     @{@"type": @"rect", @"x":@25, @"y":@350},
                     @{@"type": @"circle", @"x":@150, @"y":@400}];
    
    NSArray *l7 = @[ @{@"type": @"rect", @"x":@125, @"y":@150},
                     @{@"type": @"rect", @"x":@175, @"y":@150},
                     @{@"type": @"rect", @"x":@160, @"y":@425},
                     @{@"type": @"circle", @"x":@160, @"y":@300}];
    
    NSArray *l8 = @[ @{@"type": @"rect", @"x":@25, @"y":@425},
                     @{@"type": @"rect", @"x":@160, @"y":@310},
                     @{@"type": @"rect", @"x":@160, @"y":@350},
                     @{@"type": @"rect", @"x":@160, @"y":@270},
                     @{@"type": @"rect", @"x":@300, @"y":@175},
                     @{@"type": @"rect", @"x":@25, @"y":@175},
                     @{@"type": @"rect", @"x":@300, @"y":@425},
                     @{@"type": @"circle", @"x":@160, @"y":@150}];
    
    NSArray *l9 = @[ @{@"type": @"rect", @"x":@100, @"y":@400},
                     @{@"type": @"rect", @"x":@150, @"y":@400},
                     @{@"type": @"rect", @"x":@50, @"y":@400},
                     @{@"type": @"rect", @"x":@200, @"y":@400},
                     @{@"type": @"rect", @"x":@225, @"y":@400},
                     @{@"type": @"circle", @"x":@160, @"y":@200}];
    
    NSArray *l10 = @[ @{@"type": @"rect", @"x":@295, @"y":@400},
                      @{@"type": @"rect", @"x":@245, @"y":@400},
                      @{@"type": @"rect", @"x":@195, @"y":@400},
                      @{@"type": @"rect", @"x":@185, @"y":@400},
                      @{@"type": @"rect", @"x":@25, @"y":@200},
                      @{@"type": @"rect", @"x":@75, @"y":@200},
                      @{@"type": @"rect", @"x":@125, @"y":@200},
                      @{@"type": @"rect", @"x":@175, @"y":@200},
                      @{@"type": @"circle", @"x":@160, @"y":@300}];

    
    NSArray *levels = @[l1, l2, l3, l4, l5, l6, l7, l8, l9, l10];
    
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
        
        if ([object[@"type"] isEqualToString:@"tutorial"])
        {
            [self createTutorialInScene: scene];
        }

        else if ([object[@"type"] isEqualToString:@"rect"])
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

- (void) createTutorialInScene: (SKScene*) scene
{
    SKLabelNode *instructions = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    instructions.text = @"move the yellow cue around";
    instructions.fontSize = 20;
    instructions.fontColor = [SKColor whiteColor];
    instructions.position = CGPointMake(scene.size.width / 2, 130);
    [scene addChild:instructions];
    
    instructions = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    instructions.text = @"inside the gray box";
    instructions.fontSize = 20;
    instructions.fontColor = [SKColor whiteColor];
    instructions.position = CGPointMake(scene.size.width / 2, 110);
    [scene addChild:instructions];
    
    instructions = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    instructions.text = @"drag the disc outside";
    instructions.fontSize = 20;
    instructions.fontColor = [SKColor whiteColor];
    instructions.position = CGPointMake(scene.size.width / 2, 200);
    [scene addChild:instructions];
    
    instructions = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    instructions.text = @"of the box to flick it";
    instructions.fontSize = 20;
    instructions.fontColor = [SKColor whiteColor];
    instructions.position = CGPointMake(scene.size.width / 2, 180);
    [scene addChild:instructions];
    
    instructions = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    instructions.text = @"try to hit the blue disk into the goal!";
    instructions.fontSize = 20;
    instructions.fontColor = [SKColor whiteColor];
    instructions.position = CGPointMake(scene.size.width / 2, 500);
    [scene addChild:instructions];
}



@end