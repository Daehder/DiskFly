//
//  MoveableArea.m
//  DiskFly
//
//  Created by Austin Graham on 11/5/13.
//  Copyright (c) 2013 InitToWinIt. All rights reserved.
//

#import "MoveZone.h"

@implementation MoveZone

-(instancetype) initWithWidth:(int) width andHeight:(int) height andScene:(SKScene*) scene;
{
    self = [super init];
    
    UIBezierPath *border;
    border = [[UIBezierPath alloc] init];
    self.fillColor = [SKColor grayColor];
    self.strokeColor = [SKColor grayColor];
    
    [border moveToPoint:CGPointMake((self.frame.size.width), (self.frame.size.height))];
    [border addLineToPoint:CGPointMake((self.frame.size.width + width), (self.frame.size.height))];
    [border addLineToPoint:CGPointMake((self.frame.size.width + width),  (75))];
    [border addLineToPoint:CGPointMake((self.frame.size.width), (75))];
    [border addLineToPoint:CGPointMake((self.frame.size.width), (self.frame.size.height))];
    
     self.path = border.CGPath;
    
    return self;
}
                        
@end
