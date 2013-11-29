//
//  LevelCreator.h
//  DiskFly
//
//  Created by Erik Miller on 11/21/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface LevelCreator : NSObject

- (NSMutableArray*) createLevel:(int) levelNum inScene: (SKScene*) scene;

@end
