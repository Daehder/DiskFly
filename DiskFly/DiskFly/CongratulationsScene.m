//
//  CongratulationsScene.m
//  DiskFly
//
//  Created by Tristan Honda on 11/5/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "CongratulationsScene.h"
#import "Back Button.h"
#import "MyScene.h"
#import "ReplayButton.h"
#import "NextLevelButton.h"

@implementation CongratulationsScene

- (instancetype) initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        
        self.backgroundColor = [SKColor colorWithRed:(99.0/255.0) green:(184.0/255) blue:(254.0/255) alpha:1];
        
        [self makeCongratulationsText];
        
        [self makeButtons];
    }
    return self;
}

- (void) displayStars: (int) starsEarned {
    
    SKSpriteNode *star;
    
    for (int starCounter = 0; starCounter < starsEarned; starCounter++) {
        star = [[SKSpriteNode alloc] initWithImageNamed:@"yellowstar"];
        star.size = CGSizeMake(50, 50);
        star.position = CGPointMake(self.scene.size.width / 2 - (2 - starCounter) * 50, 260);
        [self addChild:star];
    }
}

- (void) makeCongratulationsText
{
    SKLabelNode * skLabel = [SKLabelNode labelNodeWithFontNamed:@"HelviticaNeue"];
    
    skLabel.text = @"Way to Go!";
    skLabel.fontSize = 60;
    skLabel.fontColor = [SKColor blackColor];
    skLabel.position = CGPointMake(160,400);
    
    [self addChild:skLabel];
    
    skLabel = [SKLabelNode labelNodeWithFontNamed:@"HelviticaNeue"];
    
    skLabel.text = @"You completed the level!";
    skLabel.fontSize = 20;
    skLabel.fontColor = [SKColor blackColor];
    skLabel.position = CGPointMake(160, 330);
    
    [self addChild:skLabel];
}

- (void) makeButtons
{
    ReplayButton *button = [[ReplayButton alloc] init];
    button.position = CGPointMake(20, 150);
    [self addChild:button];
    
    NextLevelButton * nextLevel = [[NextLevelButton alloc] init];
    nextLevel.position = CGPointMake(230, 150);
    nextLevel.currentLevelNumber = self.currentLevelNumber;
    [self addChild:nextLevel];
    
    Back_Button *MainMenu = [[Back_Button alloc] init];
    MainMenu.position = CGPointMake(60,85);
    [self addChild:MainMenu];
}

/* - (void) createReplayButton
{
 
}
 
 - (void) replay
{
    ReplayButton *button = [[ReplayButton alloc] init];
    button.position = CGPointMake(80, 150);
    button.xScale = .5;
    button.yScale = .5;
    [self addChild:button];
    
}*/


@end
