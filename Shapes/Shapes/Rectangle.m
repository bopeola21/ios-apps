//
//  Rectangle.m
//  Shapes
//
//  Created by Jide Opeola on 1/13/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {
    

    CGContextRef context2 = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context2, 2.0);
    
    CGContextSetFillColorWithColor(context2, [UIColor blueColor].CGColor);
    
    CGContextFillPath(context2);
    
  //  CGContextSetStrokeColorWithColor(context2, [UIColor blueColor].CGColor);
    
    CGRect rectangle2 = CGRectMake(25,80,30,20);
    
    CGContextFillRect(context2, rectangle2);
    
   // CGContextStrokePath(context2);
    
    
    CGContextRef context3 = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context3, 2.0);
    
    CGContextSetFillColorWithColor(context3, [UIColor blueColor].CGColor);
    
    CGContextFillPath(context3);
    
   // CGContextSetStrokeColorWithColor(context3, [UIColor blueColor].CGColor);
    
    CGRect rectangle3 = CGRectMake(65,80,30,20);
    
    CGContextFillRect(context3, rectangle3);
    
   // CGContextStrokePath(context3);
    
    
    CGContextRef context4 = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context4, 2.0);
    
    CGContextSetFillColorWithColor(context4, [UIColor blueColor].CGColor);
    
    CGContextFillPath(context4);
    
   // CGContextSetStrokeColorWithColor(context4, [UIColor blueColor].CGColor);
    
    CGRect rectangle4 = CGRectMake(105,80,30,20);
    
    CGContextFillRect(context4, rectangle4);
    
   // CGContextStrokePath(context4);
    
    
    CGContextRef context5 = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context5, 2.0);
    
    CGContextSetFillColorWithColor(context5, [UIColor blueColor].CGColor);
    
    CGContextFillPath(context5);
    
   // CGContextSetStrokeColorWithColor(context5, [UIColor blueColor].CGColor);
    
    CGRect rectangle5 = CGRectMake(145,80,30,20);
    
    CGContextFillRect(context5, rectangle5);
    
   // CGContextStrokePath(context5);
    
    
    CGContextRef context6 = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context6, 2.0);
    
    CGContextSetFillColorWithColor(context6, [UIColor blueColor].CGColor);
    
    CGContextFillPath(context6);
    
   // CGContextSetStrokeColorWithColor(context6, [UIColor blueColor].CGColor);
    
    CGRect rectangle6 = CGRectMake(185,80,30,20);
    
    CGContextFillRect(context6, rectangle6);
    
   // CGContextStrokePath(context6);
    
    
    
    CGContextRef context1 = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context1, 2.0);
    
    CGContextSetFillColorWithColor(context1, [UIColor redColor].CGColor);
  
    CGContextFillPath(context1);
    
    CGContextSetStrokeColorWithColor(context1, [UIColor yellowColor].CGColor);
    
    CGRect rectangle1 = CGRectMake(20,92,200,55);
    
    CGContextAddRect(context1, rectangle1);
    
    CGContextStrokePath(context1);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGRect rectangle = CGRectMake(20,80,200,80);
    
    CGContextAddRect(context, rectangle);
    
    CGContextStrokePath(context);
    
   
}




@end
