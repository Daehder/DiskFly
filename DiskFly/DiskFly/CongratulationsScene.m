//
//  CongratulationsScene.m
//  DiskFly
//
//  Created by Tristan Honda on 11/5/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "CongratulationsScene.h"
#import "Back Button.h"

@implementation CongratulationsScene

- (instancetype) initWithSize:(CGSize)size

{
    
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor whiteColor];
        
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
        
        skLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
         
         skLabel.text = @"Score: 2341";
         skLabel.fontSize = 35;
         skLabel.fontColor = [SKColor blackColor];
         skLabel.position = CGPointMake(160, 240);
        
         [self addChild:skLabel];
        
        skLabel = [SKLabelNode labelNodeWithFontNamed:@"HelviticaNeue"];
        
        skLabel.text = @"Replay";
        skLabel.fontSize = 25;
        skLabel.fontColor = [SKColor blueColor];
        skLabel.position = CGPointMake(80, 150);
        
        [self addChild:skLabel];
        
        skLabel = [SKLabelNode labelNodeWithFontNamed:@"HelviticaNeue"];
        
        skLabel.text = @"Next Level";
        skLabel.fontSize = 25;
        skLabel.fontColor = [SKColor blueColor];
        skLabel.position = CGPointMake(230, 150);
        
        [self addChild:skLabel];
        
        /*skLabel = [SKLabelNode labelNodeWithFontNamed:@"HelviticaNeue"];
        
        skLabel.text = @"Home";
        skLabel.fontSize = 25;
        skLabel.fontColor = [SKColor blueColor];
        skLabel.position = CGPointMake(160, 85);
        
        [self addChild:skLabel];*/
        
        SKShapeNode *MainMenu = [[Back_Button alloc]init];
        MainMenu.position = CGPointMake(100, 85);
        MainMenu.xScale = .5;
        MainMenu.yScale = .5;
        [self addChild:MainMenu];
        
        SKLabelNode *MainMenuLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
        MainMenuLabel.text = @"HOME";
        MainMenuLabel.fontSize = 50;
        MainMenuLabel.position = CGPointMake(100, 30);
        [MainMenu addChild:MainMenuLabel];
        
        
    }
    return self;
    
  
    
    
}

@end
