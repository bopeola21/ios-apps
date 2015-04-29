//
//  Triangle.m
//  Shapes
//
//  Created by Jide Opeola on 1/13/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "Triangle.h"

@implementation Triangle

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 150, 150);
  //  CGContextAddLineToPoint(context, 100, 200);
    CGContextAddLineToPoint(context, 50, 150);
    CGContextAddLineToPoint(context, 100, 100);
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillPath(context);
}



@end
