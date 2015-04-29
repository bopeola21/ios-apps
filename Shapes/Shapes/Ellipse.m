//
//  Ellipse.m
//  Shapes
//
//  Created by Jide Opeola on 1/13/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "Ellipse.h"

@implementation Ellipse

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)drawRect:(CGRect)rect {
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetLineWidth(context, 2.0);
    
        CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    
        CGContextFillPath(context);
    
      CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
        CGRect rectangle = CGRectMake(5,5,140,20);
        
    //    CGContextAddEllipseInRect(context, rectangle);
    
        CGContextFillEllipseInRect(context, rectangle);

    
      //  CGContextStrokePath(context);
    
    
    
        CGContextRef context1 = UIGraphicsGetCurrentContext();
    
        CGContextSetLineWidth(context1, 2.0);
    
        CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    
        CGContextFillPath(context);
    
        //CGContextSetStrokeColorWithColor(context1, [UIColor yellowColor].CGColor);
    
        CGRect rectangle1 = CGRectMake(200,5,140,20);
    
        CGContextFillEllipseInRect(context1, rectangle1);
    
        //CGContextStrokePath(context1);
}


@end
