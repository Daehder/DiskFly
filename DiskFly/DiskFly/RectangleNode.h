//
//  RectangleNode.h
//  DiskFly
//
//  Created by Derek T. Nguyen on 11/7/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface RectangleNode : SKShapeNode

- (instancetype) initWithRadius: (double) radius;
- (instancetype) initNarrow;
@end

