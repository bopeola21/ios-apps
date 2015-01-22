//
//  SlickSlider.m
//  Capture
//
//  Created by Jide Opeola on 1/21/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "SlickSlider.h"

@implementation SlickSlider
{
    
    float   sliderPosition;
    
}

-(void)setStartPosition:(float)startPosition {
    
    sliderPosition = startPosition * self.frame.size.width;
    
    [self setNeedsDisplay];
    
    _startPosition = startPosition;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor colorWithRed:0.67
                     green:0.67
                      blue:0.67
                     alpha:1.0] set];
    

    
    CGContextSetLineWidth(context, 1);
    
    CGRect insetRect = CGRectInset(rect, 5, 5);
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:insetRect cornerRadius:rect.size.height/2];
    
    CGContextAddPath(context, path.CGPath);
    
    CGContextStrokePath(context);
    
    CGRect circleRect = CGRectInset(insetRect, 4, 4);
    circleRect.size.width = circleRect.size.height;
    
    float minX = circleRect.origin.x;
    float maxX = rect.size.width - minX - circleRect.size.width;
    
    sliderPosition -= circleRect.size.width / 2;
    
    if (sliderPosition > maxX) sliderPosition = maxX;
    if (sliderPosition < minX) sliderPosition = minX;
    
    circleRect.origin.x = sliderPosition;
    
    float value = (sliderPosition - minX) / (maxX - minX);
    
    [self.delegate sliderDidFinishUpdatingWithValue:value];
    
    [[UIColor colorWithRed:00.0
                     green:0.48
                      blue:1.0
                     alpha:1.0] set];
    
    CGContextFillEllipseInRect(context, circleRect);
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self updateSliderWithTouches:touches];
    
    
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self updateSliderWithTouches:touches];
    
}

-(void)updateSliderWithTouches:(NSSet *)touches {
    
    UITouch * touch = touches.allObjects.firstObject;
//    UITouch * touch = [[touches allObjects] firstObject];
    
    CGPoint location = [touch locationInView:self];
    
    sliderPosition = location.x;
    
    [self setNeedsDisplay];
    
    
}


@end
