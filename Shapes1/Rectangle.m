//
//  Rectangle.m
//  Shapes1
//
//  Created by Jide Opeola on 1/14/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "Rectangle.h"
IB_DESIGNABLE

@implementation Rectangle




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // anything after the set becomes that color, set again to change color
    
    [[UIColor purpleColor] set];
    
  //  CGContextFillRect(context, rect);
    
    // goes from last to new point
    
    CGContextMoveToPoint(context, 0, 0);
    
    CGContextAddLineToPoint(context, rect.size.width, 0);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    CGContextAddLineToPoint(context, 0, rect.size.height);
    CGContextAddLineToPoint(context, 0, 0);
    
    CGContextFillPath(context);
    
    
    
    
}

@end
