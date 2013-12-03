//
//  Level1Node.h
//  DiskFly
//
//  Created by Derek T. Nguyen on 11/7/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Level1Node : SKShapeNode

@property int level;

-(instancetype) init;
-(instancetype) initWithLevel: (int) level;

@end
