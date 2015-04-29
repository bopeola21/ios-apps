//
//  CircleButtons.m
//  Capture
//
//  Created by Jide Opeola on 1/20/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "CircleButtons.h"

@implementation CircleButtons


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.layer.cornerRadius = self.cornerSize;
    
    self.layer.masksToBounds = YES;
    
    
}


@end
