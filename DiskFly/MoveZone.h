//
//  MoveableArea.h
//  DiskFly
//
//  Created by Austin Graham on 11/5/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MoveZone : SKShapeNode

-(instancetype) initWithWidth:(int) width andHeight:(int) height andScene:(SKScene*)scence;
-(void) makePhysicsBody;

@end
