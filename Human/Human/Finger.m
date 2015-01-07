//
//  Finger.m
//  Human
//
//  Created by Jide Opeola on 1/6/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "Finger.h"

@implementation Finger

@synthesize fingerPrint = _fingerPrint;

//NSString * fingerPrint = finger.finterPrint;
- (NSString *)fingerPrint {

    return _fingerPrint;
    
}

//finger.fingerPrint = @fingerprint";
-(void)setFingerPrint:(NSString *)fingerPrint {

    _fingerPrint = fingerPrint;
}

@end
