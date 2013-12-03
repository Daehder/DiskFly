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
        
        /*skLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
         
         skLabel.text = @"Score: 2341";
         skLabel.fontSize = 35;
         skLabel.fontColor = [SKColor blackColor];
         skLabel.position = CGPointMake(160, 240);
        
         [self addChild:skLabel];*/
        
        
        
        
        /*skLabel = [SKLabelNode labelNodeWithFontNamed:@"HelviticaNeue"];
        
        skLabel.text = @"Replay";
        skLabel.fontSize = 25;
        skLabel.fontColor = [SKColor blueColor];
        skLabel.position = CGPointMake(80, 150);
        
        [self addChild:skLabel];*/
        
        ReplayButton *button = [[ReplayButton alloc] init];
        button.position = CGPointMake(20, 150);
        //button.xScale = .5;
        //button.yScale = .5;
        [self addChild:button];
        
        /*SKLabelNode *ReplayButtonLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
        ReplayButtonLabel.text = @"Replay";
        ReplayButtonLabel.fontSize = 50;
        ReplayButtonLabel.position = CGPointMake(100, 35);
        [button addChild:ReplayButtonLabel];*/
                                            
        NextLevelButton * nextLevel = [[NextLevelButton alloc] init];
        /*nextLevel = [SKLabelNode labelNodeWithFontNamed:@"HelviticaNeue"];
        
        nextLevel.text = @"Next Level";
        nextLevel.fontSize = 25;
        nextLevel.fontColor = [SKColor blueColor];*/
        nextLevel.position = CGPointMake(180, 150);
        nextLevel.currentLevelNumber = self.currentLevelNumber;
        
        [self addChild:nextLevel];
        
        /*skLabel = [SKLabelNode labelNodeWithFontNamed:@"HelviticaNeue"];
        
        skLabel.text = @"Menu";
        skLabel.fontSize = 25;
        skLabel.fontColor = [SKColor blueColor];
        skLabel.position = CGPointMake(160, 85);
        
        [self addChild:skLabel];*/
        
        Back_Button *MainMenu = [[Back_Button alloc] init];
        MainMenu.position = CGPointMake(60,85);
        [self addChild:MainMenu];
        
        /*SKLabelNode *MainMenuLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
        MainMenuLabel.text = @"Main Menu";
        MainMenuLabel.fontColor = [SKColor whiteColor];
        MainMenuLabel.fontSize = 40;
        MainMenuLabel.xScale = .70;
        MainMenuLabel.yScale = 1.3;
        MainMenuLabel.position = CGPointMake(100, 30);
        [MainMenu addChild:MainMenuLabel];*/
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
