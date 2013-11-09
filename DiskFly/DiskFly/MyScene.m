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

@implementation MyScene

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
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
        
        SKPhysicsBody *physicsBody;
        physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:25];
        physicsBody.affectedByGravity = NO;
        physicsBody.velocity = CGVectorMake(0, 200);
        physicsBody.linearDamping = 1;
        
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
    /* Called before each frame is rendered */
}

@end
