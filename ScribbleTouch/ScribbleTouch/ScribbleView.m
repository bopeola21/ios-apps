//
//  ScribbleView.m
//  ScribbleTouch
//
//  Created by Jide Opeola on 1/14/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "ScribbleView.h"

@implementation ScribbleView

{
    
    NSDictionary * scribble;
    
}

//    @[
//
//      @{
//        @"type":@"path",
//        @"fillColor":[UIColor greenColor],
//        @"strokeColor":[UIColor blackColor],
//        @"strokeWidth":@2,
//        @"points":@[point,point,point]
//
//        },
//
//        @{
//        @"type":@"circle",
//        @"fillColor":[UIColor greenColor],
//        @"strokeColor":[UIColor blackColor],
//        @"strokeWidth":@2,
//        @"frame":cgrect
//        }
//
//
//    ];

-(NSMutableArray *)scribbles {
    
    if (_scribbles == nil) { _scribbles = [@[] mutableCopy]; }
    
    
    
    return _scribbles;
    
    
}







// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
  //  CGContextRef context = CGContextSetBlendMode();
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    
//    CGContextSetAlpha(<#CGContextRef c#>, <#CGFloat alpha#>);
//    CGContextSetBlendMode(<#CGContextRef context#>, <#CGBlendMode mode#>);
   
    
    
    for (scribble in self.scribbles) {
        
        CGContextSetLineWidth(context, [scribble[@"strokeWidth"] floatValue]);
        
        UIColor * strokeColor = scribble[@"strokeColor"];
        
        
        
        
        [strokeColor set];
        
        CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
        CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
        
        for (NSValue *pointValue in scribble[@"points"]) {
            
            CGPoint point = [pointValue CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
            
        }
        
        if ([scribble[@"fill" ] boolValue] == NO) {
            CGContextStrokePath(context);
            
            
            
       //     CGContextSetStrokeColorWithColor(context, [[UIColor colorWithWhite:1.0 alpha:0.5] CGColor]);
            
       //    [CGContextStrokePath(context) setAlpha: .5];
        } else {
            CGContextFillPath(context);
        }
        
     
        
        
    }
  
    
}


@end
