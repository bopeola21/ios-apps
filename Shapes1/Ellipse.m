//
//  Ellipse.m
//  Shapes1
//
//  Created by Jide Opeola on 1/14/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "Ellipse.h"
IB_DESIGNABLE

@implementation Ellipse




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.fillColor set];
    
//   [[UIColor greenColor] set];
    
 //   CGContextFillEllipseInRect(context, rect);
    
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    CGFloat xCP = rect.size.width / 4;
    CGFloat yCP = rect.size.height / 4;
    
    CGContextMoveToPoint(context, rect.size.width / 2, 0);
    
    CGContextAddCurveToPoint(context, w - xCP, 0, w, yCP, w, h / 2);
    
    CGContextAddCurveToPoint(context, w, h-yCP, w-xCP, h, w/2, h);
    
    CGContextAddCurveToPoint(context, xCP, h, 0, h-yCP, 0, h/2);
    
    CGContextAddCurveToPoint(context, 0, yCP, xCP, 0, w/2, 0);
    
    CGContextFillPath(context);
    
    
}


@end
