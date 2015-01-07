//
//  Eyes.h
//  Human
//
//  Created by Jide Opeola on 1/6/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Eyes : NSObject

@property (nonatomic) NSString * color;

@property (nonatomic) BOOL isRed;

//- (void)eyeColor:(NSString *)color;
//- (void)eyeRed:(BOOL)red;

- (void)closeEye;

//- (void)checkIfEyeIsOpen;

@end

// eye has been open for 4 hours

// body runs checkIfEyeIsOpen

// checkIfEyeIsOpen makes isRed = YES

// body if (eye.isRed) { make it go to sleep }
