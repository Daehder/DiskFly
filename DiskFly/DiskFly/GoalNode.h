//
//  GoalNode.h
//  MockUp
//
//  Created by Kyle Brunnett on 10/17/13.
//  Copyright (c) 2013 Kyle Brunnett. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GoalNode : SKShapeNode

-(instancetype) initWithWidth:(int) width andHeight:(int) height andScene:(SKScene*)scene;
-(instancetype) initWithWidth:(int) width andHeight:(int) height andScene:(SKScene*) scene andColor: (SKColor*) color;

@end
