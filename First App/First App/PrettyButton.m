//
//  PrettyButton.m
//  First App
//
//  Created by Jide Opeola on 1/5/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "PrettyButton.h"

@implementation PrettyButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.layer.cornerRadius = self.cornerSize;
    self.layer.masksToBounds = YES;
    
}


@end
