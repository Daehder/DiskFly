//
//  MenuNode.h
//  DiskFly
//
//  Created by Erik Miller on 10/31/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MenuNode : SKSpriteNode

- (instancetype) initWithColor:(UIColor *)color size:(CGSize)size;
- (void) resume;

@property CGFloat screenWidth;
@property CGFloat screenLength;

@end
