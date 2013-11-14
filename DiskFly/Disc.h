//
//  Disc.h
//  DiskFly
//
//  Created by Kyle Brunnett on 10/31/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Disc : SKSpriteNode

@property BOOL canReset;
-(instancetype) initWithImage:(NSString *)fileName andLocation:(CGPoint)location andUserInteraction:(BOOL)interactable;
-(void) setPhysicsBody;
-(void) createDisc;
-(void) resetDisc;



@end
