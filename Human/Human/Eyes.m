//
//  Eyes.m
//  Human
//
//  Created by Jide Opeola on 1/6/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "Eyes.h"

@implementation Eyes

//-(void)eyeColor:(NSString *)color {
//    
//}
//
//-(void)eyeRed:(BOOL)red{
//}

- (void)closeEye {
    
}

//- (void)checkIfEyeIsOpen {
//    
//    int timeOpen = 4; // 4 hours
//
//    
//    if (timeOpen > 2) {
//        
//        self.isRed = YES;
//        
//    }
//    
//}

- (BOOL)isRed {
    
    int timeOpen = 4; // 4 hours
    
    if (timeOpen > 2) {
        
        return YES;
        
    }
    
    return  NO;
    
}

@end
