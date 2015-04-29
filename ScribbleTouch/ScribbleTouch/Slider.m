//
//  Slider.m
//  ScribbleTouch
//
//  Created by Jide Opeola on 1/14/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "Slider.h"

@implementation Slider


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [_rotate setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
}


@end
