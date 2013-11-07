//
//  CongratulationsScene.m
//  DiskFly
//
//  Created by Tristan Honda on 11/5/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "CongratulationsScene.h"

@implementation CongratulationsScene

- (instancetype) initWithSize:(CGSize)size

{
    
    
    if (self = [super initWithSize:size]) {
        
        SKLabelNode * skLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvitica Neue"];
        
        skLabel.text = @"Congratulations!";
        skLabel.fontSize = 35;
        skLabel.fontColor = [SKColor whiteColor];
        skLabel.position = CGPointMake(160,400);
        
        [self addChild:skLabel];
        
        skLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvitica Neue"];
        
        skLabel.text = @"You completed the level";
        skLabel.fontSize = 20;
        skLabel.fontColor = [SKColor whiteColor];
        skLabel.position = CGPointMake(160, 330);
        
        [self addChild:skLabel];
        
        
        
    }
    return self;
    
  
    
    
}

@end
